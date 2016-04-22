//
//  SignInViewController.swift
//  PLASOFTWARE
//
//  Created by 邓超 on 16/3/21.
//  Copyright © 2016年 Young. All rights reserved.
//

import UIKit
import Alamofire

class SignInViewController: UIViewController, UITextFieldDelegate {
    
    //MARK: Properties
    @IBOutlet weak var usenameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var markPasswordButton: UIButton!
    @IBOutlet weak var markPasswordLabel: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var forgetPassButton: UIButton!
    
    @IBOutlet weak var registButton: UIButton!
    
    var paraDict : [String: String] = [:]
    
    var passwordRememberFlag = false
    
    static let storyboardIdentifier = "SignInViewController"
    
    let NaviToMainSegue = "MainViewControllerSegue"
    
    let registIdentifier = "RegistViewController"
    
    override func viewDidLoad() {
        setupUI()
    }
    
    //MARK: UI
    func setupUI(){
        usenameTextField.attributedPlaceholder = NSAttributedString(string: NSLocalizedString("BUTTON WILL BE GREY IF NO ACCOUNT", comment: "") , attributes: [NSForegroundColorAttributeName: UIColor.plaWordl2Color()])
        passwordTextField.attributedPlaceholder = NSAttributedString(string: NSLocalizedString("PASSWORD FILL IN", comment: ""), attributes: [NSForegroundColorAttributeName: UIColor.plaWordl2Color()])
        
        usenameTextField.delegate = self
        passwordTextField.delegate = self
        
        markPasswordLabel.text = NSLocalizedString("REMEMBER PASSWORD", comment: "")
        markPasswordLabel.textColor = UIColor.plaWordl2Color()
        
        self.hideKeyboardWhenTappedAround()
        
        forgetPassButton.setTitle(NSLocalizedString("FORGOT PASSWORD", comment: ""), forState: .Normal)
        registButton.setTitle(NSLocalizedString("REGIST", comment: ""), forState: .Normal)
        
        
    }
  
    //MARK: ACTION
    @IBAction func markPasswordAction(sender: AnyObject) {
        if markPasswordButton.imageView?.image == UIImage(named: "icon_08-20"){
            markPasswordButton.setImage(UIImage(named: "icon_08-21"), forState: .Normal)
            
            passwordRememberFlag = true
            
        }
        else{
            markPasswordButton.setImage(UIImage(named: "icon_08-20"), forState: .Normal)
            
            passwordRememberFlag = false
            
        }
        
    }
    
    @IBAction func registAction(sender: AnyObject) {
        
        let registViewController = UIStoryboard.mainStoryboard.instantiateViewControllerWithIdentifier(registIdentifier)
        
        self.presentViewController(registViewController, animated: true, completion: nil)
        
    }
    

    @IBAction func loginAction(sender: AnyObject) {
//        naviReturnToMain()
        apiRequest()
    }
    
    func naviReturnToMain(){
        performSegueWithIdentifier(NaviToMainSegue, sender: self)
    }
    
    //MARK: TextField Delegate
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    //MARK: NetWorking
    func apiRequest(){
        
        
        let urlStr = SERVER_URL + USERLOGIN
        
        let timeStamp = Utils.UNIX_TIMESTAMP()
        
        let md5Pass = Utils.md5(passwordTextField.text!)
        
        let md5Sub = Utils.md5(timeStamp + usenameTextField.text! + MD5_KEY)
        
        let md5Str = Utils.md5(md5Pass + md5Sub)
        
        self.paraDict = [
            "user": usenameTextField.text!,
            "pass": md5Pass,
            "string": md5Str,
            "time" : Utils.UNIX_TIMESTAMP()
        ]
        
        Alamofire.request(.POST, urlStr, parameters: paraDict).responseJSON {
            response in switch response.result
            {
                case .Success(let JSON):
                    
                    print("\(self.paraDict)")
                    
                    print("Success with JSON: \(JSON)")
            
                    let response = JSON as! NSDictionary
            
                    //info
                    let info = response.objectForKey("info")!
                    
                    //state
                    let state = response.objectForKey("iserror")! as! Int
                    
                    if state == 0 {
                        self.naviReturnToMain()
                    }
                    
                    if state == 1 {
                        
                        let alertController = UIAlertController(title: "错误", message: "\(info)", preferredStyle: .Alert)
                        
                        let alertDoneAction = UIAlertAction(title: "确定", style: .Default, handler: nil)
                        
                        alertController.addAction(alertDoneAction)
                        
                        self.presentViewController(alertController, animated: true, completion: nil)
                    }
                    
                    print("Success Info:\(info)")
                
                case .Failure(let error):
                    
                    print("Request failed with error: \(error)")
                
            }
        }
    }
}