//
//  NewBranchViewController.swift
//  PLASOFTWARE
//
//  Created by Chris on 16/4/22.
//  Copyright © 2016年 Young. All rights reserved.
//

import UIKit

class NewBranchViewController: UITableViewController {
    
    override func viewDidLoad() {
        
        setupUI()
        
    }

    func setupUI(){
        
        title = "NEW"
        
        self.tableView.backgroundColor = UIColor(patternImage: UIImage(named: "背景2")!)
        
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("NewReservationCell", forIndexPath: indexPath) as! NewReservationReusableCell
        
        cell.configCellWithItem()
        
        
        return cell
        
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let branchDetailViewController = UIStoryboard.mainStoryboard.instantiateViewControllerWithIdentifier("branchDetailViewController")
        
        self.navigationController?.pushViewController(branchDetailViewController, animated: true)
        
        
    }
}
