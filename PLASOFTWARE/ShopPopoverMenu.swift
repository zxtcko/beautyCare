//
//  ShopPopoverMenu.swift
//  PLASOFTWARE
//
//  Created by 邓超 on 16/3/21.
//  Copyright © 2016年 Young. All rights reserved.
//

import UIKit

protocol ShopPopoverMenuDelegate: class{
    func popoverButtonDidSelected(button: UIButton)
}

class ShopPopoverMenu: UIViewController {
    
    @IBOutlet var hanoiButton: UIButton!
    @IBOutlet weak var haiphongButton: UIButton!
    @IBOutlet weak var thanhhoaButton: UIButton!
    @IBOutlet weak var vinhButton: UIButton!
    @IBOutlet weak var donghoiButton: UIButton!
    
    weak var delegate: ShopPopoverMenuDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.plaTealColor()
        
        setUpUI()
    }
    
    func setUpUI(){
        hanoiButton.setTitle(NSLocalizedString("Hanoi", comment: ""), forState: .Normal)
        haiphongButton.setTitle(NSLocalizedString("Haiphong", comment: ""), forState: .Normal)
        thanhhoaButton.setTitle(NSLocalizedString("Thanh Hoa", comment: ""), forState: .Normal)
        vinhButton.setTitle(NSLocalizedString("Vinh", comment: ""), forState: .Normal)
        donghoiButton.setTitle(NSLocalizedString("Dong Hoi", comment: ""), forState: .Normal)
        
        hanoiButton.addTarget(self, action: "popoverButtonSelectedAction:", forControlEvents: .TouchUpInside)
        haiphongButton.addTarget(self, action: "popoverButtonSelectedAction:", forControlEvents: .TouchUpInside)
        thanhhoaButton.addTarget(self, action: "popoverButtonSelectedAction:", forControlEvents: .TouchUpInside)
        vinhButton.addTarget(self, action: "popoverButtonSelectedAction:", forControlEvents: .TouchUpInside)
        donghoiButton.addTarget(self, action: "popoverButtonSelectedAction:", forControlEvents: .TouchUpInside)
    }
    
    func popoverButtonSelectedAction(sender: UIButton){
        delegate?.popoverButtonDidSelected(sender)
        
        dismissViewControllerAnimated(true, completion: nil)
    }

}
