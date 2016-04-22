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
        reserveButton.setTitle(NSLocalizedString("RESERVATION", comment: ""), forState: .Normal);
        reserveButton.setTitleColor(UIColor.plaWordl3Color(), forState: .Normal)
        reserveButton.setTitleColor(UIColor.plaAquaColor(), forState: .Highlighted)
        reserveButton.setImage(UIImage(named: "icon_03-25"), forState: .Highlighted)
        
        shopButton.setTitle(NSLocalizedString("SHOPS", comment: ""), forState: .Normal);
        shopButton.setTitleColor(UIColor.plaWordl3Color(), forState: .Normal)
        shopButton.setTitleColor(UIColor.plaAquaColor(), forState: .Highlighted)
        shopButton.setImage(UIImage(named: "icon_03-5"), forState: .Highlighted)
        
        activityButton.setTitle(NSLocalizedString("ACTIVITIES", comment: ""), forState: .Normal);
        activityButton.setTitleColor(UIColor.plaWordl3Color(), forState: .Normal)
        activityButton.setTitleColor(UIColor.plaAquaColor(), forState: .Highlighted)
        activityButton.setImage(UIImage(named: "icon_03-31"), forState: .Highlighted)
        
        scheduleButton.setTitle(NSLocalizedString("SCHEDULE", comment: ""), forState: .Normal);
        scheduleButton.setTitleColor(UIColor.plaWordl3Color(), forState: .Normal)
        scheduleButton.setTitleColor(UIColor.plaAquaColor(), forState: .Highlighted)
        scheduleButton.setImage(UIImage(named: "icon_03-19"), forState: .Highlighted)
        
        let btnName = UIButton()
        btnName.setImage(UIImage(named: "图层-2"), forState: .Normal)
        btnName.frame = CGRectMake(0, 0, 30, 30)
        
        let btnLogo = UIButton()
        btnLogo.setImage(UIImage(named: "logoin_tv_logo"), forState: .Normal)
        btnLogo.frame = CGRectMake(35, 15, 109, 12)
        
        let customLeftButtonItemView = UIView()
        customLeftButtonItemView.frame = CGRectMake(0, 0, 180, 30)
        customLeftButtonItemView.backgroundColor = UIColor.clearColor()
        customLeftButtonItemView.addSubview(btnName)
        customLeftButtonItemView.addSubview(btnLogo)
        
        //.... Set Right/Left Bar Button item
        let leftBarButton = UIBarButtonItem()
        leftBarButton.customView = customLeftButtonItemView
        
        self.navigationItem.leftBarButtonItem = leftBarButton
    }
}
