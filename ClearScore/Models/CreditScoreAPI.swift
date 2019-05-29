//
//  CreditScoreAPI.swift
//  ClearScore
//
//  Created by Alex Dearden on 29/05/2019.
//  Copyright © 2019 Alex Dearden. All rights reserved.
//

import Foundation
import Moya


public enum CreditScoreAPI {
    case getScore
}

extension CreditScoreAPI: TargetType {
    public var baseURL: URL {
        return URL(string: "https://5lfoiyb0b3.execute-api.us-west-2.amazonaws.com/")!
    }
    
    public var path: String {
        return "prod/mockcredit/values"
    }
    
    public var method: Moya.Method {
        return .get
    }
    
    public var sampleData: Data {
        return """
            {
                "accountIDVStatus": "PASS",
                "creditReportInfo": { "score": 514, "scoreBand": 4, "clientRef": "CS-SED-655426-708782", "status": "MATCH", "maxScoreValue": 700, "minScoreValue": 0, "monthsSinceLastDefaulted": -1, "hasEverDefaulted": false, "monthsSinceLastDelinquent": 1, "hasEverBeenDelinquent": true, "daysUntilNextReport": 9
                }
            }
            """.data(using: String.Encoding.utf8)!
    }
    
    public var task: Task {
        switch self {
        case .getScore:
            return .requestPlain
        }
    }
    
    public var headers: [String : String]? {
        return [:]
    }
    
    
}
