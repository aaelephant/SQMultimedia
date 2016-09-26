//
//  SQBaseTableViewController.swift
//  FleaMarket
//
//  Created by qbshen on 16/9/7.
//  Copyright © 2016年 qbshen. All rights reserved.
//

import UIKit

class SQBaseTableViewController: UITableViewController {
    var tableDelegate = SQTableViewDelegate()
    var originDic = NSMutableDictionary()
    var keyboardTool = SQKeyboardTool()
    
    
    class func createViewController(NSObject:AnyObject) ->SQBaseTableViewController
    {
        let vc : SQBaseTableViewController = SQBaseTableViewController(style: UITableViewStyle.Plain)
        return vc;
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initTitleBar()
        initTableView()
    }

    func initTableView() -> Void {
        tableView.delegate = tableDelegate
        tableView.dataSource = tableDelegate
        keyboardTool.addKeyHandleWithOwner(tableView)
    }
    func updateTableView() -> Void {
        tableDelegate.loadData(originDic)
        tableView?.reloadData()
    }
    
    func requestInfo() -> Void {
        updateTableView()
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
}
