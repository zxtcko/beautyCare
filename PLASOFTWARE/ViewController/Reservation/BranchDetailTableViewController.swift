//
//  BranchDetailTableViewController.swift
//  PLASOFTWARE
//
//  Created by Chris on 16/4/22.
//  Copyright © 2016年 Young. All rights reserved.
//

import UIKit

class BranchDetailTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    let cellReusableIdentifier = "DetailCell"
    
    @IBOutlet weak var BranchDetailTableView: UITableView!
    
    override func viewDidLoad() {
        
        
        
    }
    
    func setupUI(){
        
    }
    
     func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
     func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
     func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier(cellReusableIdentifier, forIndexPath: indexPath)
        
        let imageView = UIImageView(frame: CGRectMake(0, cell.contentView.frame.size.height - 2, cell.contentView.frame.size.width, 2))
        imageView.image = UIImage(named: "矩形-3-拷贝-5")
        cell.contentView.addSubview(imageView)
        
        switch indexPath.row{
        case 0:
            break
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
            cell.textLabel?.text = NSLocalizedString("NOTE", comment: "")
        default: break
        }
        
        return cell
    }
}
