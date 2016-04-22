//
//  RegistViewController.swift
//  PLASOFTWARE
//
//  Created by Chris on 4/20/16.
//  Copyright © 2016 Young. All rights reserved.
//

import UIKit
import Alamofire

class RegistViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var confirmPassTextField: UITextField!
    
    @IBOutlet weak var mobileTextField: UITextField!
    
    @IBOutlet weak var mobileConfirmTextField: UITextField!
    
    @IBOutlet weak var confirmButton: UIButton!
    
    let registToMainSegue = "registToMainSegue"

    var paraDict : [String: String] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
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
                
                print("Success Info:\(info)")
                
            case .Failure(let error):
                
                print("Request failed with error: \(error)")
                
            }
        }
        
        performSegueWithIdentifier(registToMainSegue, sender: self)
        
    }


}
