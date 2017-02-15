//
//  GestureLockViewController.swift
//  AYGestureLock
//
//  Created by Andy on 17/2/15.
//  Copyright © 2017年 ayjkdev. All rights reserved.
//

import UIKit

class GestureLockViewController: UIViewController {
    
    var phoneLabel = UILabel(frame: CGRect(x: 0, y: 15, width: UIScreen.main.bounds.size.width, height: 20))
    var infoLabel = UILabel()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 60.0 / 255.0, green: 72.0 / 255.0, blue: 79 / 255.0, alpha: 1)
        self.view.addSubview(AYLockView(frame: CGRect(x: 0, y: 250, width: self.view.bounds.size.width, height: self.view.bounds.size.height - 250)))
        self.view.addSubview(phoneLabel)
        phoneLabel.text = "157 **** 2525"
        phoneLabel.font = UIFont.systemFont(ofSize: 18)
        phoneLabel.textColor = UIColor.white
        phoneLabel.textAlignment = .center
        let breviaryLockView =  AYBreviaryLockView(frame: CGRect(x: (self.view.bounds.size.width - 60) * 0.5 , y: phoneLabel.frame.maxY + 24, width: 60, height: 60))
        self.view.addSubview(breviaryLockView)
        
        infoLabel.frame = CGRect(x: 0, y: breviaryLockView.frame.maxY + 22, width: self.view.bounds.size.width, height: 20)
        infoLabel.text = "请输入手势密码解锁"
        infoLabel.font = UIFont.systemFont(ofSize: 13)
        infoLabel.textColor = UIColor.white
        infoLabel.textAlignment = .center
        self.view.addSubview(infoLabel)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
