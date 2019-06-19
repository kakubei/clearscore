//
//  DetailsPresenter.swift
//  ClearScore
//
//  Created by Alex Dearden on 19/06/2019.
//  Copyright © 2019 Alex Dearden. All rights reserved.
//

import Foundation

class DetailsPresenter {

    // MARK: Properties

    weak var view: DetailsView?
    var router: DetailsWireframe?
    var interactor: DetailsUseCase?
}

extension DetailsPresenter: DetailsPresentation {
    // TODO: implement presentation methods
}

extension DetailsPresenter: DetailsInteractorOutput {
    // TODO: implement interactor output methods
}
