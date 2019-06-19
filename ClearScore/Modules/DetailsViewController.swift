//
//  DetailsViewController.swift
//  ClearScore
//
//  Created by Alex Dearden on 19/06/2019.
//  Copyright © 2019 Alex Dearden. All rights reserved.
//

import Foundation
import UIKit

class DetailsViewController: BaseViewController, StoryboardLoadable {

    // MARK: Properties

    var presenter: DetailsPresentation?

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension DetailsViewController: DetailsView {
    // TODO: implement view output methods
}
