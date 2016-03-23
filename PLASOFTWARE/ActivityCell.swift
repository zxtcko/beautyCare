//
//  ActivityCell.swift
//  PLASOFTWARE
//
//  Created by 邓超 on 16/3/22.
//  Copyright © 2016年 Young. All rights reserved.
//

import UIKit

class ActivityCell: UITableViewCell {

    @IBOutlet weak var activityImageView: UIImageView!
    @IBOutlet weak var activityButton: UIButton!
    
    override func awakeFromNib() {
        activityButton.setImage(UIImage(named: "icon_13"), forState: .Highlighted)
    }
    
    func configCellWithIndexpath(row:Int){
        switch row{
        case 0:
            activityImageView.image = UIImage(named: "圆角矩形-1-拷贝-4")
        case 1:
            activityImageView.image = UIImage(named: "图层-3png")
        case 2:
            activityImageView.image = UIImage(named: "图层-4")
        default: break
        }
    }
}
