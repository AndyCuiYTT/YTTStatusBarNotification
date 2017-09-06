//
//  ViewController.swift
//  YTTStatusBarNotificationDemo
//
//  Created by Andy on 2017/9/5.
//  Copyright © 2017年 AndyCuiYTT. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
        
    }
    
    
    @IBAction func status(_ sender: Any) {
    }
    
    
    @IBAction func success(_ sender: Any) {
        YTTStatusBarNotification.shareStatusBarNotifition().showSuccess(withStatus: "测试数据")
    }
    
    @IBAction func error(_ sender: Any) {
        YTTStatusBarNotification.shareStatusBarNotifition().showError(withStatus: "测试数据")
    }
    
    @IBAction func info(_ sender: Any) {
        YTTStatusBarNotification.shareStatusBarNotifition().showInfo(withStatus: "测试数据")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

