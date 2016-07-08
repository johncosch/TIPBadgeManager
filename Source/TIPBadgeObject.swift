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
    public weak var badgeView:TIPBadgeView?
    
    public init(view: UIView){
        self.view = view
        super.init()
    }
    
    func addBadge(){
       let bv : TIPBadgeView? = TIPBadgeView()
       self.view!.addSubview(bv!)
        
       bv!.translatesAutoresizingMaskIntoConstraints = false
        
        let badgeHeightConstraint = NSLayoutConstraint(item: bv!, attribute: NSLayoutAttribute.height, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.height, multiplier: 1.0, constant: 18.0)
        
        bv!.addConstraints([badgeHeightConstraint])
        
        let rightConstraint = NSLayoutConstraint(item: self.view!, attribute: NSLayoutAttribute.right, relatedBy: NSLayoutRelation.equal, toItem: bv!, attribute: NSLayoutAttribute.left, multiplier: 1.0, constant: 7.0)
        
        let topConstraint = NSLayoutConstraint(item: self.view!, attribute: NSLayoutAttribute.top, relatedBy: NSLayoutRelation.equal, toItem: bv!, attribute: NSLayoutAttribute.top, multiplier: 1.0, constant: 5.0)
        
        self.view!.addConstraints([rightConstraint, topConstraint])
        
        self.badgeView = bv
    }
    
    public func changeBadgeValue(_ value : Int){
        if value > 0 {
            if self.badgeView == nil {
                addBadge()
            }
            self.badgeView!.setBadgeValue(value)
        } else {
            clearBadge()
        }
    }
    
    public func clearBadge(){
        if self.badgeView != nil {
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
    
    public func changeBadgeValue(_ value : Int){
        if value > 0 {
            self.tabBar!.badgeValue = "\(value)"
        } else {
            self.tabBar!.badgeValue = nil
        }
    }
}
