//
//  RefusedDetailTableViewController.swift
//  PLASOFTWARE
//
//  Created by Chris on 16/4/25.
//  Copyright © 2016年 Young. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper

class RefusedDetailTableViewController: UITableViewController {
    
    
    let cancelReservationSegue = "CancelReservationSegue"
    
    let cellReusableIdentifier = ""
    
    //0: cancel ,10: confirming, 11: confirmed
    var status : String = "0"
    
    internal var reservationID : String = ""
    
    var paraDict : [String: String] = [:]
    
    var reserveDetailModel : reservationInfo?
    
    var headerImageView:UIImageView!
    
    override func viewDidLoad() {
        setupUI()
        
        apiRequest()
    }
    
    func setupUI(){
        title = NSLocalizedString("DETAILS", comment: "")
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

    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if reserveDetailModel == nil {
            return 0
        }
        
        return 10
        
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("RejectedReservationIdentifier", forIndexPath: indexPath) as! RejectedReservationCell

        cell.configcellWithModel(indexPath, reserveDetail: reserveDetailModel!)
    
        return cell
    }
    
}
