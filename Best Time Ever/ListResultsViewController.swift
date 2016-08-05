//
//  ListResultsViewController.swift
//  Best Time Ever
//
//  Created by Stanford on 2016-08-04.
//  Copyright © 2016 Stanford. All rights reserved.
//

import UIKit

class ListResultsViewController: UITableViewController {
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    // 2
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // 1
        let cell = tableView.dequeueReusableCellWithIdentifier("listResultsTableViewCell", forIndexPath: indexPath) as! ListResultsTableViewCell
        
        // 2
        cell.storedFeelNumberLabel.text = "1"
        cell.storedTimeLabel.text = "11:00"
        
        return cell
    }

}


