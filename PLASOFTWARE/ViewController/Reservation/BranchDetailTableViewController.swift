//
//  BranchDetailTableViewController.swift
//  PLASOFTWARE
//
//  Created by Chris on 16/4/22.
//  Copyright © 2016年 Young. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper
import ActionSheetPicker_3_0

class BranchDetailTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    let cellReusableIdentifier = "BranchDetailCell"
    
    internal var storeID : String?
    internal var subStoreID : String?
    internal var storeName: String?
    internal var subStroeName : String?
    
    var serviceid : String?
    var employeeid : String?
    var begintime : String?
    var endtime : String?
    var mobile : String?
    var remark : String = ""
    
    var servicesArray : [String] = []
    var stuffsArray : [String] = []
    
    var stuffsDic :  [String: String] = [:]
    var servicesDic : [String: String] = [:]
    
    var paraDict : [String: String] = [:]
    
    var user : String?
    
    @IBOutlet weak var BranchDetailTableView: UITableView!
    
    override func viewDidLoad() {
        
        setupUI()
        
    }
    
    func setupUI(){
        
        BranchDetailTableView.delegate = self
        BranchDetailTableView.dataSource = self
        
        self.mobile = "12345678901"
        
        apiInfoRequest()
        
    }
    
    @IBAction func reserveButtonAction(sender: AnyObject) {
        apiReserveRequest()
    }

    func apiInfoRequest(){
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
        
        let urlStr = SERVER_URL + STORE_SERVICE_STUFF
        
        let timeStamp = Utils.UNIX_TIMESTAMP()
        
        let md5SubStr = Utils.md5(self.storeID! + MD5_KEY + self.subStoreID!)
        
        let md5Str = Utils.md5(timeStamp + md5SubStr)
        
        self.paraDict = [
            
            "orgid" : self.storeID!,
            "storeid" : self.subStoreID!,
            "string" : md5Str,
            "time" : timeStamp
            
        ]
        
        Alamofire.request(.POST, urlStr, parameters: self.paraDict).responseJSON {
            (response) in switch response.result{
            case.Success(let JSON):
                let response = JSON as! NSDictionary
                
                print("\(JSON)")
                //state
                let state = response.objectForKey("iserror")! as! Int
                
                if state == 0{
                    
                    self.stuffsArray.removeAll()
                    self.servicesArray.removeAll()
                    
                    self.stuffsArray.append("随机")
                    
                    self.stuffsDic.updateValue("0", forKey: "随机")
                    
                    let data = response.objectForKey("data") as! NSDictionary

                    let employees = data.objectForKey("employee") as! NSArray
                    
                    for employeeObject : AnyObject in employees{
                        
                        let stuffRowData = Mapper<stuff>().map(employeeObject)
                        
                        print("stuffname: \(stuffRowData?.name)")
                        
                        self.stuffsArray.append(stuffRowData!.name!)
                        
                        self.stuffsDic.updateValue((stuffRowData?.id)!, forKey: stuffRowData!.name!)
                    }
                            
                    let services = data.objectForKey("service") as! NSArray
                    
                    for serviceObject : AnyObject in services{
                        
                        let serviceRowData = Mapper<service>().map(serviceObject)
                        
                        print("servicename: \(serviceRowData?.name)")
                        
                        self.servicesArray.append(serviceRowData!.name! + "  " + serviceRowData!.price!)
                        
                        self.servicesDic.updateValue((serviceRowData?.id)!, forKey: serviceRowData!.name! + "  " + serviceRowData!.price!)
                    }

                    dispatch_async(dispatch_get_main_queue(), {
                        UIApplication.sharedApplication().networkActivityIndicatorVisible = false
                    })
                }
                
                if state == 1 {
                    //error info
                    let info = response.objectForKey("info")!
                    
                    let alertController = UIAlertController(title: "错误", message: "\(info)", preferredStyle: .Alert)
                    alertController.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
                    
                    self.presentViewController(alertController, animated: true, completion: nil)
                }
                
            case.Failure(let error):
                print("\(error)")
            }
        }
    }
    
    func apiReserveRequest(){
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
        
        let urlStr = SERVER_URL + CONFIRM_RESERVATION
        
        let md5SubStr = Utils.md5(self.serviceid! + self.employeeid! + self.begintime! + MD5_KEY + self.endtime! + self.mobile! + self.remark)
        
        let userDefault = NSUserDefaults.standardUserDefaults()
        
        if (userDefault.stringForKey("username") != nil) {
            self.user = userDefault.stringForKey("username")
        }
        
        let md5Str = Utils.md5(self.user! + self.subStoreID! + md5SubStr)
        
        let timeStamp = Utils.UNIX_TIMESTAMP()
        
        self.paraDict = [
            
            "user" : self.user!,
            "storeid" : self.subStoreID!,
            "serviceid" : self.serviceid!,
            "employeeid" : self.employeeid!,
            "begintime" : self.begintime!,
            "endtime" : self.endtime!,
            "mobile" : self.mobile!,
            "remark" : self.remark,
            "string" : md5Str,
            "time" : timeStamp
        ]
        
        Alamofire.request(.POST, urlStr, parameters: paraDict).responseJSON {
            (response) in switch response.result{
            case.Success(let JSON):
                
                print("parameters: ", self.paraDict)
                
                print("JSON: \(JSON)")
                
                let response = JSON as! NSDictionary
                let state = response.objectForKey("iserror")! as! Int
                let info = response.objectForKey("info") as! String
                
                if state == 0{
                    
                    let alertController = UIAlertController(title: "预约成功", message: "", preferredStyle: .Alert)
                    alertController.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
                    
                    self.presentViewController(alertController, animated: true, completion: nil)
                    
                    dispatch_async(dispatch_get_main_queue(), { 
                        UIApplication.sharedApplication().networkActivityIndicatorVisible = false
                    })
                }
                
                if state == 1{
                    
                    let alertController = UIAlertController(title: "预约成功", message: "\(info)", preferredStyle: .Alert)
                    alertController.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
                    
                    self.presentViewController(alertController, animated: true, completion: nil)
                }
                
            case.Failure(let error):
                print(error)
            }
            
        }
    }
    
     func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
     func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
     func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier(cellReusableIdentifier, forIndexPath: indexPath) as! BranchDetailReusableCell
        
        cell.configCellWithItem(indexPath, name: self.storeName! + "  " + self.subStroeName!)
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
      //1,service 2,stuff 3,begin date 4,end date

        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd hh:mm"

        switch indexPath.row {
            
        case 1:
            ActionSheetStringPicker.showPickerWithTitle("请选择服务",
                                                        rows: self.servicesArray,
                                                        initialSelection: 0,
                                                        doneBlock: {
                                                            (picker, id, value) in
                                                            print("service: \(self.servicesArray), id: \(id), value: \(value)")
                                                            
                                                            let cell = tableView.cellForRowAtIndexPath(indexPath) as! BranchDetailReusableCell
                                                            cell.detailTextLabel?.text = String(value)
                                                            
                                                            let id = self.servicesDic[String(value)]
                                                            self.serviceid = id
                                                            
                                                            print("id: \(id)")
                                                            
                                                                    },
                                                        cancelBlock: { (picker) in
                                                            print("service cancel")
                                                                    },
                                                        origin: self.view)
        case 2:
            ActionSheetStringPicker.showPickerWithTitle("请选择人员",
                                                        rows: self.stuffsArray,
                                                        initialSelection: 0,
                                                        doneBlock: {
                                                            (picker, id, value) in
                                                            
                                                            let cell = tableView.cellForRowAtIndexPath(indexPath) as! BranchDetailReusableCell
                                                            cell.detailTextLabel?.text = String(value)
                                                            
                                                            let stufid = self.stuffsDic[String(value)]
                                                            self.employeeid = stufid
                                                            
                                                            print("stufID:", stufid)
                                                                    },
                                                        cancelBlock: { (picker) in
                                                            print("stuff cancel")
                                                                    },
                                                        origin: self.view)
        case 3:
            let datePicker = ActionSheetDatePicker(title: "请选择开始时间",
                                                   datePickerMode: UIDatePickerMode.DateAndTime,
                                                   selectedDate: NSDate(),
                                                   doneBlock: {
                                                    picker, value, index in
                                                    
                                                    let cell = tableView.cellForRowAtIndexPath(indexPath) as! BranchDetailReusableCell
                                                    let beginTime = dateFormatter.stringFromDate(value as! NSDate)
                                                    
                                                    cell.detailTextLabel?.text = beginTime
                                                    
                                                    self.begintime = beginTime
                                                    },
                                                   cancelBlock: {
                                                    ActionStringCancelBlock in return
                                                    },
                                                   origin: self.view)
            
            let hourInWeek: NSTimeInterval = 7 * 24
            datePicker.minimumDate = NSDate(timeInterval: -hourInWeek, sinceDate: NSDate())
            datePicker.maximumDate = NSDate(timeInterval: hourInWeek, sinceDate: NSDate())
            datePicker.minuteInterval = 1
            
            datePicker.showActionSheetPicker()
        
        case 4:
            let datePicker = ActionSheetDatePicker(title: "请选择结束时间",
                                                   datePickerMode: UIDatePickerMode.DateAndTime,
                                                   selectedDate: NSDate(),
                                                   doneBlock: {
                                                    picker, value, index in
                                                    
                                                    let cell = tableView.cellForRowAtIndexPath(indexPath) as! BranchDetailReusableCell
                                                    let endTime = dateFormatter.stringFromDate(value as! NSDate)
                                                    
                                                    cell.detailTextLabel?.text = endTime
                                                    
                                                    self.endtime = endTime
                                                    },
                                                   cancelBlock: {
                                                    ActionStringCancelBlock in return
                                                    },
                                                   origin: self.view)
            
            datePicker.showActionSheetPicker()
            
        default:
            break
        }
    }
}
