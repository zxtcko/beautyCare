//
//  RefusedDetailTableViewController.swift
//  PLASOFTWARE
//
//  Created by Chris on 16/4/25.
//  Copyright © 2016年 Young. All rights reserved.
//

import UIKit

class RefusedDetailTableViewController: UITableViewController {
    
    
    let cancelReservationSegue = "CancelReservationSegue"
    
    let cellReusableIdentifier = "RefusedDetailCell"
    
    var headerImageView:UIImageView!
    
    override func viewDidLoad() {
        setupUI()
    }
    
    func setupUI(){
        title = NSLocalizedString("DETAILS", comment: "")
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0{
            return 7
        }
        
        return 1
        
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier(cellReusableIdentifier, forIndexPath: indexPath)
        
        let imageView = UIImageView(frame: CGRectMake(0, cell.contentView.frame.size.height - 2, cell.contentView.frame.size.width, 2))
        imageView.image = UIImage(named: "矩形-3-拷贝-5")
        
        cell.contentView.addSubview(imageView)
        
        
        if indexPath.section == 0{
            switch indexPath.row{
            case 0:
                cell.textLabel?.text = NSLocalizedString("BRANCH", comment: "")
                cell.detailTextLabel?.text = NSLocalizedString("Hanoi", comment: "")
            case 1:
                cell.textLabel?.text = NSLocalizedString("ITEMS", comment: "")
                cell.detailTextLabel?.text = NSLocalizedString("The Neck Care", comment: "")
            case 2:
                cell.textLabel?.text = NSLocalizedString("BEAUTICIAN", comment: "")
                cell.detailTextLabel?.text = NSLocalizedString("MeiLi Wang", comment: "")
            case 3:
                cell.textLabel?.text = NSLocalizedString("TIME", comment: "")
                cell.detailTextLabel?.text = NSLocalizedString("", comment: "")
            case 4:
                cell.textLabel?.text = NSLocalizedString("PHONE", comment: "")
                cell.detailTextLabel?.text = NSLocalizedString("159366888585", comment: "")
            case 5:
                cell.textLabel?.text = NSLocalizedString("Note", comment: "")
                cell.detailTextLabel?.text = NSLocalizedString("", comment: "")
            case 6:
                cell.textLabel?.text = NSLocalizedString("ADDRESS", comment: "")
                cell.detailTextLabel?.text = NSLocalizedString("Room 505 Qinzhou Building", comment: "")
            default: break
            }
        }
        
        if indexPath.section == 1{
            cell.textLabel?.text = NSLocalizedString("REJECTION REASON", comment: "")
            cell.detailTextLabel?.text = NSLocalizedString("Schedule is full", comment: "")
        }
        
        
        return cell
    }
    
    override func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section == 0{
            return 15.0
        }
        
        return 0.0
    }
}
