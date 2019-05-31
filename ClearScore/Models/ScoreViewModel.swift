//
//  ScoreViewModel.swift
//  ClearScore
//
//  Created by Alex Dearden on 29/05/2019.
//  Copyright © 2019 Alex Dearden. All rights reserved.
//

import Foundation
import RxSwift

protocol ScoreViewModeling {
    var scorePercentage: PublishSubject<Int> { get set }
    var creditScore: PublishSubject<String> { get }
    var maxScore: PublishSubject<String> { get }
    var apiError: PublishSubject<Error> { get }
    
    func fetchScores()
}

struct ScoreViewModel: ScoreViewModeling {
    var scorePercentage = PublishSubject<Int>()
    var creditScore = PublishSubject<String>()
    var maxScore = PublishSubject<String>()
    var apiError = PublishSubject<Error>()
    
    private let requestManager: RequestManaging = RequestManager()
    private let disposeBag = DisposeBag()
    
    init() {
        fetchScores()
    }
    
    func fetchScores() {
        requestManager.fetchScore()
            .subscribe { result in
                switch result {
                case .success(let score):
                    self.calculateScore(from: score)
                case .error(let error):
                    self.apiError.onNext(error)
                }
            }
        
        .disposed(by: disposeBag)
    }
    
    private func calculateScore(from crediScore: CreditScore) {
        let score = crediScore.score
        let maxScore = "out of " + crediScore.maxScoreValue.description
        let percentage = calculatePercentage(from: crediScore)
        
        self.creditScore.onNext(score.description)
        self.maxScore.onNext(maxScore)
        self.scorePercentage.onNext(percentage)
    }
    
    private func calculatePercentage(from creditScore: CreditScore) -> Int {
        let percentage = creditScore.maxScoreValue / creditScore.score
        return percentage
    }

}
