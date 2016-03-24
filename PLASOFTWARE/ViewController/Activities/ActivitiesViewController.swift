//
//  ActivitiesViewController.swift
//  PLASOFTWARE
//
//  Created by 邓超 on 16/3/21.
//  Copyright © 2016年 Young. All rights reserved.
//

import UIKit

class ActivitiesViewController: UITableViewController {
    
    let ActivtiyCellReusableIdentifier = "ActivityCell"
    let ActivityDetailSegue = "ActivityDetailSegue"
    override func viewDidLoad() {
        setupUI()
    }
    
    func setupUI(){
        title = NSLocalizedString("ACTIVITIES", comment: "")
        
        
    }
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(ActivtiyCellReusableIdentifier, forIndexPath: indexPath) as! ActivityCell
        cell.configCellWithIndexpath(indexPath.row)
        cell.selectionStyle = .Gray
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        performSegueWithIdentifier(ActivityDetailSegue, sender: nil)
    }
}
