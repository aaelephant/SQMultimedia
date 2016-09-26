//
//  FMRootTabBar.swift
//  FleaMarket
//
//  Created by qbshen on 16/9/7.
//  Copyright © 2016年 qbshen. All rights reserved.
//

import UIKit

class SQRootTabBar: UITabBarController {
    
    override func viewDidLoad() {
        setViewControllers([subViewController("FMMsgController", sysItem: UITabBarSystemItem.History, tag:  0),goodsSubViewController(),subViewController("FMMineController", sysItem: UITabBarSystemItem.Contacts, tag:  2)], animated: true)

//        setViewControllers([subViewController("FMMsgController", title: "消息", imageNamed: "rtabBar_msg_icon", selectedImaged: "rtabBar_msg_icon"),subViewController("FMMineController", title: "我的", imageNamed: "rtabBar_mine_icon", selectedImaged: "rtabBar_mine_icon")], animated: true)
    }
    
    func goodsSubViewController() -> UINavigationController {
//        let vc = YGShoppingListController.createViewController("")
//        vc.tabBarItem = UITabBarItem(tabBarSystemItem: UITabBarSystemItem.Bookmarks, tag: 1)
//        let nv = UINavigationController(rootViewController: vc)
//        nv.hidesBarsOnSwipe = true
        return UINavigationController()
    }
    
    func subViewController(className:String, sysItem:UITabBarSystemItem, tag: Int) -> UINavigationController {
        let vc = swiftClassFromString(className)
        vc.tabBarItem = UITabBarItem(tabBarSystemItem: sysItem, tag: tag)
        let nv = UINavigationController(rootViewController: vc)
        nv.hidesBarsOnSwipe = true
        return nv
    }
    
    
    func subViewController(className:String, title:String, imageNamed:String, selectedImaged:String) -> UINavigationController {
        let vc = swiftClassFromString(className)
        vc.tabBarItem = UITabBarItem(title: title, image: UIImage(named:imageNamed), selectedImage: UIImage(named:selectedImaged))
        let nv = UINavigationController(rootViewController: vc)
        nv.hidesBarsOnSwipe = true
        return nv
    }
    
    func swiftClassFromString(className: String) -> UIViewController! {
        // get the project name
        if  let appName: String = NSBundle.mainBundle().objectForInfoDictionaryKey("CFBundleName") as! String? {
            //拼接控制器名
            let classStringName = "\(appName).\(className)"
            //将控制名转换为类
            let classType = NSClassFromString(classStringName) as? UIViewController.Type
            if let type = classType {
                let newVC = type.init()
                return newVC
            }
        }
        return nil;
    }
    
    
}