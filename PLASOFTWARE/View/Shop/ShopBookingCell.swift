//
//  ShopBookingCell.swift
//  PLASOFTWARE
//
//  Created by Chris on 16/3/25.
//  Copyright © 2016年 Young. All rights reserved.
//

import UIKit

class ShopBookingCell: UITableViewCell {

    @IBOutlet weak var bookingImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var branchLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var cancelButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        bookingImageView.image = UIImage(named:"图层-5")
        
        nameLabel.text = NSLocalizedString("NAME", comment: "")
        branchLabel.text = NSLocalizedString("BRANCH", comment: "")
        addressLabel.text = NSLocalizedString("Detailed Address", comment: "")
        priceLabel.text = NSLocalizedString("$ 999", comment: "")
        
        cancelButton.setTitle(NSLocalizedString("CANCEL BOOKING", comment: ""), forState: .Normal)
        
        let backgroundView = UIView(frame: CGRectMake(0,self.frame.size.height - 2,self.frame.size.width,2))
        backgroundView.backgroundColor = UIColor.plaWordl3Color()
        
        self.contentView.addSubview(backgroundView)
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
