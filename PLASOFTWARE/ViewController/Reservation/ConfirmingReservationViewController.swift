//
//  ConfirmingReservationViewController.swift
//  PLASOFTWARE
//
//  Created by 邓超 on 16/3/22.
//  Copyright © 2016年 Young. All rights reserved.
//

import UIKit

class ConfirmingReservationViewController: UITableViewController {
    
    let ConfirmingCellReusableIdentifier = "ConfirmingCell"
    let DetailReservationSegue = "ConfirmReservationDetailSegue"
    
    override func viewDidLoad() {
        setupUI()
    }
    
    func setupUI(){
        title = NSLocalizedString("TO BE CONFIRMED", comment: "")

        let imageView = UIImageView(frame: self.view.frame)
        imageView.image = UIImage(named: "背景2")
        
        self.view.insertSubview(imageView, atIndex: 0)
    
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier(ConfirmingCellReusableIdentifier, forIndexPath: indexPath) as! ConfirmingReservationCell
        
        cell.configCellWithItem()
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        performSegueWithIdentifier(DetailReservationSegue, sender: nil)
    }
}
