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
    func fetchScore() -> Single<CreditScore>
}

struct RequestManager: RequestManaging {
    
    private let scoreDecoder: ScoreDecoding = ScoreDecoder()
    
    public func fetchScore() -> Single<CreditScore> {
        let provider = MoyaProvider<CreditScoreAPI>()
        
        return Single.create { single in
            
            provider.request(.getScore) { result in
                switch result {
                case let .success(response):
                    do {
                        let creditScore = try self.scoreDecoder.decode(response)
                        single(.success(creditScore))
                    } catch {
                        single(.error(APIError.decodeError))
                    }
                    
                case let .failure(error):
                    debugPrint("### Error from RequestManager:", error)
                    single(.error(error))
                }
            }
            
            return Disposables.create()
        }
    }
    
}
