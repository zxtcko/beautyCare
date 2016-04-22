//
//  NewCollectionViewController.swift
//  PLASOFTWARE
//
//  Created by Chris on 16/4/22.
//  Copyright © 2016年 Young. All rights reserved.
//

import UIKit

class NewCollectionViewController: UICollectionViewController {
    
    
    let reusableCellIdentifier = "NewReservationCollectionReusableCell"
    
    override func viewDidLoad() {
        
        self.collectionView?.backgroundColor = UIColor(patternImage: UIImage(named: "bg-1")!)
        
        
        
    }
    
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reusableCellIdentifier, forIndexPath: indexPath) as! NewReservationCollectionReusableCell
        
        return cell
        
    }
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        let newBranchViewController = UIStoryboard.mainStoryboard.instantiateViewControllerWithIdentifier("newBranchViewController")
        
        self.navigationController?.pushViewController(newBranchViewController, animated: true)
    }

}
