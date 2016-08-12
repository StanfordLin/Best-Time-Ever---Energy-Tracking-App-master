//
//  TimeEvent.swift
//  Best Time Ever
//
//  Created by Stanford on 2016-08-08.
//  Copyright © 2016 Stanford. All rights reserved.
//

import Foundation
import UIKit

class TimeEvent : NSObject, NSCoding {
    
    let userDefaults = NSUserDefaults.standardUserDefaults()
    
    var time: Int = 0
    var feels: Int = 0
    
    var savedTimeMoodArray: [TimeEvent] = []

    init(time: Int, feels: Int) {
        self.time = time
        self.feels = (feels + 1)
        
        super.init()  // call NSObject's init method
    }
    
    
    
    required init(coder aDecoder: NSCoder) {
        
        self.time = aDecoder.decodeObjectForKey("time") as! Int
        self.feels = aDecoder.decodeObjectForKey("feels") as! Int
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(time, forKey: "time")
        aCoder.encodeObject(feels, forKey: "feels")
    }

    
    func load() -> TimeEvent {
        let moodTimeEncoded: [NSData] = userDefaults.objectForKey("savedTimeMoodArray") as! [NSData]
        
        let unpackedName: TimeEvent = NSKeyedUnarchiver.unarchiveObjectWithData(moodTimeEncoded[0] as NSData) as! TimeEvent
        
        print("the unpackedName is: \(unpackedName)")
        
        return unpackedName
        
    }
}
