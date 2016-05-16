//
//  Extensions.swift
//  PLASOFTWARE
//
//  Created by 邓超 on 16/3/21.
//  Copyright © 2016年 Young. All rights reserved.
//

import Foundation
import UIKit

extension UIColor{
    
    //孔雀绿
    class func plaAquaColor() -> UIColor {
        return UIColor(red: 0, green: 193/255, blue: 255/255, alpha: 1)
    }
    
    //黄色
    class func plaYellowColor() -> UIColor {
        return UIColor(red: 255/255, green: 240/255, blue: 0, alpha: 1)
    }
    
    //青色
    class func plaTealColor() -> UIColor{
        return UIColor(red: 28/255, green: 163/255, blue: 187/255, alpha: 1)
    }
    
    //草坪绿
    class func plaLawngreenColor() -> UIColor {
        return UIColor(red: 156/255, green: 254/255, blue: 14/255, alpha: 1)
    }
    
    //橙色
    class func plaOrangeColor() -> UIColor {
        return UIColor(red: 240/255, green: 131/255, blue: 30/255, alpha: 1)
    }
    
    //铁青色
    class func plaSteelblueColor() -> UIColor{
        return UIColor(red: 55/255, green: 68/255, blue: 100/255, alpha: 1)
    }
    
    //文字颜色，l1-l5（由浅至深）
    class func plaWordl1Color() -> UIColor {
        return UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
    }
    
    class func plaWordl2Color() -> UIColor {
        return UIColor(red: 204/255, green: 204/255, blue: 204/255, alpha: 1)
    }
    
    class func plaWordl3Color() -> UIColor {
        return UIColor(red: 153/255, green: 153/255, blue: 153/255, alpha: 1)
    }
    
    class func plaWordl4Color() -> UIColor {
        return UIColor(red: 102/255, green: 102/255, blue: 102/255, alpha: 1)
    }
    
    class func plaWordl5Color() -> UIColor {
        return UIColor(red: 54/255, green: 54/255, blue: 54/255, alpha: 1)
    }
}

extension UIButton{
    func decorateForPla(){
        self.layer.masksToBounds = false
        self.layer.cornerRadius = 15.0
    }
}

//建立纯色背景图片
extension UIImage {
    func makeImageWithColorAndSize(color: UIColor, size: CGSize) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        color.setFill()
        UIRectFill(CGRectMake(0, 0, size.width, size.height))
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}

extension CAGradientLayer{
    
    func gradientForPla(startColor:UIColor, endColor:UIColor, startPoint:CGPoint, endPoint:CGPoint ){
        let colors: [AnyObject] = [startColor.CGColor, endColor]
        self.colors = colors
        self.startPoint = startPoint
        self.endPoint = endPoint
    }
}

//MainStoryboard
extension UIStoryboard{
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: nil)
    }
}

//隐藏键盘
extension UIViewController{
    func hideKeyboardWhenTappedAround(){
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard(){
        view.endEditing(true)
    }
}