//
//  SQInputTableCell.swift
//  FleaMarket
//
//  Created by qbshen on 16/9/8.
//  Copyright © 2016年 qbshen. All rights reserved.
//

import UIKit

class SQInputTableCell: SQBaseTableViewCell, UITextFieldDelegate {

    @IBOutlet weak var titleLab: UILabel!
    @IBOutlet weak var contentInput: UITextField!
    var cellInfo = SQInputTableCellInfo()
    
    override func fillData(info: SQBaseTableViewInfo) {
        cellInfo = info as! SQInputTableCellInfo
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        cellInfo.content = textField.text!
        if nil != cellInfo.gotoNextBlock {
            cellInfo.gotoNextBlock!(args: cellInfo)
        }

    }
    
    class SQInputTableCellInfo: SQBaseTableViewInfo {
        var inputHolder = String()
        
    }
}
