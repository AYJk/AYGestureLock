//
//  AYLockView.swift
//  AYGestureLock
//
//  Created by Andy on 17/2/15.
//  Copyright © 2017年 ayjkdev. All rights reserved.
//

import UIKit

typealias GesturePasswordSetSuccess = () -> Void

class AYLockView: UIView {

    var phoneLabel = UILabel(frame: CGRect(x: 0, y: 15 + 64, width: UIScreen.main.bounds.size.width, height: 20))
    var infoLabel = UILabel()
    var gesturePasswordSetSuccess: GesturePasswordSetSuccess?
    private var breviaryLockView: AYBreviaryLockView?
    var currentLockType: LockType = .set {
        willSet {
            switch newValue {
            case .moodify:
                self.infoLabel.text = "请输入旧手势密码"
            case .set:
                self.infoLabel.text = "绘制解锁图案"
            case .verfication:
                self.infoLabel.text = "请输入手势密码解锁"
            }
        }
    }
    private var selectedItems: Array<AYLockItem> = Array()
    var itemsWidth = 75 * UIScreen.main.bounds.size.width / 375.0
    var passwordNumber: String = ""
    private var firstPassword: String = ""
    private var secondPassword: String = ""
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor(red: 60.0 / 255.0, green: 72.0 / 255.0, blue: 79 / 255.0, alpha: 1)
        self.configLockView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func gesturePasswordSetSuccess(colsure: @escaping () -> Void) {
        gesturePasswordSetSuccess = colsure
    }
    
    func configLockView() {
//        let lockItem = AYLockItem(frame: CGRect(x: 50, y: 50, width: 75, height: 75))
//        let lockItem2 = AYLockItem(frame: CGRect(x: 200, y: 50, width: 75, height: 75))
//        
//        self.addSubview(lockItem)
//        self.addSubview(lockItem2)
        self.addSubview(phoneLabel)
        phoneLabel.text = "157 **** 2525"
        phoneLabel.font = UIFont.systemFont(ofSize: 18)
        phoneLabel.textColor = UIColor.white
        phoneLabel.textAlignment = .center
        self.breviaryLockView =  AYBreviaryLockView(frame: CGRect(x: (self.bounds.size.width - 60) * 0.5 , y: phoneLabel.frame.maxY + 24, width: 60, height: 60))
        self.addSubview(self.breviaryLockView!)
        
        infoLabel.frame = CGRect(x: 0, y: (breviaryLockView?.frame.maxY)! + 22, width: self.bounds.size.width, height: 20)
        
        infoLabel.font = UIFont.systemFont(ofSize: 13)
        infoLabel.textColor = UIColor.white
        infoLabel.textAlignment = .center
        self.addSubview(infoLabel)
        
        let spaceDistance = (self.bounds.size.width - 3 * itemsWidth) / 4
        for index in 1...9 {
//            CGFloat(index % 3) * spaceDistance + CGFloat(index % 3 - 1) * itemsWidth
            let x = index % 3 == 1 ? spaceDistance : index % 3 == 2 ? 2 * spaceDistance + itemsWidth : 3 * spaceDistance + 2 * itemsWidth
            let y = index <= 3 ? spaceDistance : index > 3 && index <= 6 ? 2 * spaceDistance + itemsWidth : 3 * spaceDistance + 2 * itemsWidth
            let lockItem = AYLockItem(frame: CGRect(x: x, y: y + 250 * UIScreen.main.bounds.size.height / 667.0, width: 75, height: 75))
            lockItem.tag = index
            self.addSubview(lockItem)
        }
    }
    
    func handleTouchAction(touches: Set<UITouch>) {
        self.breviaryLockView?.updateBreviaryLockItem(password: "")
        if self.firstPassword.characters.count > 4 && self.secondPassword.characters.count == 0 {
            self.infoLabel.text = "再次绘制解锁图案"
        }
        if self.firstPassword.characters.count == 0 && self.secondPassword.characters.count == 0 {
            self.infoLabel.text = "绘制解锁图案"
        }
        let userTouches = touches.first
        let loc = userTouches?.location(in: self)
        for item in self.subviews {
            if item.isMember(of: AYLockItem.self) {
                let lockItem = item as! AYLockItem
                if lockItem.frame.contains(loc!) {
                    if !self.selectedItems.contains(lockItem) {
                        self.selectedItems.append(lockItem)
                        self.passwordNumber.append("\(lockItem.tag)")
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
        self.breviaryLockView?.updateBreviaryLockItem(password: self.passwordNumber)
        switch currentLockType {
            case .moodify:
                self.modifyPassword()
            case .set:
                self.setupPassword()
            case .verfication:
                self.verificationPassword()
        }
        
        self.selectedItems.removeAll()
        self.setNeedsDisplay()
    }
    
    func reDrawItem(item: AYLockItem) {
        item.isSelected = true
        self.setNeedsDisplay()
    }
   
    func modifyPassword() {
        guard (self.passwordNumber.characters.count) >= 4 else {
            print("至少选择四个点")
            return
        }
        let password = UserDefaults.standard.value(forKey: "gesturePassword")
        guard password != nil else {
            self.setupPassword()
            return
        }
        if self.passwordNumber == password as! String {
            print("验证成功")
            self.currentLockType = .set
            self.passwordNumber = ""
            self.infoLabel.text = "绘制新解锁图案"
        } else {
            print("验证失败")
            self.passwordNumber = ""
            self.infoLabel.text = "图形解锁错误请重新尝试"
        }
    }
    
    func verificationPassword() {
        guard (self.passwordNumber.characters.count) >= 4 else {
            print("至少选择四个点")
            return
        }
        let password = UserDefaults.standard.value(forKey: "gesturePassword")
        guard password != nil else {
            self.setupPassword()
            return
        }
        if self.passwordNumber == password as! String {
            print("验证成功")
            if self.gesturePasswordSetSuccess != nil {
                self.gesturePasswordSetSuccess!()
            }
        } else {
            print("验证失败")
            self.passwordNumber = ""
            self.infoLabel.text = "图形解锁错误请重新尝试"
        }
    }
    
    func setupPassword() {
        guard (self.passwordNumber.characters.count) >= 4 else {
            print("至少选择四个点")
            return
        }
        if (self.firstPassword.characters.count) >= 4 {
            self.secondPassword = String(format: "%@", self.passwordNumber)
            self.passwordNumber = ""
        } else {
            self.firstPassword = String(format: "%@", self.passwordNumber)
            self.passwordNumber = ""
        }
        if self.firstPassword.characters.count > 4 && self.secondPassword.characters.count == 0 {
            self.infoLabel.text = "再次绘制解锁图案"
        }
        if self.firstPassword.characters.count >= 4 && self.secondPassword.characters.count >= 4 {
            if self.firstPassword == self.secondPassword {
                print("设置成功")
                if self.self.gesturePasswordSetSuccess != nil {
                    self.gesturePasswordSetSuccess!()
                }
                UserDefaults.standard.set(self.firstPassword, forKey: "gesturePassword")
            } else {
                self.infoLabel.text = "设置失败，请重新绘制"
                print("设置失败")
            }
            self.passwordNumber = ""
            self.firstPassword = ""
            self.secondPassword = ""
        }
        print("passwordNumber : %@",self.passwordNumber)
        print("firstPassword : %@",self.firstPassword)
        print("secondPassword : %@",self.secondPassword)
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
