//
//  SQActionSheetCell.swift
//  youthGo
//
//  Created by qbshen on 16/9/5.
//  Copyright © 2016年 qbshen. All rights reserved.
//

import UIKit

class SQActionSheetCell: SQBaseTableViewCell {

    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var iconImage: UIImageView!
    
    override func fillData(info: SQBaseTableViewInfo) {
        let curInfo = info as! SQTableViewCellInfo
        
        self.titleLable?.text = curInfo.title
        
        self.iconImage?.image = UIImage(named: curInfo.iconImage.thumbPath)

    }
}
