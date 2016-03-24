//
//  SignInViewController.swift
//  PLASOFTWARE
//
//  Created by 邓超 on 16/3/21.
//  Copyright © 2016年 Young. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController, UITextFieldDelegate {
    
    //MARK: Properties
    @IBOutlet weak var usenameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var markPasswordButton: UIButton!
    @IBOutlet weak var markPasswordLabel: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    
    static let storyboardIdentifier = "SignInViewController"
    let NaviToMainSegue = "MainViewControllerSegue"
    
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
    }
  
    //MARK: ACTION
    @IBAction func markPasswordAction(sender: AnyObject) {
        if markPasswordButton.imageView?.image == UIImage(named: "icon_08-20"){
            markPasswordButton.setImage(UIImage(named: "icon_08-21"), forState: .Normal)
        }
        else{
            markPasswordButton.setImage(UIImage(named: "icon_08-20"), forState: .Normal)
        }
        
    }

    @IBAction func loginAction(sender: AnyObject) {
        naviReturnToMain()
    }
    
    func naviReturnToMain(){
        performSegueWithIdentifier(NaviToMainSegue, sender: nil)
    }
    //MARK: TextField Delegate
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
//        if textField == usenameTextField{
//            textField.resignFirstResponder()
//            return true
//        }
//        else{
//            
//        }
        textField.resignFirstResponder()
        return true
    }
}
