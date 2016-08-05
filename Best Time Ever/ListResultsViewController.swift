//
//  ListResultsViewController.swift
//  Best Time Ever
//
//  Created by Stanford on 2016-08-04.
//  Copyright © 2016 Stanford. All rights reserved.
//

import UIKit

class ListResultsViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let userDefaults = NSUserDefaults.standardUserDefaults()
        
        let feels = userDefaults.valueForKey("mood") as! [Int]
        
        print(feels)

        for i in 0..<feels.count {
            
            if feels[i] > 0 {
                print("feels[noZeroes]: \(feels[i]), feeeeeeels: \(feels)")
            }
        }
        
        return feels.count
    }
    
    // 2
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let userDefaults = NSUserDefaults.standardUserDefaults()
        
        let feels = userDefaults.valueForKey("mood") as! [Int]
        let time = ["00:00", "01:00", "02:00", "03:00", "04:00", "05:00", "06:00", "07:00", "08:00", "09:00", "10:00", "11:00", "12:00", "13:00", "14:00", "15:00", "16:00", "17:00", "18:00", "19:00", "20:00", "21:00", "22:00", "23:00"]
        
        
        // 1
        let cell = tableView.dequeueReusableCellWithIdentifier("listResultsTableViewCell", forIndexPath: indexPath) as! ListResultsTableViewCell
        
        // 2
        
        cell.storedFeelNumberLabel.text = "\(feels[indexPath.row])"
        cell.storedTimeLabel?.text = "\(time[indexPath.row])"
        
        //        cell.storedTimeLabel.layer.cornerRadius = 8 WHY DOESNT IT WORK
        
        return cell
    }
    
    
    
}


