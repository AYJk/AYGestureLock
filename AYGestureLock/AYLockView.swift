//
//  AYLockView.swift
//  AYGestureLock
//
//  Created by Andy on 17/2/15.
//  Copyright © 2017年 ayjkdev. All rights reserved.
//

import UIKit

class AYLockView: UIView {

    private var selectedItems: Array<AYLockItem> = Array()
    var itemsWidth = 75 * UIScreen.main.bounds.size.width / 375.0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor(red: 60.0 / 255.0, green: 72.0 / 255.0, blue: 79 / 255.0, alpha: 1)
        self.configLockView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configLockView() {
//        let lockItem = AYLockItem(frame: CGRect(x: 50, y: 50, width: 75, height: 75))
//        let lockItem2 = AYLockItem(frame: CGRect(x: 200, y: 50, width: 75, height: 75))
//        
//        self.addSubview(lockItem)
//        self.addSubview(lockItem2)
        let spaceDistance = (self.bounds.size.width - 3 * itemsWidth) / 4
        for index in 1...9 {
//            CGFloat(index % 3) * spaceDistance + CGFloat(index % 3 - 1) * itemsWidth
            let x = index % 3 == 1 ? spaceDistance : index % 3 == 2 ? 2 * spaceDistance + itemsWidth : 3 * spaceDistance + 2 * itemsWidth
            let y = index <= 3 ? spaceDistance : index > 3 && index <= 6 ? 2 * spaceDistance + itemsWidth : 3 * spaceDistance + 2 * itemsWidth
            let lockItem = AYLockItem(frame: CGRect(x: x, y: y, width: 75, height: 75))
            self.addSubview(lockItem)
        }
    }
    
    func handleTouchAction(touches: Set<UITouch>) {
        let userTouches = touches.first
        let loc = userTouches?.location(in: self)
        for item in self.subviews {
            if item.isMember(of: AYLockItem.self) {
                let lockItem = item as! AYLockItem
                if lockItem.frame.contains(loc!) {
                    if !self.selectedItems.contains(lockItem) {
                        self.selectedItems.append(lockItem)
                    }
                    self.reDrawItem(item: lockItem)
                }
            }
        }
    }
    
    func handleEndAction() {
        for item in self.selectedItems {
            item.isSelected = false
        }
        self.selectedItems.removeAll()
        self.setNeedsDisplay()
    }
    
    func reDrawItem(item: AYLockItem) {
        item.isSelected = true
        self.setNeedsDisplay()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.handleTouchAction(touches: touches)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.handleTouchAction(touches: touches)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.handleEndAction()
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.handleEndAction()
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        guard self.selectedItems.count > 1 else {
            return
        }
        let linePath = UIBezierPath()
        for index in 0..<selectedItems.count {
            let item = selectedItems[index]
            let center = item.center
            linePath.lineWidth = 2.0
            if index == 0 {
                linePath.move(to: center)
            } else {
                linePath.addLine(to: center)
            }
            UIColor(red: 255.0 / 255, green: 76 / 255.0, blue: 78 / 255.0, alpha: 1).set()
            linePath.stroke()
        }
    }
}
