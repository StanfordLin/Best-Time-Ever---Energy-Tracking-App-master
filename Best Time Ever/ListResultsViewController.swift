//
//  ListResultsViewController.swift
//  Best Time Ever
//
//  Created by Stanford on 2016-08-04.
//  Copyright © 2016 Stanford. All rights reserved.
//

import UIKit

class ListResultsViewController: UITableViewController {
    
    var alreadyRan: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        alreadyRan = false
        
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
        let feelsArrayNoZeroes = feels.filter() {$0 != 0}
        
        

            return feelsArrayNoZeroes.count
    }
    
    // 2
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let userDefaults = NSUserDefaults.standardUserDefaults()
        
        let feels = userDefaults.valueForKey("mood") as! [Int]
//                                                                                              let time = userDefaults.valueForKey("savedTimeDictionary") as! [String:Int]
        
        let feelsArrayNoZeroes = feels.filter() {$0 != 0}
        
        // 1
        let cell = tableView.dequeueReusableCellWithIdentifier("listResultsTableViewCell", forIndexPath: indexPath) as! ListResultsTableViewCell
        
        
        
        print("indexPath: \(indexPath.row)")
//        print("feels: \(time[""])")
        
        // 2
//        if (feels[indexPath.row] == 0) {
//            
//            cell.hidden = true
//            yourArray.removeAtIndex(indexPath.row)
//            self.tableView.reloadData()
//
//            }
//
//        } else {
            cell.storedFeelNumberLabel.text = "\(feelsArrayNoZeroes[indexPath.row])"
//                                                                                                            cell.storedFeelNumberLabel.layer.cornerRadius = 7
            cell.storedFeelNumberLabel.backgroundColor = UIColor(red: 114 / 255,
                                                                 green: 114 / 255,
                                                                 blue: 114 / 255,
                                                                 alpha: 1.0)
//        }
        
        //        cell.storedTimeLabel.layer.cornerRadius = 8 WHY DOESNT IT WORK
        
        return cell
    }
    
    
}


