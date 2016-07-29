//  GraphViewController.swift
//  Best Time Ever
//
//  Created by Stanford on 2016-07-14.
//  Copyright © 2016 Stanford. All rights reserved.
//

import Charts
import Foundation

class GraphViewController: UIViewController, ChartViewDelegate {
    
    @IBOutlet weak var lineChartView: LineChartView!
    @IBOutlet weak var tableView: UITableView!
    
    let userDefaults = NSUserDefaults.standardUserDefaults()
    
    let times: [String] = ["00:00", "01:00", "02:00", "03:00", "04:00", "05:00", "06:00", "07:00", "08:00", "09:00", "10:00", "11:00", "12:00", "13:00", "14:00", "15:00", "16:00", "17:00", "18:00", "19:00", "20:00", "21:00", "22:00", "23:00"]
    
    var mood: [Double] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if(userDefaults.valueForKey("moodArray") != nil) {
            mood = userDefaults.valueForKey("moodArray") as! [Double]
        }
        
        // 1
        self.lineChartView.delegate = self
        // 2
        self.lineChartView.descriptionText = "Tap node for details"
        // 3
        self.lineChartView.descriptionTextColor = UIColor.whiteColor()
        self.lineChartView.gridBackgroundColor = UIColor.darkGrayColor()
        // 4
        self.lineChartView.noDataText = "No data provided"
        // 5
        setChartData()
        print(mood)
        
        
        
    }
    
    
    
    
    func setChartData() {
        // 1 - creating an array of data entries
        var yVals1 : [ChartDataEntry] = [ChartDataEntry]()
        for i in 0 ..< times.count {
            
            let element = mood[i]
            print("index: \(i), element: \(element), number of elements: \(mood.count)")
            yVals1.append(ChartDataEntry(value: element, xIndex: i))
        }
        
        // 2 - create a data set with our array
        let set1: LineChartDataSet = LineChartDataSet(yVals: yVals1, label: "First Set")
        set1.axisDependency = .Left // Line will correlate with left axis values
        set1.setColor(UIColor.redColor().colorWithAlphaComponent(0.5)) // our line's opacity is 50%
        set1.setCircleColor(UIColor.redColor()) // our circle will be dark red
        set1.lineWidth = 2.0
        set1.circleRadius = 6.0 // the radius of the node circle
        set1.fillAlpha = 65 / 255.0
        set1.fillColor = UIColor.redColor()
        set1.highlightColor = UIColor.whiteColor()
        set1.drawCircleHoleEnabled = true
        
        //3 - create an array to store our LineChartDataSets
        var dataSets : [LineChartDataSet] = [LineChartDataSet]()
        dataSets.append(set1)
        
        //4 - pass our months in for our x-axis label value along with our dataSets
        let data: LineChartData = LineChartData(xVals: times, dataSets: dataSets)
        data.setValueTextColor(UIColor.whiteColor())
        
        //5 - finally set our data
        self.lineChartView.data = data
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    // 2
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // 3
        let cell = tableView.dequeueReusableCellWithIdentifier("listNotesTableViewCell", forIndexPath: indexPath)
        
        // 4
        cell.textLabel?.text = "Yay - it's working!"
        
        // 5
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let identifier = segue.identifier {
            if identifier == "back" {
                print("Back was tapped")
            }
        }
    }
    
}

