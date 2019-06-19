//
//  DetailsRouter.swift
//  ClearScore
//
//  Created by Alex Dearden on 19/06/2019.
//  Copyright © 2019 Alex Dearden. All rights reserved.
//

import Foundation
import UIKit

class DetailsRouter {

    // MARK: Properties

    weak var view: UIViewController?

    // MARK: Static methods

    static func setupModule() -> DetailsViewController {
        let viewController = UIStoryboard.loadViewController() as DetailsViewController
        let presenter = DetailsPresenter()
        let router = DetailsRouter()
        let interactor = DetailsInteractor()

        viewController.presenter =  presenter

        presenter.view = viewController
        presenter.router = router
        presenter.interactor = interactor

        router.view = viewController

        interactor.output = presenter

        return viewController
    }
}

extension DetailsRouter: DetailsWireframe {
    // TODO: Implement wireframe methods
}
