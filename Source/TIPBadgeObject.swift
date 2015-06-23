//
//  File.swift
//  TIPBadgeManager
//
//  Created by John Coschigano on 6/17/15.
//  Copyright (c) 2015 John Coschigano. All rights reserved.
//

import Foundation

public protocol TIPBadgeObject {
    var badgeValue: Int {get set}
}


public class TIPViewObject: NSObject, TIPBadgeObject{
    
    public var observerTriggered: Bool = false
    public var badgeValue: Int = 0 {
        willSet(newVal){
            changeBadgeValue(newVal)
        }
    }
    
    public weak var view: UIView?
    public var badgeView:TIPBadgeView?
    
    public init(view: UIView){
        self.view = view
        super.init()
    }
    
    func addBadge(){
        badgeView = TIPBadgeView()
        self.view!.addSubview(badgeView!)
        
        self.badgeView!.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        var badgeHeightConstraint = NSLayoutConstraint(item: self.badgeView!, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.Height, multiplier: 1.0, constant: 18.0)
        
        self.badgeView!.addConstraints([badgeHeightConstraint])
        
        var rightConstraint = NSLayoutConstraint(item: self.view!, attribute: NSLayoutAttribute.Right, relatedBy: NSLayoutRelation.Equal, toItem: self.badgeView!, attribute: NSLayoutAttribute.Left, multiplier: 1.0, constant: 7.0)
        
        var topConstraint = NSLayoutConstraint(item: self.view!, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: self.badgeView!, attribute: NSLayoutAttribute.Top, multiplier: 1.0, constant: 5.0)
        
        self.view!.addConstraints([rightConstraint, topConstraint])
    }
    
    public func changeBadgeValue(value : Int){
        if value > 0 {
            if badgeView == nil {
                addBadge()
            }
            self.badgeView!.setBadgeValue(value)
        } else {
            clearBadge()
        }
    }
    
    public func clearBadge(){
        if badgeView != nil {
            self.badgeView!.removeFromSuperview()
            self.badgeView = nil
        }
    }
}

public class TIPTabBarItemObject: NSObject, TIPBadgeObject {
    
    public weak var tabBar:UITabBarItem?
    
    public var badgeValue: Int = 0 {
        willSet(newVal){
            changeBadgeValue(newVal)
        }
    }
    
    public init(tabBar: UITabBarItem){
        self.tabBar = tabBar
        super.init()
    }
    
    public func changeBadgeValue(value : Int){
        if value > 0 {
            self.tabBar!.badgeValue = "\(value)"
        } else {
            self.tabBar!.badgeValue = nil
        }
    }
}