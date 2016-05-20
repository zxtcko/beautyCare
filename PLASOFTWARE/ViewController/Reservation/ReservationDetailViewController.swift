//
//  ReservationDetailViewController.swift
//  PLASOFTWARE
//
//  Created by 邓超 on 16/3/22.
//  Copyright © 2016年 Young. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper

class ReservationDetailViewController: UITableViewController {
    
    @IBOutlet weak var cancelReservationButton: UIBarButtonItem!
    
    //0: cancel ,10: confirming, 11: confirmed
    var status : String = "10"
    
    internal var reservationID : String = ""
    
    var paraDict : [String: String] = [:]
    
    var reserveDetailModel : reservationInfo?
    
    let cancelReservationSegue = "CancelReservationSegue"
    
    let cellReusableIdentifier = "DetailCell"
    
    var headerImageView:UIImageView!
    
    override func viewDidLoad() {
        setupUI()
        
        apiRequest()
    }
    
    func apiRequest(){
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
        
        let urlStr = SERVER_URL + RESERVATION_INFO
        
        let md5SubStr = Utils.md5(self.reservationID + MD5_KEY + self.status)
        
        let timeStamp = Utils.UNIX_TIMESTAMP()
        
        let md5Str = Utils.md5(timeStamp + md5SubStr)
        
        self.paraDict = [
            
            "status" : status,
            "id" : reservationID,
            "string" : md5Str,
            "time" : timeStamp
            
        ]
        
        Alamofire.request(.POST, urlStr, parameters: paraDict).responseJSON {
            (response) in switch response.result
            {
                
            case.Success(let JSON):
                let response = JSON as! NSDictionary
                
//                self.reserveDetailModel.removeAll()
                
                print(self.paraDict)
                
                print(JSON)
                let state = response.objectForKey("iserror") as! Int
                
                let data = response.objectForKey("data") as! NSDictionary
                
                if state == 0{

                    let reserveDetail = Mapper<reservationInfo>().map(data)
                    
                    self.reserveDetailModel = reserveDetail
//                    self.reserveDetailModel.append(reserveDetail!)
                    
                    print("storeModel: \(reserveDetail?.servicename)")
                    
                    dispatch_async(dispatch_get_main_queue(), { 
                        UIApplication.sharedApplication().networkActivityIndicatorVisible = false
                        
                        self.tableView.reloadData()
                    })
                }
                
                if state == 1{
                    
                    let info = response.objectForKey("info") as! String
                    
                    let alertController = UIAlertController(title: "错误", message: "\(info)", preferredStyle: .Alert)
                    alertController.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
                    
                    self.presentViewController(alertController, animated: true, completion: nil)
                    
                }
            case.Failure(let error):
                
                print(error)
            }
        }
    }
    
    func setupUI(){
        title = NSLocalizedString("DETAILS", comment: "")
        
        cancelReservationButton.target = self
        cancelReservationButton.action = #selector(ReservationDetailViewController.cancelReservationAction)
    }
    
    func cancelReservationAction(){
        let cancelReservationViewController = UIStoryboard.mainStoryboard.instantiateViewControllerWithIdentifier("CancelReservationIdentifier") as! CancelReservationViewController
        
        cancelReservationViewController.reservationId = self.reservationID
        self.navigationController?.pushViewController(cancelReservationViewController, animated: true)
    }
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.reserveDetailModel == nil{
            return 0
        }

        return 7
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier(cellReusableIdentifier, forIndexPath: indexPath) as! ReservationDetailCell
        
        cell.configCellWithModel(reserveDetailModel!, forIndexPath: indexPath)
        
        return cell
    }
}
