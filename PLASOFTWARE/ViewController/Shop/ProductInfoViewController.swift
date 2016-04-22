//
//  ProductInfoViewController.swift
//  PLASOFTWARE
//
//  Created by 邓超 on 16/3/22.
//  Copyright © 2016年 Young. All rights reserved.
//

import UIKit

class ProductInfoViewController: UIViewController {
    
    @IBOutlet weak var decrementButton: UIButton!
    
    @IBOutlet weak var incrementButton: UIButton!
    
    @IBOutlet weak var quantityLabel: UILabel!
    
    @IBOutlet weak var confirmButton: UIButton!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var brandLabel: UILabel!
    
    @IBOutlet weak var branchLabel: UILabel!
    
    @IBOutlet weak var quantityTagLabel: UILabel!
    
    @IBOutlet weak var detailLabel: UILabel!
    
    override func viewDidLoad() {
        setupUI()
    }
    
    func setupUI(){
        
        title = NSLocalizedString("PRODUCT INFORMATION", comment: "")
        
        nameLabel.text = NSLocalizedString("NAME", comment: "")
        brandLabel.text = NSLocalizedString("BRAND", comment: "")
        branchLabel.text = NSLocalizedString("BRANCH", comment: "")
        quantityTagLabel.text = NSLocalizedString("Quantity", comment: "")
        detailLabel.text = NSLocalizedString("Item Details", comment: "")
        
        confirmButton.setTitle(NSLocalizedString("CONFIRM", comment: ""), forState: .Normal)
        
        
    }
    
    @IBAction func incrementButtonAction(sender: AnyObject) {
        quantityLabel.text = String(Int(quantityLabel.text!)! + 1)
    }
    
    @IBAction func decrementButtonAction(sender: AnyObject) {
        if Int(quantityLabel.text!) <= 0{
            quantityLabel.text = String(0)
        }
        else
        {
            quantityLabel.text = String(Int(quantityLabel.text!)! - 1)
        }
    }

}
