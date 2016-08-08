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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let userDefaults = NSUserDefaults.standardUserDefaults()
        
        feels = userDefaults.valueForKey("mood") as! [Int]
        
        feelsArrayNoZeroes = feels.filter() {$0 != 0}
        
//        Filter a dictionary
        //        let savedFeels = userDefaults.valueForKey("savedTimeDictionary") as! [String: Int]
        //        self.feelsArrayNoZeroes = savedFeels.filter() {$0 != 0}
        
        
        
        
//        self.feelsArrayNoZeroes = feels.filter() {$0 != 0}
//                for num in feels {
//        
//        
//                    let timeEvent = TimeEvent()
//                    timeEvent.time = time
//                    timeEvent.mood = feelsArrayNoZeroes
//        
//                    self.chartData.append(timeEvent)
//        
//                    x += 1
        
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
        
        
        let feelsArrayNoZeroes = feels.filter() {$0 != 0}
        

            return feelsArrayNoZeroes.count
    }
    
    // 2
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
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
//                                                                                                            cell.storedFeelNumberLabel.layer.cornerRadius = 7
            cell.storedFeelNumberLabel.text = "\(feelsArrayNoZeroes[indexPath.row])"
            cell.storedFeelNumberLabel.backgroundColor = UIColor(red: 114 / 255,
                                                                 green: 114 / 255,
                                                                 blue: 114 / 255,
                                                                 alpha: 1.0)
//        }
        
        //        cell.storedTimeLabel.layer.cornerRadius = 8 WHY DOESNT IT WORK
        
        return cell
    }
    
    
}


