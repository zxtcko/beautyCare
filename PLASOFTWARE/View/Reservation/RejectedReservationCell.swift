//
//  RejectedReservationCell.swift
//  PLASOFTWARE
//
//  Created by Chris on 16/5/20.
//  Copyright © 2016年 Young. All rights reserved.
//

import UIKit

class RejectedReservationCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        let imageView = UIImageView(frame: CGRectMake(0, self.contentView.frame.size.height - 2, self.contentView.frame.size.width, 2))
        imageView.image = UIImage(named: "矩形-3-拷贝-5")
        
        self.contentView.addSubview(imageView)
    }

    func configcellWithModel(IndexPath: NSIndexPath, reserveDetail: reservationInfo){
        
        switch IndexPath.row{
        case 0:
            self.textLabel?.text = NSLocalizedString("BRANCH", comment: "")
            self.detailTextLabel?.text = reserveDetail.storename
        case 1:
            self.textLabel?.text = NSLocalizedString("ITEMS", comment: "")
            self.detailTextLabel?.text = reserveDetail.servicename
        case 2:
            self.textLabel?.text = NSLocalizedString("BEAUTICIAN", comment: "")
            if reserveDetail.employeename == nil{
                self.detailTextLabel?.text = "随机"
            }
            self.detailTextLabel?.text = reserveDetail.employeename
        case 3:
            self.textLabel?.text = NSLocalizedString("BEGIN TIME", comment: "")
            self.detailTextLabel?.text = reserveDetail.begindate
        case 4:
            self.textLabel?.text = NSLocalizedString("END TIME", comment: "")
            self.detailTextLabel?.text = reserveDetail.enddate
        case 5:
            self.textLabel?.text = NSLocalizedString("PHONE", comment: "")
            self.detailTextLabel?.text = reserveDetail.mobile
        case 6:
            self.textLabel?.text = NSLocalizedString("Note", comment: "")
            self.detailTextLabel?.text = reserveDetail.remark
        
        default: break
        }

    }

}
