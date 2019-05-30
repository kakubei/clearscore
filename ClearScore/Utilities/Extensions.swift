//
//  Extensions.swift
//  ClearScore
//
//  Created by Alex Dearden on 30/05/2019.
//  Copyright © 2019 Alex Dearden. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    func alert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
