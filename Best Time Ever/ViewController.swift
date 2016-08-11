//
//  ViewController.swift
//  Best Time Ever
//
//  Created by Stanford on 2016-07-14.
//  Copyright © 2016 Stanford. All rights reserved.
//
import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    let userDefaults = NSUserDefaults.standardUserDefaults()
    
    var savedTimeDictionary: [String:Int] = [:]
    
    var savedTimeMoodArray: [TimeEvent] = []
    
    var savedTimeMood: TimeEvent?

    
    @IBOutlet weak var variableSavedIndicator: UILabel!
    @IBOutlet weak var pickerViewLabel: UIPickerView!
    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var saveData: UIButton!
    @IBOutlet weak var viewGraph: UIButton!
    
    //Resets the values for the graph
    
    @IBAction func unwindResetButton(segue: UIStoryboardSegue) {
        let chartViewController = segue.sourceViewController as? ChartViewController
        
        chartViewController!.chartData = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        
        savedTimeDictionary = [:]
        
        chartViewController!.userDefaults.setObject(chartViewController!.chartData, forKey: "mood")
        
        savedTimeMoodArray = []
        
        chartViewController!.userDefaults.synchronize()
    }
    
    //Retrieves the data
    
    @IBAction func saveData(sender: AnyObject) {
        
        let selectedTime = data[0][picker.selectedRowInComponent(0)]
        
        let selectedFeels = data[1][picker.selectedRowInComponent(1)]
        
        variableSavedIndicator.text = "Variables are saved, it is \(selectedTime) and \(selectedFeels)"
        
        
        
        
        if userDefaults.objectForKey("mood") as? [Int] == nil {
            
            let chartViewController: ChartViewController = ChartViewController()
            
            //       When a time is selected, assign it as selectedInThePickerTimesComponent
            let selectedInThePickerTimesComponent = picker.selectedRowInComponent(0)// todo
            
            //      When time is selected, assign it timeValue
            let timeValue = picker.selectedRowInComponent(0)
            //        When feeling is selected, assign it to feelValue
            let feelValueIndex = picker.selectedRowInComponent(1)
            
            //        have the integers of feelingPickerData be retrieved according to what is selected
            let feelValue = Int(feelingPickerData[feelValueIndex])
            
            //        Have a range selected?!
            let range: Range<Int> = selectedInThePickerTimesComponent...selectedInThePickerTimesComponent
            
            
            //        replace the range with the feel Value?!
            chartViewController.chartData.replaceRange(range, with: [feelValue])
            
            //                Saves mood/feels for ChartView
            let userDefaults = NSUserDefaults.standardUserDefaults()
            userDefaults.setObject(chartViewController.chartData, forKey: "mood")
            
            //                Save time and mood for List Results Table View
            let timeEvent = TimeEvent(time: timeValue, feels: feelValue)
            self.savedTimeMoodArray.append(timeEvent)
            timeEvent.save()
            
            userDefaults.synchronize()
            
            
            
        } else if userDefaults.objectForKey("mood") as? [Int] != nil {
            
            /* RETRIEVE THE DATA from NSUserDefaults*/
            
            userDefaults.synchronize()
            var savedMood = userDefaults.objectForKey("mood") as? [Int]
            
            
            /* Change/update the Data according to the UIPickerView*/
            //      When time is selected, assign it timeValue
            let timeValue = picker.selectedRowInComponent(0)
            
            //      When feeling is selected, assign it to feelValue
            let feelValue = picker.selectedRowInComponent(1)
            
            //        have the integers of feelingPickerData be retrieved according to what is selected
            let savedFeelValue = Int(feelingPickerData[feelValue])
            
            savedTimeMood = TimeEvent(time: timeValue, feels: feelValue)
            
            savedMood?[timeValue] = savedFeelValue // "something"
            
            
            /**/
            userDefaults.setObject(savedMood, forKey: "mood")
            variableSavedIndicator.text = "🕒: \(selectedTime) \n ⚡: \(selectedFeels) \n Saved"
            
            //     Retrieve Mood and time for ListResultsViewController
//            if let timeEvent = userDefaults.objectForKey("timeEvent") as? NSData {
//                let savedTimeMood1 = NSKeyedUnarchiver.unarchiveObjectWithData(timeEvent) as! TimeEvent

                savedTimeMoodArray.append(savedTimeMood!)
            
            
            print("savedTimeMood: \(savedTimeMood)")
//            }


            print("savedTimeArray in ViewController.swift: \(savedTimeMoodArray.last!.time) savedMoodArray in ViewController.swift: \(savedTimeMoodArray.last!.feels) ")
            
//            let defaults = NSUserDefaults.standardUserDefaults()
//            let array = defaults.arrayForKey("timeEvent")

            
            userDefaults.synchronize()
            
            
            
            
        }
        
        
        
        
    }
    
    let data = [
        
        [ "00:00", "01:00", "02:00", "03:00", "04:00", "05:00", "06:00", "07:00", "08:00", "09:00", "10:00", "11:00", "12:00", "13:00", "14:00", "15:00", "16:00", "17:00", "18:00", "19:00", "20:00", "21:00", "22:00", "23:00" ],
        
        ["1 ☹️", "2 😞", "3 😐", "4 🙂", "5 😄"]
        
    ]
    
    
    let feelingPickerData = [1, 2, 3, 4, 5]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        picker.setValue(UIColor.whiteColor(), forKey: "textColor")
        picker.layer.cornerRadius = 7
        saveData.layer.cornerRadius = 7
        viewGraph.layer.cornerRadius = 7
        variableSavedIndicator.hidden = true
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //asks how many tables are in a table view
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return data.count
    }
    
    
    //displays # of rows on the UIPickerView according to the # of values in feelingPickerData array
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return data[component].count
    }
    
    // assigns each row in UIPickerView an integer
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return data[component][row]
    }
    
    
    //pass data to the chartViewController
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ViewToChartViewControllerSegue"{
            
            let destVC = segue.destinationViewController as? ChartViewController
            destVC?.savedTimeMoodArray = self.savedTimeMoodArray
            
            print("savedTimeArray in ViewController segue: \(self.savedTimeMoodArray.first)")
            
            
        }
    }
    
    @IBAction func unwindToViewController(segue: UIStoryboardSegue) {
    }
    
    
    
}

