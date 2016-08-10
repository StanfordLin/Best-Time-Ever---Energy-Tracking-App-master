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
    var feelsArrayNoZeroes: [Int] = []
    var feels: [Int] = []
    var savedTimeArray: [TimeEvent] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let userDefaults = NSUserDefaults.standardUserDefaults()
        
        feels = userDefaults.valueForKey("mood") as! [Int]
        
        feelsArrayNoZeroes = feels.filter() {$0 != 0}
        
        if let savedPeople = userDefaults.objectForKey("timeEvent") as? NSData {
        savedTimeArray = NSKeyedUnarchiver.unarchiveObjectWithData(savedPeople) as! [TimeEvent]
        }


        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        print("savedTimeArray: \(savedTimeArray.last?.time)")
        return savedTimeArray.count
    }
    
    // 2
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        // 1
        let cell = tableView.dequeueReusableCellWithIdentifier("listResultsTableViewCell", forIndexPath: indexPath) as! ListResultsTableViewCell
        
        
        
        print("indexPath: \(indexPath.row)")
        
        
        let timeEvent = self.savedTimeArray[indexPath.row]
        cell.storedFeelNumberLabel.text = "\(timeEvent.mood + 1)"
              cell.storedTimeLabel.text = "\(timeEvent.time):00"

            cell.storedFeelNumberLabel.backgroundColor = UIColor(red: 114 / 255,
                                                                 green: 114 / 255,
                                                                 blue: 114 / 255,
                                                                 alpha: 1.0)
        
        
        
//        }
        
        //        cell.storedTimeLabel.layer.cornerRadius = 8 WHY DOESNT IT WORK
        
        return cell
    }
    
    
}


