//
//  ScoreViewController.swift
//  ClearScore
//
//  Created by Alex Dearden on 29/05/2019.
//  Copyright © 2019 Alex Dearden. All rights reserved.
//

import UIKit
import RxSwift

class ScoreViewController: UIViewController {
    
    private let viewModel: ScoreViewModeling = ScoreViewModel()
    private let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupObservers()
    }
    
    private func setupObservers() {
        viewModel.creditScore.asObservable()
            .subscribe(onNext: { [weak self] score in
                self?.showScore(score)
            }).disposed(by: disposeBag)
        
        viewModel.apiError.asObservable()
            .subscribe(onNext: { [weak self] error in
                self?.alert(title: "Error", message: error.localizedDescription)
            }).disposed(by: disposeBag)
    }

    // WARNING: Requires implementation
    private func showScore(_ score: CreditScore) {
        
    }
    
}


