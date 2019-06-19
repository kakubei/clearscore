//
//  DetailsContracts.swift
//  ClearScore
//
//  Created Alex Dearden on 19/06/2019.
//  Copyright © 2019 Alex Dearden. All rights reserved.
//

import UIKit

//MARK: View -
/*
 Should replace "class" with "BaseViewProtocol" if available;
 & that will allow the View to act as a UIViewController;
 & Implement common view functions.
 */
/// Details Module View Protocol
protocol DetailsViewProtocol: class {
    // Update UI with value returned.
    /// Set the view Object of Type CreditScore
    func set(object: CreditScore)
}

//MARK: Interactor -
/// Details Module Interactor Protocol
protocol DetailsInteractorProtocol {
    // Fetch Object from Data Layer
    func fetch(objectFor presenter: DetailsPresenterProtocol)
}

//MARK: Presenter -
/// Details Module Presenter Protocol
protocol DetailsPresenterProtocol {
    /// The presenter will fetch data from the Interactor thru implementing the Interactor fetch function.
    func fetch(objectFor view: DetailsViewProtocol)
    /// The Interactor will inform the Presenter a successful fetch.
    func interactor(_ interactor: DetailsInteractorProtocol, didFetch object: CreditScore)
    /// The Interactor will inform the Presenter a failed fetch.
    func interactor(_ interactor: DetailsInteractorProtocol, didFailWith error: Error)
}

//MARK: Router (aka: Wireframe) -
/// Details Module Router Protocol
protocol DetailsRouterProtocol {
    // Show Details of Entity Object coming from ParentView Controller.
    // func showDetailsFor(object: CreditScore, parentViewController viewController: UIViewController)
}
