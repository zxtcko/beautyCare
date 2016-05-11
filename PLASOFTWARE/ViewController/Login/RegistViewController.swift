//
//  RegistViewController.swift
//  PLASOFTWARE
//
//  Created by Chris on 4/20/16.
//  Copyright © 2016 Young. All rights reserved.
//

import UIKit
import Alamofire
import DigitsKit

class RegistViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var confirmPassTextField: UITextField!
    
    @IBOutlet weak var mobileTextField: UITextField!
    
    @IBOutlet weak var mobileConfirmTextField: UITextField!
    
    @IBOutlet weak var confirmButton: UIButton!
    
    let digits = Digits.sharedInstance()
    
    internal var phoneNum = String()
    
    let registToMainSegue = "registToMainSegue"

    var paraDict : [String: String] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print("\(phoneNum)")
        
        mobileTextField.text = (phoneNum as NSString).substringFromIndex(1)
    }


    func naviReturnToMain(){
        performSegueWithIdentifier(registToMainSegue, sender: self)
    }
    

    @IBAction func registButtonAction(sender: AnyObject) {
        
        let urlStr = SERVER_URL + USERREGIST
        
        let timeStamp = Utils.UNIX_TIMESTAMP()
        
        let md5Pass = Utils.md5(passwordTextField.text!)
        
        let md5Sub = Utils.md5(timeStamp + usernameTextField.text! + MD5_KEY + mobileTextField.text!)
        
        let md5Str = Utils.md5(md5Pass + md5Sub)
        
        self.paraDict = [
            "mobile": mobileTextField.text!,
            "user": usernameTextField.text!,
            "pass": md5Pass,
            "string": md5Str,
            "time" : Utils.UNIX_TIMESTAMP()
        ]
        
        
        
        Alamofire.request(.POST, urlStr, parameters: paraDict).responseJSON {
            response in switch response.result
            {
            case .Success(let JSON):
                
                print("Parameters: \(self.paraDict)")
                
                print("Success with JSON: \(JSON)")
                
                let response = JSON as! NSDictionary
                
                //example if there is an id
                let info = response.objectForKey("info")!
                
                
                //state
                let state = response.objectForKey("iserror")! as! Int
                
                print("Success :\(info)")
                
                
                if state == 0 {
                    
                    let userDefault = NSUserDefaults.standardUserDefaults()
                    
                    userDefault.setValue("\(self.usernameTextField.text!)", forKey: "username")
                    userDefault.setValue("\(self.passwordTextField.text!)", forKey: "password")
                    
                    self.naviReturnToMain()
                    
                }
                
                if state == 1 {
                    
                    let alertController = UIAlertController(title: "错误", message: "\(info)", preferredStyle: .Alert)
                    
                    let alertDoneAction = UIAlertAction(title: "确定", style: .Default, handler: nil)
                    
                    alertController.addAction(alertDoneAction)
                    
                    self.presentViewController(alertController, animated: true, completion: nil)
                }
                
            case .Failure(let error):
                
                print("Request failed with error: \(error)")
                
            }
        }
        
//        performSegueWithIdentifier(registToMainSegue, sender: self)
        
    }


}
