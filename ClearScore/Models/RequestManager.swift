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
    case invalidEndpoint
    case invalidResponse
    case noData
    case decodeError
}

protocol RequestManaging {
    func fetchScore() -> Maybe<CreditScore>
}

protocol ScoreDecoding {
    var jsonDecoder: JSONDecoder { get }
}

struct ScoreDecoder: ScoreDecoding {
    let jsonDecoder: JSONDecoder = {
        let jsonDecoder = JSONDecoder()
        jsonDecoder.dateDecodingStrategy = .secondsSince1970
        return jsonDecoder
    }()
}
