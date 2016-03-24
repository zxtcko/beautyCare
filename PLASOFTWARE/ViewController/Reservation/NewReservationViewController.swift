//
//  NewReservationViewController.swift
//  PLASOFTWARE
//
//  Created by 邓超 on 16/3/22.
//  Copyright © 2016年 Young. All rights reserved.
//

import UIKit

class NewReservationViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var confirmButton: UIButton!
    
    @IBOutlet weak var newReservationTableView: UITableView!
    
    let cellReusableIdentifier = "NewReservationCell"
    
    override func viewDidLoad() {
        
        setupUI()
        
    }
    
    func setupUI(){
        title = NSLocalizedString("NEW", comment: "")
        confirmButton.setTitle(NSLocalizedString("CONFIRM", comment: ""), forState: .Normal)
        
        newReservationTableView.separatorColor = UIColor(patternImage: UIImage(imageLiteral: "矩形-3-拷贝-5"))
        
        newReservationTableView.delegate = self
        newReservationTableView.dataSource = self
    }

    
    //MARK: TableView Delegate
    func setCellColor(color:UIColor, cell:UITableViewCell){
        cell.contentView.backgroundColor = color
        cell.backgroundColor = color
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier(cellReusableIdentifier, forIndexPath: indexPath)
        
        let backgroundView = UIView(frame: cell.frame)
        backgroundView.backgroundColor = UIColor.plaAquaColor()
        cell.selectedBackgroundView = backgroundView
        
        let imageView = UIImageView(frame: CGRectMake(0, cell.contentView.frame.size.height - 2, cell.contentView.frame.size.width, 2))
        imageView.image = UIImage(named: "矩形-3-拷贝-5")
        cell.contentView.addSubview(imageView)
        
        let gradient = CAGradientLayer()
        gradient.frame = cell.bounds
        let colors: [AnyObject] = [UIColor(red: 55/255, green: 68/255, blue: 100/255, alpha: 1.0).CGColor, UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.4)]
        gradient.colors = colors
        gradient.startPoint = CGPointMake(0.0, 0.5)
        gradient.endPoint = CGPointMake(1.0, 0.5)
//        cell.layer.addSublayer(gradient)
        cell.layer.insertSublayer(gradient, atIndex: 0)
        
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
        default: break
        }

        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("row: \(indexPath.row)")
    }
}
