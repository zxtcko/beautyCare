//
//  NewReservationReusableCell.swift
//  PLASOFTWARE
//
//  Created by Chris on 16/4/22.
//  Copyright © 2016年 Young. All rights reserved.
//

import UIKit

class NewReservationReusableCell: UITableViewCell {
    
    override func awakeFromNib() {
        
        
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
        
    }
    
    func configCellWithItem(){
        self.textLabel?.text = NSLocalizedString("Xuhui District, Shanghai", comment: "")
        self.detailTextLabel?.text = NSLocalizedString("Room 505 Qinzhou Building, NO6. Lane", comment: "")
    }

}
