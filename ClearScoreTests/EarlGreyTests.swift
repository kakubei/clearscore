//
//  EarlGreyTests.swift
//  ClearScoreTests
//
//  Created by Alex Dearden on 19/06/2019.
//  Copyright © 2019 Alex Dearden. All rights reserved.
//

import XCTest
import EarlGrey

class EarlGreyTests: XCTestCase {

    func testPresenceOfKeyWindow() {
        EarlGrey.selectElement(with: grey_keyWindow())
            .assert(grey_sufficientlyVisible())
    }

}
