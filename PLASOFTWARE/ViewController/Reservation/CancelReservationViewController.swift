//
//  CancelReservationViewController.swift
//  PLASOFTWARE
//
//  Created by Chris on 16/3/23.
//  Copyright © 2016年 Young. All rights reserved.
//

import UIKit
import Alamofire

class CancelReservationViewController: UIViewController, UITextViewDelegate {
    
    @IBOutlet weak var confirmButton: UIButton!
    
    @IBOutlet weak var giveupButton: UIButton!
    
    @IBOutlet weak var textView: UITextView!
    
    var reservationId : String?

    var paraDict : [String: String] = [:]
    
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
    
    @IBAction func confirmButtonAction(sender: AnyObject) {
        apiRequest()
    }
    
    
    @IBAction func giveupButtonAction(sender: AnyObject) {
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    func apiRequest(){
        let urlStr = SERVER_URL + RESERVATION_CANCEL
        
        let timeStamp = Utils.UNIX_TIMESTAMP()
        
        let md5SubStr = Utils.md5(self.reservationId! + MD5_KEY)
        let md5Str = Utils.md5(timeStamp + md5SubStr)
        
        self.paraDict = [
            "id" : self.reservationId!,
            "string" : md5Str,
            "time" : timeStamp
        ]
        
        Alamofire.request(.POST, urlStr, parameters: paraDict).responseJSON {
            (response) in switch response.result{
            case.Success(let JSON):
                let response = JSON as! NSDictionary
            
                let state = response.objectForKey("iserror") as! Int
                
                if state == 0 {
                    let alertController = UIAlertController(title: "取消成功", message: "", preferredStyle: .Alert)
                    alertController.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
                    
                    self.presentViewController(alertController, animated: true, completion: nil)
                    
                    self.navigationController?.popViewControllerAnimated(true)
                }
                
                if state == 1{
                    let info = response.objectForKey("info") as! String
                    
                    let alertController = UIAlertController(title: "取消失败", message: "\(info)", preferredStyle: .Alert)
                    alertController.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
                    
                    self.presentViewController(alertController, animated: true, completion: nil)
                }
                
            case.Failure(let error):
                print(error)
            }
            
        }
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
