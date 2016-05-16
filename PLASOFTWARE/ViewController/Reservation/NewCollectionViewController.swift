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

class NewCollectionViewController: UICollectionViewController {
    
    
    let reusableCellIdentifier = "NewReservationCollectionReusableCell"
    
    let searchKey = "上海"
    
    let searchCity = "上海"
    
    var paraDict : [String: String] = [:]
    
    override func viewDidLoad() {
        
        self.collectionView?.backgroundColor = UIColor(patternImage: UIImage(named: "bg-1")!)
        
        apiRequest()
        
    }
    
    func apiRequest(){
        
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
                
                //state
                let state = response.objectForKey("iserror")! as! Int

                let data = response.objectForKey("data") as! NSArray
                
                if state == 0{
                    
                    for dataObject : AnyObject in data
                    {
                        if let info = dataObject as? NSDictionary
                        {
                            let rowData = info.objectForKey("info") as! NSDictionary
                            
                            let storeModel = Mapper<StoreModel>().map(rowData)
                            
                            print("storeModel: \(storeModel?.name)")
                            
                            if let branches = storeModel?.branches{
                                for store in branches{
                                    print(store.name)
                                }
                            }
                        }
                    }
                }
                
              if state == 1 {
                
                
            //error info
                let info = response.objectForKey("info")!
                
                let alertController = UIAlertController(title: "错误", message: "\(info)", preferredStyle: .Alert)
                
                let alertDoneAction = UIAlertAction(title: "确定", style: .Default, handler: nil)
                
                alertController.addAction(alertDoneAction)
                
                self.presentViewController(alertController, animated: true, completion: nil)
                }
            
            case .Failure(let error):
                print ("\(error)")
            }
    
            
        }
        
    }
    
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reusableCellIdentifier, forIndexPath: indexPath) as! NewReservationCollectionReusableCell
        
        return cell
        
    }
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        let newBranchViewController = UIStoryboard.mainStoryboard.instantiateViewControllerWithIdentifier("newBranchViewController")
        
        self.navigationController?.pushViewController(newBranchViewController, animated: true)
    }

}

