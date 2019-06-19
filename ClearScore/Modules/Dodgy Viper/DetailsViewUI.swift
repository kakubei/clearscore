//
//  DetailsViewUI.swift
//  ClearScore
//
//  Created Alex Dearden on 19/06/2019.
//  Copyright © 2019 Alex Dearden. All rights reserved.
//

import UIKit

// MARK: DetailsViewUI Delegate -
/// DetailsViewUI Delegate
protocol DetailsViewUIDelegate {
    // Send Events to Module View, that will send events to the Presenter; which will send events to the Receiver e.g. Protocol OR Component.
}

// MARK: DetailsViewUI Data Source -
/// DetailsViewUI Data Source
protocol DetailsViewUIDataSource {
    // This will be implemented in the Module View.
    /// Set Object for the UI Component
    func objectFor(ui: DetailsViewUI) -> CreditScore
}

class DetailsViewUI: UIView {
    
    var delegate: DetailsViewUIDelegate?
    var dataSource: DetailsViewUIDataSource?
    
    var object : CreditScore?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUIElements()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func didMoveToWindow() {
        super.didMoveToWindow()
        setupConstraints()
    }
    
    fileprivate func setupUIElements() {
        // arrange subviews
    }
    
    fileprivate func setupConstraints() {
        // add constraints to subviews
    }
    
    /// Reloading the data and update the ui according to the new data
    func reloadData() {
        self.object = dataSource?.objectFor(ui: self)
        // Should update UI
    }
}
