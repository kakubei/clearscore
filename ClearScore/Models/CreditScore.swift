//
//  CreditScore.swift
//  ClearScore
//
//  Created by Alex Dearden on 29/05/2019.
//  Copyright © 2019 Alex Dearden. All rights reserved.
//

import Foundation

struct CreditScoreRoot: Decodable {
    let creditReportInfo: CreditScore
}

struct CreditScore: Decodable {
    let score: Int
    let clientRef: String
    let maxScoreValue: Int
    let minScoreValue: Int
    let hasEverDefaulted: Bool
    let hasEverBeenDelinquent: Bool
    let percentageCreditUsed: Int
}
