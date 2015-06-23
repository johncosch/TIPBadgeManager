//
//  TIPViewObjectTests.swift
//  TIPBadgeManager
//
//  Created by John Coschigano on 6/22/15.
//  Copyright (c) 2015 John Coschigano. All rights reserved.
//

import UIKit
import XCTest
import TIPBadgeManager

class TIPViewObjectTests: XCTestCase {
    
    var view: UIView?
    var tipViewObject: TIPViewObject?

    override func setUp() {
        super.setUp()
        view = UIView()
        tipViewObject = TIPViewObject(view: view!)
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testSetBadgeValue(){
        let badgeVal = 1
        tipViewObject!.badgeValue = badgeVal
        XCTAssert(tipViewObject!.badgeValue == badgeVal, "SetBadgeValue make badge value should be equal its input")
    }
    
    func testSetBadgeValueZero() {
        let badgeVal : Int = 0
        tipViewObject!.badgeValue = 0
        XCTAssert(tipViewObject!.badgeValue == badgeVal, "SetBadgeValue should make badge value equal to its input")
    }
    
    func testSetBadgeValueLessThanZero(){
        let badgeVal : Int = 0
        tipViewObject!.badgeValue = 0
        XCTAssert(tipViewObject!.badgeValue == badgeVal, "SetBadgeValue make badge value should be equal its input")
    }


}
