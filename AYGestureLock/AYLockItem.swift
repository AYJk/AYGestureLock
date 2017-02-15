//
//  AYLockItem.swift
//  AYGestureLock
//
//  Created by Andy on 17/2/15.
//  Copyright © 2017年 ayjkdev. All rights reserved.
//

import UIKit

class AYLockItem: UIView {

//    是否被选中
    var isSelected: Bool = false {
        didSet {
            self.setNeedsDisplay()
        }
    }
//    线宽
    var lineWidth: CGFloat = 2.0
//    选中的内边距
    var insetDistance: CGFloat = 8.0
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.clear
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func draw(_ rect: CGRect) {
        super.draw(rect)
        let context = UIGraphicsGetCurrentContext()
        context?.setLineWidth(1.0)
        let color: UIColor?
        if self.isSelected {
            color = UIColor(red: 255.0 / 255, green: 76.0 / 255, blue: 78.0 / 255, alpha: 1.0)
            color?.set()
            UIColor(red: 60.0 / 255.0, green: 72.0 / 255.0, blue: 79 / 255.0, alpha: 1).setFill()
            let circlePath = UIBezierPath(arcCenter: CGPoint(x: self.bounds.size.width * 0.5, y: self.bounds.size.height * 0.5), radius: self.bounds.size.width * 0.5 - self.lineWidth, startAngle: 0.0, endAngle: CGFloat(M_PI * 2.0), clockwise: true)
            circlePath.lineWidth = self.lineWidth
            circlePath.stroke()
            circlePath.fill()
            
            let path_a = UIBezierPath(arcCenter: CGPoint(x: self.bounds.size.width * 0.5, y: self.bounds.size.height * 0.5), radius: self.bounds.size.width * 0.5 - self.lineWidth - insetDistance, startAngle: CGFloat(M_PI * 2.0 - M_PI_2), endAngle: CGFloat(M_PI * 2.0 - M_PI_2 + 0.1), clockwise: true)
            path_a.lineWidth = self.lineWidth
            path_a.lineJoinStyle = .round
            path_a.lineCapStyle = .round
            path_a.stroke()
            
            let path_b = UIBezierPath(arcCenter: CGPoint(x: self.bounds.size.width * 0.5, y: self.bounds.size.height * 0.5), radius: self.bounds.size.width * 0.5 - self.lineWidth - insetDistance, startAngle: CGFloat(M_PI * 2.0 - M_PI_2 + 0.25), endAngle: CGFloat(M_PI * 2.0), clockwise: true)
            path_b.lineWidth = self.lineWidth
            path_b.lineJoinStyle = .round
            path_b.lineCapStyle = .round
            path_b.stroke()
            
        } else {
            color = UIColor(red: 155.0 / 255, green: 193 / 255.0, blue: 220 /  255.0, alpha: 1.0)
            color?.setStroke()
            UIColor(red: 60.0 / 255.0, green: 72.0 / 255.0, blue: 79 / 255.0, alpha: 1).setFill()
            let circlePath = UIBezierPath(arcCenter: CGPoint(x: self.bounds.size.width * 0.5, y: self.bounds.size.height * 0.5), radius: self.bounds.size.width * 0.5 - self.lineWidth, startAngle: 0.0, endAngle: CGFloat(M_PI * 2.0), clockwise: true)
            circlePath.lineWidth = self.lineWidth
            circlePath.stroke()
            circlePath.fill()
        }
        
        
    }
    
}
