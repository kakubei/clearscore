//
//  ScoreViewController.swift
//  ClearScore
//
//  Created by Alex Dearden on 29/05/2019.
//  Copyright © 2019 Alex Dearden. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import RxGesture

class ScoreViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var outOfLabel: UILabel!
    
    private let viewModel: ScoreViewModeling = ScoreViewModel()
    private let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupObservers()
        setupTapGesture()
    }
    
    private func setupObservers() {
        viewModel.creditScore.asDriver(onErrorJustReturn: "")
            .drive(scoreLabel.rx.text)
            .disposed(by: disposeBag)
        
        viewModel.maxScore.asDriver(onErrorJustReturn: "")
            .drive(outOfLabel.rx.text)
            .disposed(by: disposeBag)

        viewModel.apiError.asObservable()
            .subscribe(onNext: { [weak self] error in
                self?.alert(title: "Error", message: error.localizedDescription)
            }).disposed(by: disposeBag)
    }
    
    private func setupTapGesture() {
        view.rx
            .tapGesture()
            .when(.recognized)
            .subscribe(onNext: { _ in
                
            })
            .disposed(by: disposeBag)
    }

}


