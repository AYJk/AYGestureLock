//
//  GestureLockViewController.swift
//  AYGestureLock
//
//  Created by Andy on 17/2/15.
//  Copyright © 2017年 ayjkdev. All rights reserved.
//

import UIKit
public enum LockType: Int {
    case verfication = 0
    case set = 1
    case moodify = 2
}
class GestureLockViewController: UIViewController {
    
    
    var currentLockType: LockType = .verfication
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.blue
        let lockView = AYLockView(frame: self.view.bounds)
        lockView.currentLockType = currentLockType
        weak var weakself = self
        lockView.gesturePasswordSetSuccess {
            weakself?.dismiss(animated: true, completion: nil)
        }
        self.view.addSubview(lockView)
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
