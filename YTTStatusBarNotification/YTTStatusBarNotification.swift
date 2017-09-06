//
//  YTTStatusBarNotification.swift
//  YTTStatusBarNotificationDemo
//
//  Created by Andy on 2017/9/5.
//  Copyright © 2017年 AndyCuiYTT. All rights reserved.
//

import UIKit
import SnapKit

let yttScreenWidth = UIScreen.main.bounds.width
let yttScreenHeight = UIScreen.main.bounds.height
let yttHeight = 20
let yttIconWidth = 15



public class YTTStatusBarNotification: UIWindow {

    
    fileprivate var iconSuccessImage: UIImage = UIImage(named: "success")!
    fileprivate var iconErrorImage: UIImage = UIImage(named: "error")!
    fileprivate var iconInfoImage: UIImage = UIImage(named: "info")!
    fileprivate var timeInterval: TimeInterval = 3
    
    lazy fileprivate var messageLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13)
        return label
    }()
    lazy fileprivate var iconImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    fileprivate var hideTimer: Timer?
    
    
    static var statusBarNotifition: YTTStatusBarNotification = YTTStatusBarNotification()
    
    
    static func shareStatusBarNotifition() -> YTTStatusBarNotification {
        return statusBarNotifition
    }
    
    
    init() {
        let frame = UIApplication.shared.statusBarFrame
        super.init(frame: frame)
        self.windowLevel = UIWindowLevelStatusBar + 10
        self.backgroundColor = UIColor.orange
        let centerView = UIView()
        
        if #available(iOS 9.0, *){
            let baseVC = UIViewController()
            baseVC.view.addSubview(centerView)
            self.rootViewController = baseVC
        }else{
            self.addSubview(centerView)
        }
        centerView.snp.makeConstraints { (make) in
            make.centerX.centerY.height.equalToSuperview()
        }
        
        centerView.addSubview(iconImageView)
        centerView.addSubview(messageLabel)
        iconImageView.snp.makeConstraints { (make) in
            make.centerY.left.equalToSuperview()
            make.width.height.equalTo(yttIconWidth)
        }
        
        messageLabel.snp.makeConstraints { (make) in
            make.centerY.right.equalToSuperview()
            make.left.equalTo(iconImageView.snp.right).offset(5)
        }
        
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


public extension YTTStatusBarNotification {
    
    public class var successImage: UIImage {
        get {
            return statusBarNotifition.iconSuccessImage
        }
        set {
            statusBarNotifition.iconSuccessImage = newValue
        }
    }
    
    public class var errorImage: UIImage {
        get {
            return statusBarNotifition.iconErrorImage
        }
        set {
            statusBarNotifition.iconErrorImage = newValue
        }
    }
    
    public class var infoImage: UIImage {
        get {
            return statusBarNotifition.iconInfoImage
        }
        set {
            statusBarNotifition.iconInfoImage = newValue
        }
    }
    
    public class var textColor: UIColor {
        get {
            return statusBarNotifition.messageLabel.textColor
        }
        set {
            statusBarNotifition.messageLabel.textColor = newValue
        }
    }
    
    public class var backGroundColor: UIColor {
        get {
            return statusBarNotifition.backgroundColor!
        }
        set {
            statusBarNotifition.backgroundColor = newValue
        }
    }
    
    public class var duration: TimeInterval {
        get {
            return statusBarNotifition.timeInterval
        }
        set {
            statusBarNotifition.timeInterval = newValue
        }
    }
    
    
    
}

// MARK: 实例方法
public extension YTTStatusBarNotification {
    
    public func show(withStatus status: String) {
        
    }
    
    public func showInfo(withStatus status: String) {
        self.show(status: status, iconImage: iconInfoImage, duration: timeInterval)
    }
    
    public func showSuccess(withStatus status: String) {
        self.show(status: status, iconImage: iconSuccessImage, duration: timeInterval)
    }
    
    public func showError(withStatus status: String) {
        self.show(status: status, iconImage: iconErrorImage, duration: timeInterval)
    }
    
    
    
    
    public func show(status: String, iconImage: UIImage, duration: TimeInterval) {
        messageLabel.text = status
        iconImageView.image = iconImage
        self.makeKeyAndVisible()
        // 设置计时器
        hideTimer?.invalidate()
        hideTimer = Timer(timeInterval: duration, target: self, selector: #selector(dismiss), userInfo: nil, repeats: false)
        RunLoop.main.add(hideTimer!, forMode: RunLoopMode.commonModes)
    }
    
    public func dismiss() {
        hideTimer?.invalidate()
        hideTimer = nil
        self.isHidden = true
    }

}

// MARK: 类方法
extension YTTStatusBarNotification {
    
    public class func show(withStatus status: String) {
        statusBarNotifition.show(withStatus: status)
    }
    
    public class func showInfo(withStatus status: String) {
        statusBarNotifition.showInfo(withStatus: status)
    }

    
    public class func showSuccess(withStatus status: String) {
        statusBarNotifition.showSuccess(withStatus: status)
    }
    
    public class func showError(withStatus status: String) {
        statusBarNotifition.showError(withStatus: status)
    }
    
    public class func dismiss() {
        statusBarNotifition.dismiss()
    }

}
