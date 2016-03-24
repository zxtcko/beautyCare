//
//  ReservationCellView.swift
//  PLASOFTWARE
//
//  Created by 邓超 on 16/3/21.
//  Copyright © 2016年 Young. All rights reserved.
//

import UIKit

class ReservationCellView: UITableViewCell {
    
    @IBOutlet weak var cellName: UILabel!
    @IBOutlet weak var cellButton: UIButton!
    @IBOutlet weak var cellImage: UIImageView!
    
    
    override func awakeFromNib() {
        cellName.textColor = UIColor.plaWordl2Color()
        cellButton.setBackgroundImage(UIImage(named: "icon_13"), forState: .Highlighted)
    }
    
    func configureWithReserve(number: Int)
    {
        switch number{
        case 0:
            cellName.text = NSLocalizedString("NEW", comment: "")
            cellImage.image = UIImage(named: "图层-2-拷贝-3")
            cellImage.highlightedImage = UIImage(named: "矩形-1-拷贝-3")
        case 1:
            cellName.text = NSLocalizedString("TO BE CONFIRMED", comment: "")
            cellImage.image = UIImage(named: "图层-2-拷贝-2")
            cellImage.highlightedImage = UIImage(named: "矩形-1-拷贝-4")
        case 2:
            cellName.text = NSLocalizedString("RESERVED", comment: "")
            cellImage.image = UIImage(named: "图层-3")
            cellImage.highlightedImage = UIImage(named: "矩形-1-拷贝-5")
        default: break
        }
    }
}
