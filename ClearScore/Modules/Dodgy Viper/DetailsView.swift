//
//  DetailsView.swift
//  ClearScore
//
//  Created Alex Dearden on 19/06/2019.
//  Copyright © 2019 Alex Dearden. All rights reserved.
//

import UIKit

/// Details Module View
class DetailsView: UIViewController {
    
    private let ui = DetailsViewUI()
    private var presenter: DetailsPresenterProtocol!
    
    private var object : CreditScore?
    
    override func loadView() {
        // setting the custom view as the view controller's view
        ui.delegate = self
        ui.dataSource = self
        view = ui
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = DetailsPresenter(view: self)
        
        // Informs the Presenter that the View is ready to receive data.
        presenter.fetch(objectFor: self)
    }
    
}

// MARK: - extending DetailsView to implement it's protocol
extension DetailsView: DetailsViewProtocol {
    func set(object: CreditScore) {
        
    }
    
    
}

// MARK: - extending DetailsView to implement the custom ui view delegate
extension DetailsView: DetailsViewUIDelegate {
    
}

// MARK: - extending DetailsView to implement the custom ui view data source
extension DetailsView: DetailsViewUIDataSource {
    func objectFor(ui: DetailsViewUI) -> CreditScore {        
        #warning("Requires real implementation")
        return CreditScore(score: 350, clientRef: "221", maxScoreValue: 700, minScoreValue: 0, hasEverDefaulted: false, hasEverBeenDelinquent: true, percentageCreditUsed: 44)
    }
    
    // Pass the pre-defined object to the dataSource.
}
