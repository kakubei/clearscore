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
    var scorePercentage: Double? { get set }
    func fetchScores() -> CreditScore
}

struct ScoreViewModel {
    let requestManager: RequestManaging = RequestManager()
    
    
}
