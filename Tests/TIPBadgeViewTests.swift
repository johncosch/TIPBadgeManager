//
//  TIPBadgeView.swift
//  TIPBadgeManager
//
//  Created by John Coschigano on 6/22/15.
//  Copyright (c) 2015 John Coschigano. All rights reserved.
//

import UIKit
import XCTest
import TIPBadgeManager

class TIPBadgeViewTests: XCTestCase {
    
    var tipBadgeView: TIPBadgeView?

    override func setUp() {
        super.setUp()
        tipBadgeView = TIPBadgeView()
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func testSetBadgeValue() {
        tipBadgeView?.setBadgeValue(5)
        assert(tipBadgeView?.label.text == " 5 ", "setBadgeValue should properly set label value")
    }
    
    func testSetMarginsForValGreaterThanTen() {
        let standardMargin = tipBadgeView!.STANDARD_MARGIN
        tipBadgeView!.setMarginsForVal(11)
        assert(constraintsAreEqualTo(standardMargin), "setMarginsForVal should set val to STANDARD_MARGIN")
    }
    
    func testSetMarginsForValLessThanTen() {
        let largerMargin = tipBadgeView!.LARGER_MARGIN
        tipBadgeView!.setMarginsForVal(1)
        assert(constraintsAreEqualTo(largerMargin), "setMarginsForVal should set val to LARGER_MARGIN")
    }
    
    func constraintsAreEqualTo(_ val : CGFloat) -> Bool{
        if tipBadgeView!.leftLabelConstraint!.constant == val && tipBadgeView!.rightLabelConstraint!.constant == val {
            return true
        } else {
            return false
        }
    }

}
