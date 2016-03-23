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
    
    override func viewDidLoad() {
        setupUI()
    }
    
    func setupUI(){
        title = NSLocalizedString("PRODUCT INFORMATION", comment: "")
        
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
