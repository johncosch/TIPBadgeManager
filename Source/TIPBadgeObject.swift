//
//  File.swift
//  TIPBadgeManager
//
//  Created by John Coschigano on 6/17/15.
//  Copyright (c) 2015 John Coschigano. All rights reserved.
//

import Foundation

protocol TIPBadgeObject {
    var badgeValue: Int {get set}
}

class TIPViewObject: TIPBadgeObject {
    //you want these objects to be totally dependant on its view object being existant
    
    var badgeValue: Int = 0 {
        willSet(newVal){
            setBadgeValue(newVal)
        }
    }
    
    weak var view:UIView?
    var badgeView:TIPBadgeView?
    
    init(view: UIView){
        self.view = view
    }
    
    func addBadge(){
        badgeView = TIPBadgeView(x: 0.0, y: 0.0)
        self.view!.addSubview(badgeView!)
        
        self.badgeView!.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        var badgeHeightConstraint = NSLayoutConstraint(item: self.badgeView!, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.Height, multiplier: 1.0, constant: 18.0)
        
        self.badgeView!.addConstraints([badgeHeightConstraint])
        
        var rightConstraint = NSLayoutConstraint(item: self.view!, attribute: NSLayoutAttribute.Right, relatedBy: NSLayoutRelation.Equal, toItem: self.badgeView!, attribute: NSLayoutAttribute.Left, multiplier: 1.0, constant: 7.0)
        
        var topConstraint = NSLayoutConstraint(item: self.view!, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: self.badgeView!, attribute: NSLayoutAttribute.Top, multiplier: 1.0, constant: 5.0)
        
        self.view!.addConstraints([rightConstraint, topConstraint])
    }
    
    func setBadgeValue(value : Int){
        if value > 0 {
            if badgeView == nil {
                addBadge()
            }
            self.badgeView!.setBadgeValue(value)
        } else {
            clearBadge()
        }
    }
    
    func clearBadge(){
        if badgeView != nil {
            self.badgeView!.removeFromSuperview()
            self.badgeView = nil
        }
    }
    
}

class TIPTabBarItemObject: TIPBadgeObject {
    
    var badgeValue: Int = 0 {
        willSet(newVal){
            setBadgeValue(newVal)
        }
    }
    
    weak var tabBar:UITabBarItem?
    
    init(tabBar: UITabBarItem){
        self.tabBar = tabBar
    }
    
    func setBadgeValue(value : Int){
        if value > 0 {
            self.tabBar!.badgeValue = "\(value)"
        } else {
            self.tabBar!.badgeValue = nil
        }
    }
}