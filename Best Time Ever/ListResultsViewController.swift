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
    var feels: [Int] = []
    var savedTimeMoodArray: [TimeEvent] = []
    var savedTimeMood: TimeEvent?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        //        let userDefaults = NSUserDefaults.standardUserDefaults()
        //        if let timeEvent = userDefaults.objectForKey("timeEvent") as? NSData {
        //            savedTimeMood = NSKeyedUnarchiver.unarchiveObjectWithData(timeEvent) as? TimeEvent
        //            savedTimeMoodArray.append(savedTimeMood!)
        //        }
        
        
        let archivedTimeMoodData = NSUserDefaults.standardUserDefaults().objectForKey("savedTimeMoodArray") as? NSData
        
        if archivedTimeMoodData != nil {
            savedTimeMoodArray = (NSKeyedUnarchiver.unarchiveObjectWithData(archivedTimeMoodData!) as? [TimeEvent])!
            
            //                if var savedTimeMoodArray = savedTimeMoodArray {
            print("savedTimeMoodArray: \(savedTimeMoodArray)")
        } else {
            print("SODNFPOISJDFPOIJSDFOPSJDIOF NOHTINGGGGGG")
        }
        
//        print("Saved time array:    \(savedTimeMoodArray) savedTimeMoodArray.count \(savedTimeMoodArray.count), savedTimeFeels: \(savedTimeMoodArray.last!.feels), savedTime: \(savedTimeMoodArray.last!.time)")
    }
    
    
    
    override func didReceiveMemoryWarning() {
        didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
//        print("savedTimeArray: \(savedTimeMoodArray.last?.time)")
        return savedTimeMoodArray.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("listResultsTableViewCell", forIndexPath: indexPath) as! ListResultsTableViewCell
        
        
        
        print("indexPath: \(indexPath.row)")
        
        
        let timeEvent = savedTimeMoodArray[indexPath.row]
        
        cell.storedFeelNumberLabel.text = ")"
        cell.storedTimeLabel.text = ":00"
        

        
        print("Saved time array:    \(savedTimeMoodArray) savedTimeMoodArray.count \(savedTimeMoodArray.count), savedTimeFeels: \(savedTimeMoodArray.last!.feels), savedTime: \(savedTimeMoodArray.last!.time)")
        
        return cell
        
        
    }
}

