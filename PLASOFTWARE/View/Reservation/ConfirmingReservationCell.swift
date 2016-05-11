//
//  ConfirmingReservationCell.swift
//  PLASOFTWARE
//
//  Created by 邓超 on 16/3/22.
//  Copyright © 2016年 Young. All rights reserved.
//

import UIKit

class ConfirmingReservationCell: UITableViewCell {

    @IBOutlet weak var itemTitle: UILabel!
    
    @IBOutlet weak var itemSubtitle: UILabel!
    
    @IBOutlet weak var timeTitle: UILabel!
    
    @IBOutlet weak var timeSubtitle: UILabel!
    
    override func awakeFromNib() {
        
        itemSubtitle.text = NSLocalizedString("ITEM", comment: "")
        
        let gradient = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.gradientForPla(UIColor.plaSteelblueColor(), endColor: UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.4), startPoint: CGPointMake(0.0,0.5), endPoint: CGPointMake(1.0,0.5))
//        self.backgroundView!.layer.addSublayer(gradient)
//        self.layer.addSublayer(gradient)
        self.layer.insertSublayer(gradient, atIndex:0)
        
        let backgroundView = UIView(frame: self.frame)
        backgroundView.backgroundColor = UIColor.plaAquaColor()
        self.selectedBackgroundView = backgroundView
        
        let imageView = UIImageView(frame: CGRectMake(0, self.contentView.frame.size.height - 2, self.contentView.frame.size.width, 2))
        imageView.image = UIImage(named: "矩形-3-拷贝-5")
        self.contentView.addSubview(imageView)
        
        itemSubtitle.textColor = UIColor.plaWordl3Color()
        timeSubtitle.textColor = UIColor.plaWordl3Color()
    }
    
    func configCellWithItem(){
        itemTitle.text = NSLocalizedString("The Neck Care", comment: "")
        timeTitle.text = "2016/03/17 07:00~09:00"
    }
    
    func configCellWithNewBranchItem(){
        
        itemTitle.text = NSLocalizedString("Xuhui District, Shanghai", comment: "")
        itemTitle.font = UIFont.systemFontOfSize(11)
        itemSubtitle.text = NSLocalizedString("Branch", comment: "")
        itemSubtitle.font = UIFont.systemFontOfSize(10)
        
        timeTitle.text = NSLocalizedString("Room 505 Qinzhou Building, NO6. Lane", comment: "")
        timeTitle.font = UIFont.systemFontOfSize(11)
        timeSubtitle.text = NSLocalizedString("Qinzhou Road, Xuhui District, Shanghai", comment: "")
        timeSubtitle.font = UIFont.systemFontOfSize(10)
        
        
        
    }
    
}
