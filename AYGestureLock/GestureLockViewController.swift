//
//  GestureLockViewController.swift
//  AYGestureLock
//
//  Created by Andy on 17/2/15.
//  Copyright © 2017年 ayjkdev. All rights reserved.
//

import UIKit

class GestureLockViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 60.0 / 255.0, green: 72.0 / 255.0, blue: 79 / 255.0, alpha: 1)
        self.view.addSubview(AYLockView(frame: CGRect(x: 0, y: 250, width: self.view.bounds.size.width, height: self.view.bounds.size.height - 250)))
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
