//
//  SQKeyboardTool.swift
//  FleaMarket
//
//  Created by qbshen on 16/9/8.
//  Copyright © 2016年 qbshen. All rights reserved.
//

import UIKit

class SQKeyboardTool{
    var mOwner:AnyObject?
    var tapGestureR = UITapGestureRecognizer()
    
    func addKeyHandleWithOwner(owner:AnyObject) -> Void {
        mOwner = owner
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector
            (keyboardWasShown), name: UIKeyboardDidShowNotification, object: nil)
        tapGestureR = UITapGestureRecognizer(target: self, action: #selector(hideKeyboardWithRapGestureR))
    }
    
    @objc func keyboardWasShown(aNotification:NSNotification) -> Void {
        mOwner?.addGestureRecognizer(tapGestureR);
    }
    
    @objc func hideKeyboardWithRapGestureR() -> Void {
        UIApplication.sharedApplication().sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, forEvent: nil)
        mOwner?.removeGestureRecognizer(tapGestureR)
    }
    
    func hideKeyboard() -> Void {
        UIApplication.sharedApplication().sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, forEvent: nil)
    }
}
