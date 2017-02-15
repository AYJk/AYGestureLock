//
//  AYBreviaryLockView.swift
//  AYGestureLock
//
//  Created by Andy on 17/2/15.
//  Copyright © 2017年 ayjkdev. All rights reserved.
//

import UIKit

class AYBreviaryLockView: UIView {

    var itemsWidth:CGFloat = 10.0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configBreviaryLockView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configBreviaryLockView() {
        let spaceDistance = (self.bounds.size.width - 3 * itemsWidth) / 4
        for index in 1...9 {
            //            CGFloat(index % 3) * spaceDistance + CGFloat(index % 3 - 1) * itemsWidth
            let x = index % 3 == 1 ? spaceDistance : index % 3 == 2 ? 2 * spaceDistance + itemsWidth : 3 * spaceDistance + 2 * itemsWidth
            let y = index <= 3 ? spaceDistance : index > 3 && index <= 6 ? 2 * spaceDistance + itemsWidth : 3 * spaceDistance + 2 * itemsWidth
            let lockItem = AYBreviaryLockItem(frame: CGRect(x: x, y: y, width: 10, height: 10))
            self.addSubview(lockItem)
        }
    }
}
