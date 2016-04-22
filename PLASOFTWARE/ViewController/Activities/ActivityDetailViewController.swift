//
//  ActivityDetailViewController.swift
//  PLASOFTWARE
//
//  Created by 邓超 on 16/3/22.
//  Copyright © 2016年 Young. All rights reserved.
//

import UIKit

class ActivityDetailViewController: UITableViewController {
    
    let ActivityDetailReusableIdentifier = "ActivityDetailCell"
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
        let cell = tableView.dequeueReusableCellWithIdentifier(ActivityDetailReusableIdentifier, forIndexPath: indexPath)
        
        let imageView = UIImageView(frame: CGRectMake(0, cell.contentView.frame.size.height - 2, cell.contentView.frame.size.width, 2))
        imageView.image = UIImage(named: "矩形-3-拷贝-5")
        cell.contentView.addSubview(imageView)
        
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
        default:break
        }
        
        return cell
    }
}
