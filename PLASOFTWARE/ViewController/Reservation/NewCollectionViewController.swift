//
//  NewCollectionViewController.swift
//  PLASOFTWARE
//
//  Created by Chris on 16/4/22.
//  Copyright © 2016年 Young. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper

class NewCollectionViewController: UICollectionViewController, UITextFieldDelegate {
    
    @IBOutlet weak var searchTextField: UITextField!
    
    let reusableCellIdentifier = "NewReservationCollectionReusableCell"
    
    var searchKey = "上海"
    
    var searchCity = "上海"
    
    var paraDict : [String: String] = [:]
    
    var storeArray = [StoreModel]()
    
    override func viewDidLoad() {
        
        setupUI()
        
        apiRequest()
        
    }
    
    func setupUI(){
        
        self.view.backgroundColor = UIColor.clearColor()
        
        self.collectionView?.backgroundColor = UIColor(patternImage: UIImage(named: "bg-1")!)
        
        searchTextField.delegate = self
    }
    
    func apiRequest(){
        
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
        
        let urlStr = SERVER_URL + STORE_ALL
        
        let timeStamp = Utils.UNIX_TIMESTAMP()
        
        let md5Sub = Utils.md5("org_name" + MD5_KEY + searchKey)
        
        let md5Str = Utils.md5(searchCity + md5Sub)
        
        self.paraDict = [
            "skey":searchKey,
            "city":searchCity,
            "string":md5Str,
            "time":timeStamp
        ]
        
        Alamofire.request(.POST, urlStr, parameters: paraDict).responseJSON {
            response in switch response.result
            {
            case .Success(let JSON):
                
                let response = JSON as! NSDictionary
                
//                print("paraDict: \(self.paraDict)")
//                
//                print("Succeed JSON: \(JSON)")
                
                //state
                let state = response.objectForKey("iserror")! as! Int
                
                if state == 0{
                    
                    let data = response.objectForKey("data") as! NSArray
                    
                    self.storeArray.removeAll()
                    
                    for dataObject : AnyObject in data
                    {
                        if let info = dataObject as? NSDictionary
                        {
                            let rowData = info.objectForKey("info") as! NSDictionary
                            
                            let storeModel = Mapper<StoreModel>().map(rowData)
                            
                            print("storeModel: \(storeModel?.name)")
                            
                            self.storeArray.append(storeModel!)
                            
                            if let branches = storeModel?.branches{
                                for store in branches{
                                    print(store.name)
                                }
                            }
                        }
                    }
                    
                    if self.storeArray.count == 0{
                        
                        let alertController = UIAlertController(title: "没有结果", message: nil, preferredStyle: .Alert)
                        
                        let alertDoneAction = UIAlertAction(title: "确定", style: .Default, handler: nil)
                        
                        alertController.addAction(alertDoneAction)
                        
                        self.presentViewController(alertController, animated: true, completion: nil)
                    }
                    
                    dispatch_async(dispatch_get_main_queue(), {
                        
                        UIApplication.sharedApplication().networkActivityIndicatorVisible = false
                
                        self.collectionView?.reloadData()
                    })
                    
                    
                }
                
              if state == 1 {
                
                
                //error info
                let info = response.objectForKey("info")!
                
                let alertController = UIAlertController(title: "错误", message: "\(info)", preferredStyle: .Alert)
                
                let alertDoneAction = UIAlertAction(title: "确定", style: .Default, handler: nil)
                
                alertController.addAction(alertDoneAction)
                
                self.presentViewController(alertController, animated: true, completion: nil)
                
                
                UIApplication.sharedApplication().networkActivityIndicatorVisible = false

                self.storeArray.removeAll()

                self.collectionView?.reloadData()

                }


                
            case .Failure(let error):
                print ("\(error)")
            }
    
            
        }
        
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        searchTextField.resignFirstResponder()
        
        searchKey = textField.text!
        
        apiRequest()
        
        return true
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        
        searchKey = textField.text!
        
        apiRequest()
    }
    
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return storeArray.count
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reusableCellIdentifier, forIndexPath: indexPath) as! NewReservationCollectionReusableCell
        
        let store = storeArray[indexPath.row]
        
        cell.cellLabel.text = store.name
        
        return cell
        
    }
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        let newBranchViewController = UIStoryboard.mainStoryboard.instantiateViewControllerWithIdentifier("newBranchViewController") as! NewBranchViewController
        
        let store = storeArray[indexPath.row]
        
        newBranchViewController.storeModel = store
        
        self.navigationController?.pushViewController(newBranchViewController, animated: true)
    }

}

