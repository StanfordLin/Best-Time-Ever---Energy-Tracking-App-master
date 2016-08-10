//
//  TimeEvent.swift
//  Best Time Ever
//
//  Created by Stanford on 2016-08-08.
//  Copyright © 2016 Stanford. All rights reserved.
//

import Foundation

class TimeEvent : NSObject, NSCoding {
    
    var time: Int = 0
    var mood: Int = 0
    
    init(time: Int, mood: Int) {
        self.time = time
        self.mood = mood
        
        super.init()  // call NSObject's init method
    }
    
//    func description() -> String  {
//        return "Time: \(time) Mood: \(mood)"
//    }
    
    
    required init(coder aDecoder: NSCoder) {
        time = aDecoder.decodeObjectForKey("timeEventTime") as! Int
        mood = aDecoder.decodeObjectForKey("timeEventMood") as! Int
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(time, forKey: "timeEventTime")
        aCoder.encodeObject(mood, forKey: "timeEventMood")
    }
    
    func save() {
        let savedData = NSKeyedArchiver.archivedDataWithRootObject(TimeEvent)
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setObject(savedData, forKey: "timeEvent")
    }
    
    
    
    
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

    
    

}