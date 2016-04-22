//
//  ShopProductCell.swift
//  PLASOFTWARE
//
//  Created by 邓超 on 16/3/22.
//  Copyright © 2016年 Young. All rights reserved.
//

import UIKit

class ShopProductCell: UITableViewCell {
    
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productBranchLabel: UILabel!
    @IBOutlet weak var productPriceLabel: UILabel!
    
    override func awakeFromNib() {
        productImage.image = UIImage(named: "图层-5")
        productNameLabel.text = NSLocalizedString("NAME", comment: "")
        productBranchLabel.text = NSLocalizedString("BRANCH", comment: "") 
        productPriceLabel.text = "$ 999"
        
        let backgroundView = UIView(frame: CGRectMake(0,self.frame.size.height - 2,self.frame.size.width,2))
        backgroundView.backgroundColor = UIColor.plaWordl3Color()
        
        self.contentView.addSubview(backgroundView)
    }
    
    func configCellWithItem(){
        
    }
}
