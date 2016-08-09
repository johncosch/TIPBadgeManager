//
//  TIPBadgeView.swift
//  TIPBadgeManager
//
//  Created by John Coschigano on 6/17/15.
//  Copyright (c) 2015 John Coschigano. All rights reserved.
//


public class TIPBadgeView: UIView {
    
    public var label: UILabel!
    
    var topLabelConstraint:NSLayoutConstraint?
    var bottomLabelConstraint:NSLayoutConstraint?
    public var leftLabelConstraint:NSLayoutConstraint?
    public var rightLabelConstraint:NSLayoutConstraint?
    
    public let STANDARD_MARGIN : CGFloat = 2
    public let LARGER_MARGIN : CGFloat = 3
    
    public init(){
        super.init(frame: CGRect(x: 0, y: 0, width: 18, height: 18))
        self.backgroundColor = UIColor.red
        self.layer.zPosition = 1000
        self.layer.cornerRadius = 9
        self.layer.masksToBounds = true
        addLabel()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addLabel(){
        label = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = UIColor.clear
        label.textColor = UIColor.white
        label.textAlignment = NSTextAlignment.left
        label.font = UIFont(name: self.label.font.fontName, size: 12.0)
        label.layer.cornerRadius = 9
        label.layer.masksToBounds = true
        
        self.addSubview(label)
        addLabelConstraints()
    }
    
    func addLabelConstraints(){
        topLabelConstraint = NSLayoutConstraint(item: self, attribute: NSLayoutAttribute.top, relatedBy: NSLayoutRelation.equal, toItem: self.label!, attribute: NSLayoutAttribute.top, multiplier: 1.0, constant: 0)
        
        bottomLabelConstraint = NSLayoutConstraint(item: self, attribute: NSLayoutAttribute.bottom, relatedBy: NSLayoutRelation.equal, toItem: self.label!, attribute: NSLayoutAttribute.bottom, multiplier: 1.0, constant: 0)
        
        leftLabelConstraint = NSLayoutConstraint(item: self.label, attribute: NSLayoutAttribute.left, relatedBy: NSLayoutRelation.equal, toItem: self, attribute: NSLayoutAttribute.left, multiplier: 1.0, constant: 2.0)
        leftLabelConstraint!.priority = 1000.0
        
        rightLabelConstraint = NSLayoutConstraint(item: self, attribute: NSLayoutAttribute.right, relatedBy: NSLayoutRelation.equal, toItem: self.label, attribute: NSLayoutAttribute.right, multiplier: 1.0, constant: 2.0)
        rightLabelConstraint!.priority = 1000.0
        
        self.addConstraints([topLabelConstraint!, bottomLabelConstraint!, leftLabelConstraint!, rightLabelConstraint!])
    }
    
    public func setBadgeValue(_ val : Int){
            label.text = " \(val) "
            setMarginsForVal(val)
    }
    
    public func setMarginsForVal(_ val : Int){
        if val < 10 {
            leftLabelConstraint!.constant = LARGER_MARGIN
            rightLabelConstraint!.constant = LARGER_MARGIN
        } else {
            leftLabelConstraint!.constant = STANDARD_MARGIN
            rightLabelConstraint!.constant = STANDARD_MARGIN
        }
        self.layoutIfNeeded()
    }
    
}
