//
//  Macro.swift
//  youthGo
//
//  Created by qbshen on 16/3/3.
//  Copyright © 2016年 qbshen. All rights reserved.
//

import UIKit

func sys_bg_kRGBA () -> UIColor {
    return kRGBA(234, g:234, b:234, a:1)
}
// RGBA的颜色设置
func kRGBA (r:CGFloat, g:CGFloat, b:CGFloat, a:CGFloat) -> UIColor {
    return UIColor(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: a)
}

func UIColorFromRGB(rgbValue:UInt)->UIColor {
    return UIColor(red: ((CGFloat)((rgbValue&0xFF0000)>>16))/255.0, green: ((CGFloat)((rgbValue&0xFF00)>>8))/255.0, blue: ((CGFloat)(rgbValue&0xFF))/255.0, alpha: 1.0)
}

func SMToast(msg:String){
//    SMToastView.showMessageCenter((UIApplication.sharedApplication().delegate?.window)!, withMessage: msg)
}

func SCREEN_WIDTH()->CGFloat{

    return UIScreen.mainScreen().bounds.size.width;
}

func SCREEN_HEIGHT()->CGFloat{
    
    return UIScreen.mainScreen().bounds.size.height;
}

func HOLDER_IMAGE()->UIImage{
    return UIImage(named: "default_image")!
}

func HOLDER_HEAD_IMAGE()->UIImage{
    return UIImage(named: "default_head_image")!
}

func APPLANGUAGE() -> String {
    return "appLanguage";
}

func APPLANGUAGE_EN() -> String {
    return "en";
}

func APPLANGUAGE_ZH_HANS() -> String {
    return "zh-Hans";
}

func KNOTIFICATION_UPDATE_FRIENDS() -> String {
    return "KNOTIFICATION_update_friends";
}

//public func SQLocalizedString(key: String, tableName: String? = default, bundle: NSBundle = default, value: String = default, comment: String) -> String

func SQLocalizedString(key:String, comment:String) -> String {
    let appLan = NSUserDefaults.standardUserDefaults().valueForKey(APPLANGUAGE()) as! String
    
    let path = NSBundle.mainBundle().pathForResource(appLan, ofType: "lproj")
    let bun = NSBundle.init(path: path!)
    
    return (bun?.localizedStringForKey(key, value: nil, table: "SQLocalizable"))!
}

func VIEW_WITH_NIBNAME(nibName:NSString) -> UIView {
    let nibViews = NSBundle.mainBundle().loadNibNamed(nibName as String, owner: nil, options: nil)
    return nibViews.first as! UIView
}
