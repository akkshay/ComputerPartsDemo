//
//  ViewController.swift
//  ComputerPartsDemo
//
//  Created by Akkshay Khoslaa on 1/11/16.
//  Copyright © 2016 Akkshay Khoslaa. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    //This is the referencing outlet to the collectionview in our viewcontroller
    @IBOutlet weak var collectionView: UICollectionView!
    
    //This is the array with all the computer part names
    var computerParts = ["Processor", "RAM", "Hard Drive", "Screen", "Keyboard", "Mouse"]
    
    //This is the array with the names of all the images that are in our assets.xcassets. They correspond by index to their respective computer part name from their computerParts array.
    var computerPartImageNames = ["processor", "computer", "harddrive", "screen", "keyboard", "mouse"]
    
    var selectedIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //We are setting the color of the navigation bar
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 0, green: 0.725, blue: 1, alpha: 1)
        
        //We are setting the text color of the navigation bar to white
        let titleDict: NSDictionary = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        self.navigationController!.navigationBar.titleTextAttributes = titleDict as! [String : AnyObject]
        
        //We are setting the background color of the collectionView
        collectionView.backgroundColor = UIColor(red: 0.93, green: 0.93, blue: 0.93, alpha: 1)
        
        //We are setting the delegate and datasource of our collectionview to self because we have now made this viewcontroller class a compliant of UICollectionViewDelegate and UICollectionViewDataSource (see above)
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //We are using this delegate method to set the number of sections in our collectionview
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    //We are using this delegate method to set the number of rows in our collectionview (per section)
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return computerParts.count
    }
    
    
    //We are using this delegate method to create the cell and put it into our collectionview
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        
        //We are dequeueing the cell from the collectionview to set its properties (we will later put it back into the collectionview)
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("partCell", forIndexPath: indexPath) as! ComputerPartCollectionViewCell
        
        //We are setting the image of the partImageView in the cell to the corresponding image using the computerPartImageNames array
        cell.partImageView.image = UIImage(named: computerPartImageNames[indexPath.row])
        
        //We are making sure this image does not appear stretched
        cell.partImageView.contentMode = .ScaleAspectFill
        
        //We are adding a black image ontop of our partImageView and making it translucent
        cell.blackImageView.image = UIImage(named: "black")
        cell.blackImageView.alpha = 0.5
        
        //We are setting the text of the partNameLabel of the cell to the corresponding part name from the computerParts array
        cell.partNameLabel.text = computerParts[indexPath.row]
    
        
        return cell
        
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        selectedIndex = indexPath.row
        self.performSegueWithIdentifier("toSellers", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "toSellers" {
            let destVC = segue.destinationViewController as! SellersViewController
            destVC.computerPart = computerParts[selectedIndex]
        }
    }
    
    


}

