//
//  ReservationViewController.swift
//  PLASOFTWARE
//
//  Created by 邓超 on 16/3/21.
//  Copyright © 2016年 Young. All rights reserved.
//

import UIKit

class ReservationViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var reserveTableView: UITableView!
    
    
    let reserveCellReuseIdentifier = "ReservationCell"
    
    let newReservationSegue = "NewReservation"
    let confimingReservationSegue = "ConfirmingReservation"
    let reservedSegue = "ReservedReservation"
    
    override func viewDidLoad() {
//        super.viewDidLoad()
        title = NSLocalizedString("RESERVATION", comment: "")
        
        reserveTableView.delegate = self
        reserveTableView.dataSource = self
        
        
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(reserveCellReuseIdentifier, forIndexPath: indexPath) as! ReservationCellView
        
        cell.configureWithReserve(indexPath.row)
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        switch indexPath.row{
        case 0:
            performSegueWithIdentifier(newReservationSegue, sender: nil)
        case 1:
            performSegueWithIdentifier(confimingReservationSegue, sender: nil)
        case 2:
            performSegueWithIdentifier(reservedSegue, sender: nil)
        default: break
        }
        
    }
}
