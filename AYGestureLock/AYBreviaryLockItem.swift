//
//  AYBreviaryLockItem.swift
//  AYGestureLock
//
//  Created by Andy on 17/2/15.
//  Copyright © 2017年 ayjkdev. All rights reserved.
//

import UIKit

class AYBreviaryLockItem: UIView {

    var isSelected: Bool = false {
        didSet {
            self.setNeedsDisplay()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.clear
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func draw(_ rect: CGRect) {
        super.draw(rect)
        if self.isSelected {
            UIColor(red: 255 / 255.0, green: 76 / 255.0, blue: 78 / 255.0, alpha: 1).setFill()
            let circlePath = UIBezierPath(arcCenter: CGPoint(x: self.bounds.size.width * 0.5, y: self.bounds.size.height * 0.5), radius: self.bounds.size.width * 0.5, startAngle: 0.0, endAngle: CGFloat(M_PI * 2.0), clockwise: true)
            circlePath.fill()
        } else {
            UIColor(red: 38 / 255.0, green: 48 / 255.0, blue: 55 / 255.0, alpha: 1.0).setFill()
            let circlePath = UIBezierPath(arcCenter: CGPoint(x: self.bounds.size.width * 0.5, y: self.bounds.size.height * 0.5), radius: self.bounds.size.width * 0.5, startAngle: 0.0, endAngle: CGFloat(M_PI * 2.0), clockwise: true)
            circlePath.fill()
        }
    }
    
}
