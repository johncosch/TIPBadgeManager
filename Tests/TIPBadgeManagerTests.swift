//
//  TIPBadgeManagerTests.swift
//  TIPBadgeManagerTests
//
//  Created by John Coschigano on 6/17/15.
//  Copyright (c) 2015 John Coschigano. All rights reserved.
//

import UIKit
import XCTest
import TIPBadgeManager

class TIPBadgeManagerTests: XCTestCase {
    
    let VIEW_NAME = "exampleView"
    let TAB_BAR_NAME = "exampleTabBarName"
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        TIPBadgeManager.sharedInstance.removeBadgeObjFromDict([VIEW_NAME, TAB_BAR_NAME])
        super.tearDown()
    }
    
    func testAddBadgeSuperViewWithView(){
        let view = UIView()
        TIPBadgeManager.sharedInstance.addBadgeSuperview(VIEW_NAME, view: view)
        XCTAssert(isBadgeObjectAvalable(VIEW_NAME), "TIPBadgeManager should add badge object to tipBadgeObjDict")
    }
    
    func testAddBadgeSuperViewWithTabBarItem(){
        let tabBar = UITabBarItem()
        TIPBadgeManager.sharedInstance.addBadgeSuperview(TAB_BAR_NAME, view: tabBar)
        XCTAssert(isBadgeObjectAvalable(TAB_BAR_NAME), "TIPBadgeManager should add badge object to tipBadgeObjDict")
    }
    
    func isBadgeObjectAvalable(_ name: String) -> Bool{
        if TIPBadgeManager.sharedInstance.tipBadgeObjDict[name] != nil {
            return true
        } else {
            return false
        }
    }
    
    func testGetAndSetBadgeValueForView(){
        let view = UIView()
        let badgeVal = 2
        TIPBadgeManager.sharedInstance.addBadgeSuperview(VIEW_NAME, view: view)
        TIPBadgeManager.sharedInstance.setBadgeValue(VIEW_NAME, value: badgeVal)
        XCTAssert(TIPBadgeManager.sharedInstance.getBadgeValue(VIEW_NAME)! == badgeVal, "TIPBadgeManager should get correct badgeValues")
    }
    
    func testGetAndSetBadgeValueForTabBar(){
        let tabBar = UITabBarItem()
        let badgeVal = 2
        TIPBadgeManager.sharedInstance.addBadgeSuperview(TAB_BAR_NAME, view: tabBar)
        TIPBadgeManager.sharedInstance.setBadgeValue(TAB_BAR_NAME, value: badgeVal)
        XCTAssert(TIPBadgeManager.sharedInstance.getBadgeValue(TAB_BAR_NAME)! == badgeVal, "TIPBadgeManager should get correct badgeValues")
    }
    
    func testGetWithNullValue(){
        // It should also return nil if the view object has been deallocated, after much testing, I could not figure out a way to test with XCTest. 
        // for some reason arc does not release the local bv in the add badge method until its accessed again, making it difficult to test.
        // as far as I can tell this behavior is associated with arc and not the code.
        XCTAssert(TIPBadgeManager.sharedInstance.getBadgeValue("someName") == nil, "TIPBadgeManager should return nil if dict cannot find object")
    }
    
    func testClearAllBadgeValues(){
        //Not sure how to test the app Icon behavior
        //Can't put this in another function or views dealloc
        let view = UIView()
        TIPBadgeManager.sharedInstance.addBadgeSuperview(VIEW_NAME, view: view)
        let tabBar = UITabBarItem()
        TIPBadgeManager.sharedInstance.addBadgeSuperview(TAB_BAR_NAME, view: tabBar)
        
        setExampleValsForBadges()
        TIPBadgeManager.sharedInstance.clearAllBadgeValues(true)
        XCTAssert(areObjectBadgeValuesZero(), "TIPBadgeManager should zero out all badge values including application Icon badge")
    }
    
    
    func setExampleValsForBadges(){
        let viewBadgeVal: Int = 2
        let tabBarItemBadgeVal: Int = 3
        let appIconVal: Int = 4
        
        TIPBadgeManager.sharedInstance.setBadgeValue(VIEW_NAME, value: viewBadgeVal)
        TIPBadgeManager.sharedInstance.setBadgeValue(TAB_BAR_NAME, value: tabBarItemBadgeVal)
        let settings = UIUserNotificationSettings(types: UIUserNotificationType.badge, categories: nil)
        UIApplication.shared.registerUserNotificationSettings(settings)
        UIApplication.shared.applicationIconBadgeNumber = appIconVal
    }
    
    func areObjectBadgeValuesZero() -> Bool{
        let viewBadgeVal = TIPBadgeManager.sharedInstance.getBadgeValue(VIEW_NAME)
        let tabBarItemBadgeVal = TIPBadgeManager.sharedInstance.getBadgeValue(TAB_BAR_NAME)
        if viewBadgeVal == 0 && tabBarItemBadgeVal == 0 {
            return true
        } else {
            return false
        }
    }
    
    func testRemoveBadgeObjFromDict(){
        let view = UIView()
        TIPBadgeManager.sharedInstance.addBadgeSuperview(VIEW_NAME, view: view)
        TIPBadgeManager.sharedInstance.removeBadgeObjFromDict([VIEW_NAME])
        XCTAssert(!isBadgeObjectAvalable(VIEW_NAME), "TIPBadgeManager should remove the badge object from the tipBadgeObjDict")
    }
    
    func testcleanBadgeObjectDict(){
        let view = UIView()
        TIPBadgeManager.sharedInstance.addBadgeSuperview(VIEW_NAME, view: view)
        XCTAssert(TIPBadgeManager.sharedInstance.tipBadgeObjDict.count == 1, "Count of the tip badge obj dict is incremented correctly")
        if let tipViewObj : TIPViewObject = TIPBadgeManager.sharedInstance.tipBadgeObjDict[VIEW_NAME] as? TIPViewObject {
            tipViewObj.view = nil
        }
        TIPBadgeManager.sharedInstance.cleanBadgeObjectDict()
        XCTAssert(TIPBadgeManager.sharedInstance.tipBadgeObjDict.count == 0, "cleanBadgeObjectDict should remove objects with nil views")
        
    }
    
    func testSetBadgeValues(){
        let view = UIView()
        TIPBadgeManager.sharedInstance.addBadgeSuperview(VIEW_NAME, view: view)
        let tabBarItem = UITabBarItem()
        TIPBadgeManager.sharedInstance.addBadgeSuperview(TAB_BAR_NAME, view: tabBarItem)
        
        TIPBadgeManager.sharedInstance.setAllBadgeValues(5, appIconBadge: true)
        XCTAssert((TIPBadgeManager.sharedInstance.getBadgeValue(VIEW_NAME) == 5 && TIPBadgeManager.sharedInstance.getBadgeValue(TAB_BAR_NAME) == 5),"Should set all badge values to the same value")
    }
    
}
