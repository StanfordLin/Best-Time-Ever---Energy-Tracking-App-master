//
//  DataManager.swift
//  Best Time Ever
//
//  Created by Stanford on 2016-07-28.
//  Copyright © 2016 Stanford. All rights reserved.
//

import Foundation

class DataManager {
    
    static let sharedInstance = DataManager()
    
    let userdefaults = NSUserDefaults.standardUserDefaults()
    
    var array = [String]()
    
    init() {
        loadData()
    }
    
    func addNewTime(time: String) {
        array.append(time)
        saveDefaults()
    }
    
    func getData() -> [String] {
        return array
    }
    
    func loadData() {
        array = userdefaults.valueForKey("times") as! [String]
    }
    
    
    func saveDefaults() {
        userdefaults.setObject(array, forKey: "times")
        userdefaults.synchronize()
    }
    
    
    
}