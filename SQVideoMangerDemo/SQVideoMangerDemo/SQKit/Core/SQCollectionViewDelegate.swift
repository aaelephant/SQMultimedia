//
//  SQCollectionViewDelegate.swift
//  SQCollectionDemo
//
//  Created by qbshen on 16/6/13.
//  Copyright © 2016年 qbshen. All rights reserved.
//

import UIKit

class SQCollectionViewDelegate: NSObject ,UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    var marginLeft:CGFloat = 0.0;
    var marginRight:CGFloat = 0.0;
    var marginTop:CGFloat = 0.0;
    var marginBotom: CGFloat = 0.0;
    var minInteritemSpacing: CGFloat = 0.0;
    var minLineSpacing: CGFloat = 0.0;
    
    private var sectionDataDic = NSMutableDictionary()
    
    func loadData(originData:NSMutableDictionary) -> Void {
        sectionDataDic = originData;
    }
    
    func kSection(section:NSInteger) -> NSString {
        return NSString(format: "%ld", section)
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return sectionDataDic.count
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let sectionInfo = sectionDataDic[kSection(section)]
        return (sectionInfo?.cellDataArray.count)!
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let sectionInfo = sectionDataDic[kSection(indexPath.section)]
        let cellInfo = sectionInfo?.cellDataArray[indexPath.row] as! SQBaseCollectionViewInfo
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier((cellInfo.cellNibName) as String, forIndexPath: indexPath) as! SQBaseCollectionViewCell;
        cell.fillData(cellInfo)
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let sectionInfo = sectionDataDic[kSection(indexPath.section)]
        let cellInfo = sectionInfo?.cellDataArray[indexPath.row]
        if ((cellInfo?.gotoNextBlock) != nil) {
            cellInfo?.gotoNextBlock
        }
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let sectionInfo = sectionDataDic[kSection(indexPath.section)]
        let cellInfo = sectionInfo?.cellDataArray[indexPath.row] as! SQBaseCollectionViewInfo
        
        return CGSizeMake(cellInfo.cellWidth, cellInfo.cellHeight)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        
        return minLineSpacing
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
        return minInteritemSpacing
    }
    
    //定义每个UICollectionView 的 margin
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(marginTop, marginLeft, marginBotom, marginRight);
    }
}

class SQCollectionViewSectionInfo : NSObject {
    
    
    var headViewInfo = SQCollectionViewHeadViewInfo()
    var footViewInfo = SQCollectionViewFootViewInfo()
    
    var cellDataArray = NSMutableArray()
}

class SQBaseCollectionViewInfo : NSObject {
    var cellNibName = NSString()
    var cellClassName = NSString()
    var cellStyle = UITableViewCellStyle.Default
    var indexPath = NSIndexPath()
    ///  这是一个函数闭包变量
    typealias  myfunction = (args:AnyObject) ->Void;
    //  定义函数变量
    var gotoNextBlock = myfunction?()
    var cellWidth: CGFloat = 0.0;
    var cellHeight : CGFloat = 0.0;
}

class SQCollectionViewHeadViewInfo : SQBaseCollectionViewInfo {
    
}

class SQCollectionViewFootViewInfo : SQBaseCollectionViewInfo {
    
}

class SQCollectionViewCellInfo : SQBaseCollectionViewInfo{

}

//@objc(SQCollectionViewBaseCell)
//@objc
class SQBaseCollectionViewCell: UICollectionViewCell {
    
    func fillData(info:SQBaseCollectionViewInfo) -> Void {
        
    }
    
    override func select(sender: AnyObject?) {
        NSLog("aa")
    }
}