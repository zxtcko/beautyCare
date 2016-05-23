//
//  CityPopoverMenu.swift
//  PLASOFTWARE
//
//  Created by Chris on 16/5/23.
//  Copyright © 2016年 Young. All rights reserved.
//

import UIKit

protocol CityPopoverMenuDelegate: class{
    func popoverButtonDidSelected(button: UIButton)
}

class CityPopoverMenu: UIViewController {

    weak var delegate: CityPopoverMenuDelegate?
    
    var citiesArray : [city] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        // Do any additional setup after loading the view.
    }
    
    func setupUI(){
        self.view.backgroundColor = UIColor.plaSteelblueColor()
        
        print("Array Count: \(self.citiesArray.count)")
        
        self.preferredContentSize = CGSizeMake(120.0, 40.0 * CGFloat(self.citiesArray.count))
        
        var i : Int = 0
        
        while i <= self.citiesArray.count - 1 {
            
            let cityButton = UIButton(frame: CGRectMake(0, CGFloat(i) * 40.0, 120.0, 40.0))
            
            let cityName : String = self.citiesArray[i].city!
            
            cityButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
            cityButton.setTitle(cityName, forState: .Normal)
            cityButton.titleLabel!.font =  UIFont.systemFontOfSize(14.0)
            cityButton.titleLabel!.textAlignment = .Center
            cityButton.addTarget(self, action: #selector(ShopPopoverMenu.popoverButtonSelectedAction(_:)), forControlEvents: .TouchUpInside)
            
            self.view.insertSubview(cityButton, atIndex: 0)
            
            i = i + 1
        }
        
    }

    func popoverButtonSelectedAction(sender: UIButton){
        delegate?.popoverButtonDidSelected(sender)
        
        dismissViewControllerAnimated(true, completion: nil)
    }

}
