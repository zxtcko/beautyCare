//
//  MainViewController.swift
//  PLASOFTWARE
//
//  Created by 邓超 on 16/3/21.
//  Copyright © 2016年 Young. All rights reserved.
//

import UIKit


class MainViewController: UIViewController {
    
    @IBOutlet weak var reserveButton: UIButton!
    @IBOutlet weak var shopButton: UIButton!
    @IBOutlet weak var activityButton: UIButton!
    @IBOutlet weak var scheduleButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    func setupUI(){
        reserveButton.setTitleColor(UIColor.plaWordl3Color(), forState: .Normal)
        reserveButton.setTitleColor(UIColor.plaAquaColor(), forState: .Highlighted)
        reserveButton.setImage(UIImage(named: "icon_03-25"), forState: .Highlighted)
        
        shopButton.setTitleColor(UIColor.plaWordl3Color(), forState: .Normal)
        shopButton.setTitleColor(UIColor.plaAquaColor(), forState: .Highlighted)
        shopButton.setImage(UIImage(named: "icon_03-5"), forState: .Highlighted)
        
        activityButton.setTitleColor(UIColor.plaWordl3Color(), forState: .Normal)
        activityButton.setTitleColor(UIColor.plaAquaColor(), forState: .Highlighted)
        activityButton.setImage(UIImage(named: "icon_03-31"), forState: .Highlighted)
        
        scheduleButton.setTitleColor(UIColor.plaWordl3Color(), forState: .Normal)
        scheduleButton.setTitleColor(UIColor.plaAquaColor(), forState: .Highlighted)
        scheduleButton.setImage(UIImage(named: "icon_03-19"), forState: .Highlighted)
        
        
    }
}
