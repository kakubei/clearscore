//
//  ScoreDecoder.swift
//  ClearScore
//
//  Created by Alex Dearden on 29/05/2019.
//  Copyright © 2019 Alex Dearden. All rights reserved.
//

import Foundation
import Moya

protocol ScoreDecoding {
    func decode(_ response: Response) throws -> CreditScore    
}

// If the decoder ever changes (Swift 4 for example) we can easily change just this object
struct ScoreDecoder: ScoreDecoding {
    
    let jsonDecoder: JSONDecoder = {
        let jsonDecoder = JSONDecoder()
        jsonDecoder.dateDecodingStrategy = .secondsSince1970
        return jsonDecoder
    }()
    
    func decode(_ response: Response) throws -> CreditScore {
        do {
            let values = try jsonDecoder.decode(CreditScoreRoot.self, from: response.data)
            let creditScore = values.creditReportInfo
            return creditScore
        } catch {
            throw(APIError.decodeError)
        }
    }
}
