////
////  RealmHelper.swift
////  Best Time Ever
////
////  Created by Stanford on 2016-07-26.
////  Copyright © 2016 Stanford. All rights reserved.
////
//
//import Foundation
//import UIKit
//
//
////dynamic var times: [String] = ["00:00", "01:00", "02:00", "03:00", "04:00", "05:00", "06:00", "07:00", "08:00", "09:00", "10:00", "11:00", "12:00", "13:00", "14:00", "15:00", "16:00", "17:00", "18:00", "19:00", "20:00", "21:00", "22:00", "23:00"]
////dynamic var feels: [Double] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
//
//
//
//class UserDefaultsHelper {
//    
//    static func saveTime() {
//    
//        // create objects
//        let storedTimes = ["00:00", "01:00", "02:00", "03:00", "04:00", "05:00", "06:00", "07:00", "08:00", "09:00", "10:00", "11:00", "12:00", "13:00", "14:00", "15:00", "16:00", "17:00", "18:00", "19:00", "20:00", "21:00", "22:00", "23:00"]
//        let userDefault = NSUserDefaults.standardUserDefaults()
//        
//        // save data
//        userDefault.setObject(storedTimes, forKey: "times")
//        userDefault.synchronize()
//        
//        // retrieve data
//        let retrievedTimes = userDefault.valueForKey("times") as! [String]
//        print(retrievedTimes)
//        
//    }
//    
//    
//    static func getTimes() -> [String] {
//        let userDefault = NSUserDefaults.standardUserDefaults()
//        // retrieve data
//        let retrievedTimes = userDefault.valueForKey("times") as! [String]
//        // print(retrievedTimes)
//        return retrievedTimes
//    }
//
//    
//}
//
//
//
//
//    
////    
////    //deletes Note in realm's default
////    static func deleteResults(note: Note) {
////        let realm = try! Realm()
////        try! realm.write() {
////            realm.delete(note)
////        }
////    }
////    
////    //updates the note's contents with contents of newNote and it also updates realm's default
////    static func updateResults(noteToBeUpdated: Note, newNote: Note) {
////        let realm = try! Realm()
////        try! realm.write() {
////            noteToBeUpdated.title = newNote.title
////            noteToBeUpdated.content = newNote.content
////            noteToBeUpdated.modificationTime = newNote.modificationTime
////        }
////        
////    }
////    
////    //method that retrieves all the notes from default Realm, returns a Note object and sorts modificationTime in descending order
////    static func retrieveResults() -> Results<Note> {
////        let realm = try! Realm()
////        
////        return realm.objects(Note).sorted("modificationTime", ascending: false)
////        
////    }
