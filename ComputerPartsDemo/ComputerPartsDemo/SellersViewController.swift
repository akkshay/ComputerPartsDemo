//
//  SellersViewController.swift
//  ComputerPartsDemo
//
//  Created by Akkshay Khoslaa on 1/12/16.
//  Copyright © 2016 Akkshay Khoslaa. All rights reserved.
//

import UIKit

class SellersViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var computerPart = ""
    var processorCompanies = ["Intel", "AMD"]
    var ramCompanies = ["Kingston", "Corsair"]
    var hardDriveCompanies = ["Seagate", "Toshiba", "WD"]
    var screenCompanies = ["Dell", "Acer", "Asus"]
    var keyboardCompanies = ["Logitech", "Apple", "Dell", "Microsoft"]
    var mouseCompanies = ["Logitech", "Apple", "Dell"]
    var selectedArr = Array<String>()
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "sellersCell")
        
        if computerPart == "Processor" {
            selectedArr = processorCompanies
        } else if computerPart == "RAM" {
            selectedArr = ramCompanies
        } else if computerPart == "Hard Drive" {
            selectedArr = hardDriveCompanies
        } else if computerPart == "Screen" {
            selectedArr = screenCompanies
        } else if computerPart == "Keyboard" {
            selectedArr = keyboardCompanies
        } else if computerPart == "Mouse" {
            selectedArr = mouseCompanies
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selectedArr.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("sellersCell", forIndexPath: indexPath)
        
        cell.textLabel?.text = selectedArr[indexPath.row]
        
        return cell
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    Marikimoo
    */

}
