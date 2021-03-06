//
//  ChartViewController.swift
//  Best Time Ever
//
//  Created by Stanford on 2016-08-03.
//  Copyright © 2016 Stanford. All rights reserved.
//

import UIKit
import JBChartView

class ChartViewController: UIViewController, JBLineChartViewDataSource, JBLineChartViewDelegate {
    
    
    @IBOutlet weak var resultsButton: UIButton!
    @IBOutlet weak var navigationBar: UINavigationBar!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var lineChart: JBLineChartView!
    @IBOutlet weak var informationLabel: UILabel!
    
    
    var chartLegend = ["00:00", "01:00", "02:00", "03:00", "04:00", "05:00", "06:00", "07:00", "08:00", "09:00", "10:00", "11:00", "12:00", "13:00", "14:00", "15:00", "16:00", "17:00", "18:00", "19:00", "20:00", "21:00", "22:00", "23:00"]
    
    var chartData = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    
    let userDefaults = NSUserDefaults.standardUserDefaults()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        informationLabel.layer.cornerRadius = 7
        lineChart.layer.cornerRadius = 7
        resultsButton.layer.cornerRadius = 7
        print("User defaults is:\(userDefaults.valueForKey("mood") as! [Int])")
        
//        Retrieve Chart Data
        chartData = userDefaults.valueForKey("mood") as! [Int]
        userDefaults.synchronize()

        
        
        
        
        
        
        // line chart setup
        lineChart.backgroundColor = UIColor.init(red:0.40, green:0.60, blue:1.00, alpha: 0.5)
        lineChart.delegate = self
        lineChart.dataSource = self
        lineChart.minimumValue = 0
        lineChart.maximumValue = 5

        lineChart.reloadData()
        lineChart.setState(.Collapsed, animated: false)
    }
    
    //    --------------------------------------------------------------
    //      footer,header
    //    --------------------------------------------------------------
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        let footerView = UIView(frame: CGRectMake(0, 0, lineChart.frame.width, 16))
        
        print("viewDidLoad: \(lineChart.frame.width)")
        
        let footer1 = UILabel(frame: CGRectMake(0, 0, lineChart.frame.width/2 - 8, 16))
        footer1.textColor = UIColor.whiteColor()
        footer1.text = "\(chartLegend[0])"
        
        let footer2 = UILabel(frame: CGRectMake(lineChart.frame.width/2 - 8, 0, lineChart.frame.width/2 - 8, 16))
        footer2.textColor = UIColor.whiteColor()
        footer2.text = "\(chartLegend[chartLegend.count - 1])"
        footer2.textAlignment = NSTextAlignment.Right
        
        footerView.addSubview(footer1)
        footerView.addSubview(footer2)
        
        lineChart.footerView = footerView
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        //        Animation that loads after 0.5 seconds of viewcontroller loading
        _ = NSTimer.scheduledTimerWithTimeInterval(0.25, target: self, selector: #selector(ChartViewController.showChart), userInfo: nil, repeats: false)
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        hideChart()
    }
    
    func hideChart() {
        lineChart.setState(.Collapsed, animated: true)
    }
    
    func showChart() {
        lineChart.setState(.Expanded, animated: true)
    }
    
    // MARK: JBlineChartView
    
    //    --------------------------------------------------------------
    //      footer,header
    //    --------------------------------------------------------------
    
    
    func numberOfLinesInLineChartView(lineChartView: JBLineChartView!) -> UInt {
        return 1
    }
    
    func lineChartView(lineChartView: JBLineChartView!, numberOfVerticalValuesAtLineIndex lineIndex: UInt) -> UInt {
        if (lineIndex == 0) {
            return UInt(chartData.count)
        }
        
        //        else if (lineIndex == 1) {
        //            return UInt(lastYearChartData.count)
        //        }
        
        return 0
    }
    
    func lineChartView(lineChartView: JBLineChartView!, verticalValueForHorizontalIndex horizontalIndex: UInt, atLineIndex lineIndex: UInt) -> CGFloat {
        if (lineIndex == 0) {
            return CGFloat(chartData[Int(horizontalIndex)])
        }
        //        else if (lineIndex == 1) {
        //            return CGFloat(lastYearChartData[Int(horizontalIndex)])
        //        }
        
        return 0
    }
    
    func lineChartView(lineChartView: JBLineChartView!, colorForLineAtLineIndex lineIndex: UInt) -> UIColor! {
        if (lineIndex == 0) {
            return UIColor.init(red:0.00, green:0.20, blue:0.60, alpha:0.5)
        }
        //        else if (lineIndex == 1) {
        //            return UIColor.whiteColor()
        //        }
        
        return UIColor.lightGrayColor()
    }
    
    func lineChartView(lineChartView: JBLineChartView!, showsDotsForLineAtLineIndex lineIndex: UInt) -> Bool {
        if (lineIndex == 0) { return false }
        //        else if (lineIndex == 1) { return false }
        
        return false
    }
    
    func lineChartView(lineChartView: JBLineChartView!, colorForDotAtHorizontalIndex horizontalIndex: UInt, atLineIndex lineIndex: UInt) -> UIColor! {
        return UIColor.lightGrayColor()
    }
    
    func lineChartView(lineChartView: JBLineChartView!, smoothLineAtLineIndex lineIndex: UInt) -> Bool {
        if (lineIndex == 0) { return true }
        //        else if (lineIndex == 1) { return true }
        
        return true
    }
    
    func lineChartView(lineChartView: JBLineChartView!, didSelectLineAtIndex lineIndex: UInt, horizontalIndex: UInt) {
        if (lineIndex == 0) {
            let data = chartData[Int(horizontalIndex)]
            let key = chartLegend[Int(horizontalIndex)]
            informationLabel.text = "🕒 \(key) \n ⚡: \(data)"
        }
    }
    
    func lineChartView(lineChartView: JBLineChartView!, fillColorForLineAtLineIndex lineIndex: UInt) -> UIColor! {
        if (lineIndex == 1) {
            return UIColor.whiteColor()
        }
        
        return UIColor.clearColor()
    }
    
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        
////                if segue.identifier == "ChartViewToListResultsViewControllerSegue"{
////        
////                    if (chartData == [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]) {
////        
////                        let alert = UIAlertController(title: "Error", message: "Ohhh noo... No values were saved", preferredStyle: UIAlertControllerStyle.Alert)
////                        alert.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.Default, handler: nil))
////                        self.presentViewController(alert, animated: true, completion: nil)
////        
////        
////                    } else {
////        
//////                        let destVC = segue.destinationViewController as? ListResultsViewController
//////                        destVC?.savedTimeMoodArray = self.savedTimeMoodArray
////                        print("wooooo")
////                    }
////                }
//        
//    }
    
    @IBAction func unwindToChartView(segue: UIStoryboardSegue) {
    }
    
    @IBAction func resetAlertConfirmation(sender: AnyObject) {
        
        let alert = UIAlertController(title: "Reset", message: "Are you sure you want to reset all values?", preferredStyle: UIAlertControllerStyle.Alert)
        
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Default, handler: nil))
        
        
        alert.addAction(UIAlertAction(title: "Yes", style: .Default, handler: { action in
            switch action.style{
            case .Default:
                self.performSegueWithIdentifier("unwindResetButtonToViewController", sender: self)
                print("default")
                
            case .Cancel:
                print("cancel")
                
            case .Destructive:
                print("destructive")
            }
        }))
        
        self.presentViewController(alert, animated: true, completion: nil)
    }
}
