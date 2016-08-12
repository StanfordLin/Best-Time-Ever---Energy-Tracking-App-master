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
    func save() {
        let encodedTimeMoodData = NSKeyedArchiver.archivedDataWithRootObject(savedTimeMoodArray)
        userDefaults.setObject(encodedTimeMoodData, forKey: "savedTimeMoodArray")
        userDefaults.synchronize()
        
//        NSUserDefaults.standardUserDefaults().setObject(archivedTimeMoodData, forKey: "savedTimeMoodArray")
//        let savedTimeMoodArray = NSKeyedArchiver.archivedDataWithRootObject(self)
//        let defaults = NSUserDefaults.standardUserDefaults()
//        defaults.setObject(savedTimeMoodArray, forKey: "savedTimeMoodArray")
//        defaults.synchronize()
        
    }
    
    func load() -> TimeEvent {
        let moodTimeEncoded: [NSData] = userDefaults.objectForKey("savedTimeMoodArray") as! [NSData]
        
        let unpackedName: TimeEvent = NSKeyedUnarchiver.unarchiveObjectWithData(moodTimeEncoded[0] as NSData) as! TimeEvent
        
        print("the unpackedName is: \(unpackedName)")
        
        return unpackedName
        
    }
}

//            let archivedTimeMoodData = NSUserDefaults.standardUserDefaults().objectForKey("savedTimeMoodArray") as? NSData
//            
//            if let archivedTimeMoodData = archivedTimeMoodData {
//                savedTimeMoodArray = (NSKeyedUnarchiver.unarchiveObjectWithData(archivedTimeMoodData) as? [TimeEvent])!
//                
////                if var savedTimeMoodArray = savedTimeMoodArray {
//                    print("savedTimeMoodArray: \(savedTimeMoodArray)")
//            } else {
//                print("SODNFPOISJDFPOIJSDFOPSJDIOF NOHTINGGGGGG")
//        }
//        
//            }
//    }

    
    
//    func encodeWithCoder(aCoder: NSCoder) {
//        aCoder.encodeObject(time, forKey: "timeEventTime")
//        aCoder.encodeObject(mood, forKey: "timeEventMood")
//    }
//    
//    
//    required convenience init?(coder aDecoder: NSCoder) {
//        // decoding could fail, for example when no timeEventTime or timeEventMood was saved before calling decode
//        guard let unarchivedTimeEventTime = aDecoder.decodeObjectForKey("timeEventTime") as? Int
//            else {
//                // option 1 : return an default Blog
//                self.init(time: "unnamed")
//                return
//                
//                // option 2 : return nil, and handle the error at higher level
//        }
//        
//        // convenience init must call the designated init
//        self.init(time: unarchivedTimeEventTime)
//    }

    
    

