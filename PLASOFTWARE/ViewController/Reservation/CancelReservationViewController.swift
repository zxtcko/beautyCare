//
//  CancelReservationViewController.swift
//  PLASOFTWARE
//
//  Created by Chris on 16/3/23.
//  Copyright © 2016年 Young. All rights reserved.
//

import UIKit

class CancelReservationViewController: UIViewController, UITextViewDelegate {
    
    @IBOutlet weak var confirmButton: UIButton!
    
    @IBOutlet weak var giveupButton: UIButton!
    
    @IBOutlet weak var textView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI(){
        confirmButton.setTitle(NSLocalizedString("CONFIRM", comment: ""), forState: .Normal)
        giveupButton.setTitle(NSLocalizedString("GIVE UP", comment: ""), forState: .Normal)
        
        textView.delegate = self
        textView.text = NSLocalizedString("The reason of cancel", comment: "")
        textView.textColor = UIColor.lightGrayColor()
        
        self.hideKeyboardWhenTappedAround()
    }
    
    func textViewDidBeginEditing(textView: UITextView) {
        if textView.textColor == UIColor.lightGrayColor() {
            textView.text = nil
            textView.textColor = UIColor.blackColor()
        }
    }
    
    func textViewDidEndEditing(textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = NSLocalizedString("The reason of cancel", comment: "")
            textView.textColor = UIColor.lightGrayColor()
        }
    }
}
