//
//  ViewController.swift
//  Best Time Ever
//
//  Created by Stanford on 2016-07-14.
//  Copyright © 2016 Stanford. All rights reserved.
//
import Charts
import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var picker: UIPickerView!

    var timePickerData = []
    
    let data = [[ "00:00", "01:00", "02:00", "03:00", "04:00", "05:00", "06:00", "07:00", "08:00", "09:00", "10:00", "11:00", "12:00", "13:00", "14:00", "15:00", "16:00", "17:00", "18:00", "19:00", "20:00", "21:00", "22:00", "23:00" ], ["1 ☹️", "2 😞", "3 😐", "4 🙂", "5 😄"]]

    let feelingPickerData = [1, 2, 3, 4, 5]

    
    //    var feelingPickerData: [String] = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        
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
    

    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        let selectedTime = data[0][picker.selectedRowInComponent(0)]
        
        let selectedFeels = data[1][picker.selectedRowInComponent(1)]
        
        
        print("Variables are saved, it is \(selectedTime) and \(selectedFeels)")
    }


    @IBAction func Submit(sender: AnyObject) {
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let graphViewController: GraphViewController = segue.destinationViewController as! GraphViewController
        let selectedInThePickerTimesComponent = picker.selectedRowInComponent(0)// todo
        let feelValueIndex = picker.selectedRowInComponent(1)
        let feelValue = Double(feelingPickerData[feelValueIndex])
        let range: Range<Int> = selectedInThePickerTimesComponent...selectedInThePickerTimesComponent
        graphViewController.feels.replaceRange(range, with: [feelValue])
//        graphViewController.feels.append(data[1
        
        
        
    }
    
    //grab whatever is selected from the first and second row

    
    
//    // Number of columns of data 
//    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
//        return 1
//    }
//    
//    // Number of rows of data
//    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
//        return ratePickerData.count
//    }
//    
//    //Data to return for the row and component that's being passed in
//    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        return ratePickerData[row]
//    }
    


}

