//
//  ReservedViewController.swift
//  PLASOFTWARE
//
//  Created by 邓超 on 16/3/22.
//  Copyright © 2016年 Young. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper
import Refresher

class ReservedViewController: UITableViewController {

    //0: cancel ,10: confirming, 11: confirmed
    var status : String = "11"
    
    let ConfirmingCellReusableIdentifier = "ConfirmingCell"
    
    var paraDict : [String: String] = [:]
    
    var reserveInfoArray : [reservationList] = []
    
    override func viewDidLoad() {
        setupUI()
        
        apiRequest()
    }
    
    func setupUI(){
        title = NSLocalizedString("Reserved", comment: "")
        
        let imageView = UIImageView(frame: self.view.frame)
        imageView.image = UIImage(named: "背景2")
        
        self.view.insertSubview(imageView, atIndex: 0)
        
        self.view.backgroundColor = UIColor.plaSteelblueColor()
        
        self.tableView.addPullToRefreshWithAction {
            self.apiRequest()
            NSOperationQueue.mainQueue().addOperationWithBlock({
                self.tableView.stopPullToRefresh()
            })
        }
    }
    
    func apiRequest(){
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
        
        let urlStr = SERVER_URL + RESERVATION_LIST
        
        let timeStamp = Utils.UNIX_TIMESTAMP()
        
        let user = Utils.getValueFromUserDefaultWithKey("username")
        
        let md5SubStr = Utils.md5(user + MD5_KEY + timeStamp)
        
        let md5Str = Utils.md5(self.status + md5SubStr)
        
        self.paraDict = [
            "user" : user!,
            "status" : status,
            "string" : md5Str,
            "time" : timeStamp
        ]
        
        
        Alamofire.request(.POST, urlStr, parameters: paraDict).responseJSON {
            (response) in switch response.result{
            case.Success(let JSON):
                print("Para: \(self.paraDict)")
                print("JSON: \(JSON)")
                
                let response = JSON as! NSDictionary
                
                //state
                let state = response.objectForKey("iserror")! as! Int
                
                if state == 0{
                    let data = response.objectForKey("data")! as! NSArray
                    
                    self.reserveInfoArray.removeAll()
                    
                    for dataObject : AnyObject in data
                    {
                        
                        let reserveInfo = Mapper<reservationList>().map(dataObject)
                        self.reserveInfoArray.append(reserveInfo!)
                        
                        print("storeModel: \(reserveInfo?.name)")
                        
                    }
                    dispatch_async(dispatch_get_main_queue(), {
                        UIApplication.sharedApplication().networkActivityIndicatorVisible = false
                        
                        self.tableView.reloadData()
                    })
                }
                
                if state == 1{
                    let info = response.objectForKey("info")! as! String
                    
                    let alertController = UIAlertController(title: "获取数据失败", message: "\(info)", preferredStyle: .Alert)
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
        return self.reserveInfoArray.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier(ConfirmingCellReusableIdentifier, forIndexPath: indexPath) as! ConfirmingReservationCell
        
        cell.configCellWithReservationInfo(self.reserveInfoArray[indexPath.row])
        
        return cell
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let reservedDetailViewController = UIStoryboard.mainStoryboard.instantiateViewControllerWithIdentifier("ReservedDetailedTableViewCOntroller")
        
        self.navigationController?.pushViewController(reservedDetailViewController, animated: true)
        
    }
}
