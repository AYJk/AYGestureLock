//
//  ViewController.swift
//  AYGestureLock
//
//  Created by Andy on 17/2/15.
//  Copyright © 2017年 ayjkdev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
    }

    @IBAction func setGestureLockPassword(_ sender: UIButton) {
        let gestVc = GestureLockViewController()
        gestVc.currentLockType = .set
        self.present(gestVc, animated: true, completion: nil)
    }
    
    @IBAction func modifyGesturePassword(_ sender: UIButton) {
        let gestVc = GestureLockViewController()
        gestVc.currentLockType = .moodify
        self.present(gestVc, animated: true, completion: nil)
    }
    
    @IBAction func verificationGesturePassword(_ sender: UIButton) {
        let gestVc = GestureLockViewController()
        gestVc.currentLockType = .verfication
        self.present(gestVc, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

