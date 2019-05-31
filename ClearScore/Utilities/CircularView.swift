//
//  CircularView.swift
//  ClearScore
//
//  Created by Alex Dearden on 31/05/2019.
//  Copyright © 2019 Alex Dearden. All rights reserved.
//

import UIKit

class CircularView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup() {
        layer.cornerRadius = bounds.width / 2
        layer.borderColor = UIColor(white: 0.3, alpha: 1).cgColor
        layer.borderWidth = 1
    }
}
