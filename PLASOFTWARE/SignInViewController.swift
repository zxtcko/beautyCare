//
//  SignInViewController.swift
//  PLASOFTWARE
//
//  Created by 邓超 on 16/3/21.
//  Copyright © 2016年 Young. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {
    
    @IBOutlet weak var usenameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var markPasswordButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    
    static let storyboardIdentifier = "SignInViewController"
    let NaviToMainSegue = "MainViewControllerSegue"
    
    override func viewDidLoad() {
        
    }
    
    @IBAction func loginAction(sender: AnyObject) {
        naviReturnToMain()
    }
    
    func naviReturnToMain(){
        performSegueWithIdentifier(NaviToMainSegue, sender: nil)
    }
    
}
