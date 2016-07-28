//
//  ResultsData.swift
//  Best Time Ever
//
//  Created by Stanford on 2016-07-27.
//  Copyright © 2016 Stanford. All rights reserved.
//

import Foundation
import RealmSwift

//workaround to prevent 'RLMException', reason: 'Property 'times' is declared as 'NSArray'
class Workaround: Object {
    let integerList = List<ResultsData>()
    
    
}

class ResultsData: Object {
    
    dynamic var times: [String] = ["00:00", "01:00", "02:00", "03:00", "04:00", "05:00", "06:00", "07:00", "08:00", "09:00", "10:00", "11:00", "12:00", "13:00", "14:00", "15:00", "16:00", "17:00", "18:00", "19:00", "20:00", "21:00", "22:00", "23:00"]
    dynamic var feels: [Double] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
//    dynamic var data = [[]]
}

