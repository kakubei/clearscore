//
//  DetailsPresenter.swift
//  ClearScore
//
//  Created Alex Dearden on 19/06/2019.
//  Copyright © 2019 Alex Dearden. All rights reserved.
//

import UIKit

/// Details Module Presenter
class DetailsPresenter {
    
    weak private var _view: DetailsViewProtocol?
    private var interactor: DetailsInteractorProtocol
    private var wireframe: DetailsRouterProtocol
    
    init(view: DetailsViewProtocol) {
        self._view = view
        self.interactor = DetailsInteractor()
        self.wireframe = DetailsRouter()
    }
}

// MARK: - extending DetailsPresenter to implement it's protocol
extension DetailsPresenter: DetailsPresenterProtocol {
    func fetch(objectFor view: DetailsViewProtocol) {
        interactor.fetch(objectFor: self)
    }
    
    func interactor(_ interactor: DetailsInteractorProtocol, didFetch object: CreditScore) {
        
    }
    
    func interactor(_ interactor: DetailsInteractorProtocol, didFailWith error: Error) {
        
    }
    
    
}
