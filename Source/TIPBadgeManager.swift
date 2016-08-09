//
//  TIPBadgeManager.swift
//  ExampleTIPBadgeManager
//
//  Created by John Coschigano on 6/16/15.
//  Copyright (c) 2015 John Coschigano. All rights reserved.
//

import UIKit

public class TIPBadgeManager {
    
    public static let sharedInstance = TIPBadgeManager()
    
    public var tipBadgeObjDict = [String : TIPBadgeObject]()
    
    private init() {}
    
    public func addBadgeSuperview(_ name: String, view: AnyObject){
        var badgeObj: TIPBadgeObject?
        
        if let superView = view as? UIView {
            badgeObj = TIPViewObject(view: superView)
        }
        else if let superView = view as? UITabBarItem {
            badgeObj = TIPTabBarItemObject(tabBar: superView)
        }
        tipBadgeObjDict[name] = badgeObj!
    }
    
    public func setBadgeValue(_ key : String, value : Int){
        tipBadgeObjDict[key]?.badgeValue = value
    }
    
    public func setAllBadgeValues(_ value : Int, appIconBadge: Bool){
        for (key, _) in tipBadgeObjDict {
            if !isTIPViewObjNil(tipBadgeObjDict[key]!) || !isTIPTabBarItemObjNil(tipBadgeObjDict[key]!){
                setBadgeValue(key, value: value)
            }
        }
        
        if appIconBadge {
            setAppIconBadgeValue(value)
        }
    }
    
    func setAppIconBadgeValue(_ value : Int) {
        UIApplication.shared.applicationIconBadgeNumber = value
    }
    
    public func getBadgeValue(_ key : String) -> Int? {
        if tipBadgeObjDict[key] != nil {
            if !isTIPViewObjNil(tipBadgeObjDict[key]!) || !isTIPTabBarItemObjNil(tipBadgeObjDict[key]!){
                return tipBadgeObjDict[key]!.badgeValue
            }
        }
       return nil
    }
    
    func isTIPViewObjNil(_ tipBadgeObject: TIPBadgeObject) -> Bool{
        if let tipViewObject = tipBadgeObject as? TIPViewObject {
            if tipViewObject.view != nil {
                return false
            }
        }
        return true
    }
    
    func isTIPTabBarItemObjNil(_ tipBadgeObject: TIPBadgeObject) -> Bool{
        if let tipTabBarItemObject = tipBadgeObject as? TIPTabBarItemObject {
            if tipTabBarItemObject.tabBar != nil {
                return false
            }
        }
        return true
    }
    
    public func clearAllBadgeValues(_ clearAppIconBadge: Bool){
        clearAllBadgeValues()
        if clearAppIconBadge { setAppIconBadgeValue(0) }
    }
    
    func clearAllBadgeValues(){
        for (key, _) in tipBadgeObjDict {
            setBadgeValue(key, value: 0)
        }
    }
    
    
    public func removeBadgeObjFromDict(_ keys : [String]) {
        for key in keys {
            tipBadgeObjDict.removeValue(forKey: key)
        }
    }
    
    //not yet called progammatically
    public func cleanBadgeObjectDict(){
        for (key, value) in tipBadgeObjDict {
            if let _ = value as? TIPViewObject {
                cleanTipViewObject(key)
            }
            if let _ = value as? TIPTabBarItemObject {
                cleanTipTabBarItemObject(key)
            }
        }
    }
    
    func cleanTipViewObject(_ key : String){
        let tipViewObj : TIPViewObject = tipBadgeObjDict[key] as! TIPViewObject
        if tipViewObj.view == nil {
            removeBadgeObjFromDict([key])
        }
    }
    
    func cleanTipTabBarItemObject(_ key : String){
        let tipTabBarItemObj : TIPTabBarItemObject = tipBadgeObjDict[key] as! TIPTabBarItemObject
        if tipTabBarItemObj.tabBar == nil {
            removeBadgeObjFromDict([key])
        }
    }
    
}
