//
//  RequestManager.swift
//  ClearScore
//
//  Created by Alex Dearden on 29/05/2019.
//  Copyright © 2019 Alex Dearden. All rights reserved.
//

import Foundation
import RxSwift
import Moya

public enum APIError: Error {
    case apiError
    case decodeError
}

protocol RequestManaging {
    func scoreDecoder(_ response: Response) throws -> CreditScore
    func fetchScore() -> Maybe<CreditScore>
}

protocol ScoreDecoding {
    var jsonDecoder: JSONDecoder { get }
}

// A separate type so we can use it in tests also
// And if it ever changes (Swift 4 for example) we can easily change just this object
struct ScoreDecoder: ScoreDecoding {
    let jsonDecoder: JSONDecoder = {
        let jsonDecoder = JSONDecoder()
        jsonDecoder.dateDecodingStrategy = .secondsSince1970
        return jsonDecoder
    }()
}

struct RequestManager: RequestManaging {
    
    public func fetchScore() -> Maybe<CreditScore> {
        let provider = MoyaProvider<CreditScoreAPI>()
        
        return Maybe.create { maybe in
            
            provider.request(.getScore) { result in
                switch result {
                case let .success(response):
                    do {
                        let creditScore = try self.scoreDecoder(response)
                        maybe(.success(creditScore))
                    } catch {
                        maybe(.error(APIError.decodeError))
                    }
                    
                case let .failure(error):
                    debugPrint("### Error from RequestManager:", error)
                    maybe(.error(error))
                }
            }
            
            return Disposables.create()
        }
    }
    
    internal func scoreDecoder(_ response: Response) throws -> CreditScore {
        let scoreDecoder: ScoreDecoding = ScoreDecoder()
        
        do {
            let values = try scoreDecoder.jsonDecoder.decode(CreditScoreRoot.self, from: response.data)
            let creditScore = values.creditReportInfo
            return creditScore
        } catch {
            throw(APIError.decodeError)
        }
    }
    
}
