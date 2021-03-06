//
//  NewBranchViewController.swift
//  PLASOFTWARE
//
//  Created by Chris on 16/4/22.
//  Copyright © 2016年 Young. All rights reserved.
//

import UIKit

class NewBranchViewController: UITableViewController {
    
    internal var storeModel:StoreModel? = nil
    
    override func viewDidLoad() {
        
        setupUI()
        
    }

    func setupUI(){
        
        title = "NEW"
        
        let imageView = UIImageView(frame: self.view.frame)
        imageView.image = UIImage(named: "背景2")
        
        self.view.insertSubview(imageView, atIndex: 0)
        
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (storeModel?.branches?.count)!
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("ConfirmingCell", forIndexPath: indexPath) as! ConfirmingReservationCell
        
        cell.configCellWithNewBranchItem(storeModel!, indexPath: indexPath)
        
        return cell
        
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let branchDetailViewController = UIStoryboard.mainStoryboard.instantiateViewControllerWithIdentifier("branchDetailViewController") as! BranchDetailTableViewController
        
        let storeid = storeModel?.branches![indexPath.row].id
        
        branchDetailViewController.storeID = storeModel?.id
        branchDetailViewController.subStoreID = storeid
        branchDetailViewController.storeName = storeModel?.name
        branchDetailViewController.subStroeName = storeModel?.branches![indexPath.row].name
        
        self.navigationController?.pushViewController(branchDetailViewController, animated: true)
        
        
    }
}
