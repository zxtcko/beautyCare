//
//  BranchDetailReusableCell.swift
//  PLASOFTWARE
//
//  Created by Chris on 16/5/20.
//  Copyright © 2016年 Young. All rights reserved.
//

import UIKit

class BranchDetailReusableCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
        let imageView = UIImageView(frame: CGRectMake(0, self.contentView.frame.size.height - 2, self.contentView.frame.size.width, 2))
        imageView.image = UIImage(named: "矩形-3-拷贝-5")
        self.contentView.addSubview(imageView)
        
    }

    
    func configCellWithItem(indexPath: NSIndexPath, name: String){
        
        switch indexPath.row{
            
        case 0:
            self.textLabel?.text = NSLocalizedString(name, comment: "")
            self.detailTextLabel?.text = ""
            break
        case 1:
            self.textLabel?.text = NSLocalizedString("ITEMS", comment: "")
            self.detailTextLabel?.text = NSLocalizedString("The Neck Care", comment: "")
        case 2:
            self.textLabel?.text = NSLocalizedString("BEAUTICIAN", comment: "")
            self.detailTextLabel?.text = NSLocalizedString("随机", comment: "")
        case 3:
            self.textLabel?.text = NSLocalizedString("BEGIN TIME", comment: "")
            self.detailTextLabel?.text = NSLocalizedString("", comment: "")
        case 4:
            self.textLabel?.text = NSLocalizedString("END TIME", comment: "")
            self.detailTextLabel?.text = NSLocalizedString("", comment: "")
        case 5:
            self.textLabel?.text = NSLocalizedString("PHONE", comment: "")
            self.detailTextLabel?.text = NSLocalizedString("159366888585", comment: "")
        case 6:
            self.textLabel?.text = NSLocalizedString("NOTE", comment: "")
        default: break
            
        }
        
    }
}
