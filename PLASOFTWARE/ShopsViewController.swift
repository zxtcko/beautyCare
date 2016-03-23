//
//  ShopsViewController.swift
//  PLASOFTWARE
//
//  Created by 邓超 on 16/3/21.
//  Copyright © 2016年 Young. All rights reserved.
//

import UIKit

class ShopsViewController: UIViewController, UIPopoverPresentationControllerDelegate, UITableViewDelegate, UITableViewDataSource, ShopPopoverMenuDelegate {
    
    @IBOutlet weak var branchShowButton: UIButton!
    @IBOutlet weak var branchSelectButton: UIButton!
    @IBOutlet weak var categoryShowButton: UIButton!
    @IBOutlet weak var categorySelectButton: UIButton!
    @IBOutlet weak var shopTableView: UITableView!
    
    let productCellReusableIdentifier = "ProductCell"
    let productInfoSegue = "ProductInfoSegue"

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI(){
        title = NSLocalizedString("SHOPS", comment: "")
        
        shopTableView.delegate = self
        shopTableView.dataSource = self
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "branchPopover"
        {
            let shopPopoverVC = segue.destinationViewController as! ShopPopoverMenu
            shopPopoverVC.modalPresentationStyle = UIModalPresentationStyle.Popover
            shopPopoverVC.popoverPresentationController!.delegate = self
            shopPopoverVC.popoverPresentationController?.sourceView = sender as! UIButton
            shopPopoverVC.popoverPresentationController?.sourceRect = (sender as! UIButton).bounds
            shopPopoverVC.delegate = self
        }
    }
   
    //MARK: ShopPopoverMenuDelegate
    func popoverButtonDidSelected(button: UIButton) {
        
        branchSelectButton.setTitle(button.titleLabel?.text, forState: .Normal)
        branchShowButton.setTitle(button.titleLabel?.text, forState: .Normal)
    
    }
    
    //MARK: PopoverPresentationControllerDelegate
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle {
        return .None
    }
    
    //MARK: UITableView Delegate
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(productCellReusableIdentifier, forIndexPath: indexPath) as! ShopProductCell
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        performSegueWithIdentifier(productInfoSegue, sender: nil)
    }
}
