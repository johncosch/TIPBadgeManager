//
//  TIPTabBarItemObjectTests.swift
//  TIPBadgeManager
//
//  Created by John Coschigano on 6/22/15.
//  Copyright (c) 2015 John Coschigano. All rights reserved.
//

import UIKit
import XCTest
import TIPBadgeManager

class TIPTabBarItemObjectTests: XCTestCase {
    
    var view: UITabBarItem?
    var tipTabBarItemObject: TIPTabBarItemObject?

    override func setUp() {
        super.setUp()
        view = UITabBarItem()
        tipTabBarItemObject = TIPTabBarItemObject(tabBar: view!)
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func testSetBadgeValue(){
        let badgeVal = 1
        tipTabBarItemObject!.badgeValue = badgeVal
        XCTAssert(tipTabBarItemObject!.badgeValue == badgeVal, "SetBadgeValue make badge value should be equal its input")
        let tabViewBadgeVal: String = "\(badgeVal)"
        XCTAssert(view!.badgeValue == tabViewBadgeVal, "SetBadgeValue should make UIViews badge value equal to its input as a string")
    }
    
    func testSetBadgeValueZero(){
        let badgeVal = 0
        tipTabBarItemObject!.badgeValue = badgeVal
        XCTAssert(tipTabBarItemObject!.badgeValue == badgeVal, "SetBadgeValue make badge value should be equal its input")
        XCTAssert(view!.badgeValue == nil, "SetBadgeValue should make UIViews badge value equal to nil")
    }
    
    func testSetBadgeValueLessThanZero(){
        let badgeVal = -1
        tipTabBarItemObject!.badgeValue = badgeVal
        XCTAssert(tipTabBarItemObject!.badgeValue == badgeVal, "SetBadgeValue make badge value should be equal its input")
        XCTAssert(view!.badgeValue == nil, "SetBadgeValue should make UIViews badge value equal to nil")
    }

}
