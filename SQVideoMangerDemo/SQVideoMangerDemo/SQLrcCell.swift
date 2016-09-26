//
//  SQLrcCell.swift
//  SQVideoMangerDemo
//
//  Created by qbshen on 16/9/26.
//  Copyright © 2016年 qbshen. All rights reserved.
//

import UIKit

class SQLrcCell: SQBaseTableViewCell {

//    @IBOutlet weak var lrcContent: UILabel!
    var lrcContent : UILabel?
    
    override func awakeFromNib() {
        
    }
    override func fillData(info: SQBaseTableViewInfo) {
        let cellInfo = info as! SQLrcCellInfo
        if nil == lrcContent {
            lrcContent = UILabel(frame: CGRectMake(0, 0, self.frame.size.width, 44))
            lrcContent!.textAlignment = NSTextAlignment.Center
            lrcContent!.textColor = UIColor.blackColor()
            self.backgroundColor = UIColor.clearColor()
            self.addSubview(lrcContent!)
        }
        lrcContent!.text = info.content;
        NSLog("%@", info.content)
        if cellInfo.highlight {
            lrcContent!.textColor = UIColor.redColor()
        }else{
            lrcContent!.textColor = UIColor.blackColor()
        }
    }

}

class SQLrcCellInfo: SQTableViewCellInfo {
    var highlight = false
    
}
