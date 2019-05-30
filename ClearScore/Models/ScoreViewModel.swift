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
    var scorePercentage: PublishSubject<Double> { get set }
    var creditScore: PublishSubject<CreditScore> { get }
    var apiError: PublishSubject<Error> { get }
    
    func fetchScores()
}

struct ScoreViewModel: ScoreViewModeling {
    var scorePercentage = PublishSubject<Double>()
    var creditScore = PublishSubject<CreditScore>()
    var apiError = PublishSubject<Error>()
    
    private let requestManager: RequestManaging = RequestManager()
    private let disposeBag = DisposeBag()
    
    func fetchScores() {
        requestManager.fetchScore()
            .subscribe { result in
                switch result {
                case .success(let score):
                    self.creditScore.onNext(score)
                case .error(let error):
                    self.apiError.onNext(error)
                case .completed:
                    debugPrint("Nothing to show 😿")
                }
            }
        
        .disposed(by: disposeBag)
    }

}
