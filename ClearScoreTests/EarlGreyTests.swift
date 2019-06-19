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
    
    func testTitleLabel() {
        EarlGrey.selectElement(with: grey_accessibilityID("title"))
            .assert(grey_text("Your credit score is"))
    }
    
    func testScoreLabel() {
        EarlGrey.selectElement(with: grey_accessibilityID("score"))
            .assert(grey_notNil())
            .assert(grey_not(grey_text("")))
    }
    
    func testTotalLabel() {
        EarlGrey.selectElement(with: grey_accessibilityID("total"))
            .assert(grey_text("out of 700"))
    }

}
