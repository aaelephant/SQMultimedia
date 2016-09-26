//
//  SQBaseCollectionViewController.swift
//  FleaMarket
//
//  Created by qbshen on 16/9/7.
//  Copyright © 2016年 qbshen. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class SQBaseCollectionViewController: UICollectionViewController {
    var collectionDelegate = SQCollectionViewDelegate();
    var originDic = NSMutableDictionary()
    var cellNibNames = NSMutableArray()
    var cellClassNames = NSMutableArray()
    var keyboardTool = SQKeyboardTool()
    
    
    class func createViewController(creates:AnyObject) ->SQBaseCollectionViewController
    {
        let vc : SQBaseCollectionViewController = SQBaseCollectionViewController(collectionViewLayout: UICollectionViewFlowLayout.init())
        vc.cellNibNames = NSMutableArray()
        vc.cellNibNames.addObject("YGShoppingListCell")
        vc.collectionView?.backgroundColor = kRGBA(234, g: 234, b: 234, a: 1)
        
        return vc;
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initCollectionView()
    }

    func initCollectionView() -> Void {
        collectionView?.backgroundColor = sys_bg_kRGBA()
        for cur in cellNibNames {
            collectionView?.registerNib(UINib(nibName: cur as! String, bundle: nil), forCellWithReuseIdentifier: cur as! String)
        }
        for cur in cellClassNames {
            collectionView?.registerClass(NSClassFromString(cur as! String), forCellWithReuseIdentifier: cur as! String)
        }
        collectionView?.delegate = collectionDelegate
        collectionView?.dataSource = collectionDelegate
        keyboardTool.addKeyHandleWithOwner(collectionView!)
    }

    func updateCollectionView() -> Void {
        collectionDelegate.loadData(originDic)
        collectionView?.reloadData()
    }
    
    func requestInfo() -> Void {
        updateCollectionView()
    }
    
    func initTitleBar() -> Void {
        defaultBackButtonItem()
    }
    
    func defaultBackButtonItem() -> Void {
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.Plain, target: nil, action: nil)
//        navigationController?.navigationBar.tintColor = UIColor.whiteColor()
    }
    
    func initTitleBarColor() -> Void {
        
        
    }
    
    //    func swiftCellClassFromString(className: String, cellStyle:UITableViewCellStyle, reuseIdentifier: String) -> UITableViewCell! {
    //        // get the project name
    //        if  let appName: String = NSBundle.mainBundle().objectForInfoDictionaryKey("CFBundleName") as! String? {
    //            //拼接控制器名
    //            let classStringName = "\(appName).\(className)"
    //            //将控制名转换为类
    //            let classType = NSClassFromString(classStringName)
    //            if let type = classType {
    //                let newCell = type.init()
    //                return newCell
    //            }
    //        }
    //        return nil;
    //    }

}
