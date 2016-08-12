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
    var unpackedName: TimeEvent?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let archivedTimeMoodData = NSUserDefaults.standardUserDefaults().objectForKey("savedTimeMoodArray") as? NSData
        
        if let archivedTimeMoodData = archivedTimeMoodData {
            savedTimeMoodArray = (NSKeyedUnarchiver.unarchiveObjectWithData(archivedTimeMoodData) as? [TimeEvent])!
            
            if unpackedName == unpackedName {
                savedTimeMood = unpackedName
            } else {
                print("hahh gay, it's nil")
            }
            
        }
        
        
    }
    override func didReceiveMemoryWarning() {
        didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        print("savedTimeArray: \(savedTimeMoodArray.last?.time)")
        return savedTimeMoodArray.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("listResultsTableViewCell", forIndexPath: indexPath) as! ListResultsTableViewCell
        
        let timeEvent = savedTimeMoodArray[indexPath.row]
        
        cell.storedFeelNumberLabel.text = "\(timeEvent.feels)"
        cell.storedTimeLabel.text = "\(timeEvent.time):00"

        NSUserDefaults().synchronize()
        return cell
        
        
    }
}

