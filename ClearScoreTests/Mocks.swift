//
//  Mocks.swift
//  ClearScoreTests
//
//  Created by Alex Dearden on 29/05/2019.
//  Copyright © 2019 Alex Dearden. All rights reserved.
//

import Foundation
import RxSwift

struct MockScoreViewModel: ScoreViewModeling {
    var scorePercentage = PublishSubject<Int>()
    var creditScore = PublishSubject<String>()
    var maxScore = PublishSubject<String>()
    var apiError = PublishSubject<Error>()
    
    func fetchScores() {
        let creditScoreObject = CreditScore(score: 325, clientRef: "123", maxScoreValue: 700, minScoreValue: 0)
        
        creditScore.onNext(creditScoreObject.score.description)
        maxScore.onNext(creditScoreObject.maxScoreValue.description)
        scorePercentage.onNext(50)
        
        throwError()
    }
    
    private func throwError() {
        apiError.onNext(APIError.apiError)
    }
    
    
}
