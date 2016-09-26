//
//  SQActionSheetView.swift
//  youthGo
//
//  Created by qbshen on 16/9/5.
//  Copyright © 2016年 qbshen. All rights reserved.
//

import UIKit

class SQActionSheetView: UITableView {
    var tableDelegate = SQTableViewDelegate()
    var gr : UITapGestureRecognizer? = nil
    
    let bgView = UIView()
    var originDic = NSMutableDictionary()
    func show() -> Void {
        let app:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        bgView.frame = app.window!.frame
        bgView.backgroundColor = UIColor.blackColor()
        bgView.alpha = 0.5
        gr = UITapGestureRecognizer(target: self, action: #selector(SQActionSheetView.dismiss))
        bgView.addGestureRecognizer(gr!)
        app.window!.addSubview(bgView)
        self.frame = CGRectMake(0, SCREEN_HEIGHT()-3*60, SCREEN_WIDTH(), 3*60)
        app.window!.addSubview(self)
        requestInfo()
    }
    
    func dismiss() -> Void {
        bgView.removeFromSuperview()
        self.removeFromSuperview()
    }
    
    
    
    func requestInfo() -> Void {
        originDic["0"] = getSectionInfo()
        self.delegate = tableDelegate
        self.dataSource = tableDelegate
        tableDelegate.loadData(originDic)
        reloadData()
    }
    
    func getSectionInfo() -> SQTableViewSectionInfo {
        let sectionInfo = SQTableViewSectionInfo()
        let cellInfoArray = NSMutableArray()
        let cellInfo_alipay = SQTableViewCellInfo()
        
        cellInfo_alipay.cellNibName = "SQActionSheetCell"
        cellInfo_alipay.cellStyle = UITableViewCellStyle.Value1
        cellInfo_alipay.title = "支付宝支付"
        cellInfo_alipay.iconImage = SQImageModel()
        cellInfo_alipay.iconImage.thumbPath = "alipay_icon"
        cellInfoArray.addObject(cellInfo_alipay)
        let cellInfo_wx = SQTableViewCellInfo()
        
        cellInfo_wx.cellNibName = "SQActionSheetCell"
        cellInfo_wx.cellStyle = UITableViewCellStyle.Value1
        cellInfo_wx.title = "微信支付"
        cellInfo_wx.iconImage = SQImageModel()
        cellInfo_wx.iconImage.thumbPath = "weixin_pay_logo"
        cellInfoArray.addObject(cellInfo_wx)
        
        let cellInfo_time = SQTableViewCellInfo()
        
        cellInfo_time.cellNibName = "SQActionSheetCell"
        cellInfo_time.cellStyle = UITableViewCellStyle.Value1
        cellInfo_time.title = "货到付款"
        cellInfo_time.iconImage = SQImageModel()
        cellInfo_time.iconImage.thumbPath = "pay_for_goods_icon"
        cellInfoArray.addObject(cellInfo_time)
        
        sectionInfo.cellDataArray = cellInfoArray
        
        return sectionInfo
    }
}
