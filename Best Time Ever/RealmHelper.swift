//
//  RealmHelper.swift
//  Best Time Ever
//
//  Created by Stanford on 2016-07-26.
//  Copyright © 2016 Stanford. All rights reserved.
//

import Foundation
import RealmSwift


//dynamic var times: [String] = ["00:00", "01:00", "02:00", "03:00", "04:00", "05:00", "06:00", "07:00", "08:00", "09:00", "10:00", "11:00", "12:00", "13:00", "14:00", "15:00", "16:00", "17:00", "18:00", "19:00", "20:00", "21:00", "22:00", "23:00"]
//dynamic var feels: [Double] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]


class UserDefaultsHelper {
    
    func test() {
        
        // save date
        let times = ["00:00", "01:00", "02:00", "03:00", "04:00", "05:00", "06:00", "07:00", "08:00", "09:00", "10:00", "11:00", "12:00", "13:00", "14:00", "15:00", "16:00", "17:00", "18:00", "19:00", "20:00", "21:00", "22:00", "23:00"]
        let userDefaults = NSUserDefaults.standardUserDefaults()
        userDefaults.setValue(times, forKey: "times")
        userDefaults.synchronize()
        
        
        // retrieve data
        let retrievedTimes = userDefaults.valueForKey("times") as! [String]
        print(retrievedTimes)
        
        
        
    }
    
}



class RealmHelper {
    
    //adds Note to realm's default
    static func addResults(resultsData: ResultsData) { // Remember to pass in a Note and name the func addNote
        
        let realm = try! Realm() //let should be declared inside the func
        
        try! realm.write() {
            realm.add(resultsData)
            print("Added \(resultsData) to Realm")
            
        }
    }
    
    
//    
//    //deletes Note in realm's default
//    static func deleteResults(note: Note) {
//        let realm = try! Realm()
//        try! realm.write() {
//            realm.delete(note)
//        }
//    }
//    
//    //updates the note's contents with contents of newNote and it also updates realm's default
//    static func updateResults(noteToBeUpdated: Note, newNote: Note) {
//        let realm = try! Realm()
//        try! realm.write() {
//            noteToBeUpdated.title = newNote.title
//            noteToBeUpdated.content = newNote.content
//            noteToBeUpdated.modificationTime = newNote.modificationTime
//        }
//        
//    }
//    
//    //method that retrieves all the notes from default Realm, returns a Note object and sorts modificationTime in descending order
//    static func retrieveResults() -> Results<Note> {
//        let realm = try! Realm()
//        
//        return realm.objects(Note).sorted("modificationTime", ascending: false)
//        
//    }
}
