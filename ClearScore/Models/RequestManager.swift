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
    func fetchScore() -> Maybe<CreditScore>
}

struct RequestManager: RequestManaging {
    
    private let scoreDecoder: ScoreDecoding = ScoreDecoder()
    
    public func fetchScore() -> Maybe<CreditScore> {
        let provider = MoyaProvider<CreditScoreAPI>()
        
        return Maybe.create { maybe in
            
            provider.request(.getScore) { result in
                switch result {
                case let .success(response):
                    do {
                        let creditScore = try self.scoreDecoder.decode(response)
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
    
}
