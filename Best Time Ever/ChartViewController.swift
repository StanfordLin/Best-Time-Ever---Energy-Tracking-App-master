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
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var lineChart: JBLineChartView!
    @IBOutlet weak var informationLabel: UILabel!
    
    var chartLegend = ["00:00", "01:00", "02:00", "03:00", "04:00", "05:00", "06:00", "07:00", "08:00", "09:00", "10:00", "11:00", "12:00", "13:00", "14:00", "15:00", "16:00", "17:00", "18:00", "19:00", "20:00", "21:00", "22:00", "23:00"]
    var chartData = [0, 5, 0, 0, 0, 4, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]

    let userDefaults = NSUserDefaults.standardUserDefaults()

//    --------------------------------------------------------------
//var lastYearChartData = [75, 88, 79, 95, 72, 55, 90]
//    --------------------------------------------------------------
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        backButton.layer.cornerRadius = 7
        
        print("User defaults is:\(userDefaults.valueForKey("mood") as! [Double])")
        
        chartData = userDefaults.valueForKey("mood") as! [Int]
        userDefaults.synchronize()
        print("Current mood is \(chartData)")
        
        view.backgroundColor = UIColor.darkGrayColor()
        
        // line chart setup
        lineChart.backgroundColor = UIColor.darkGrayColor()
        lineChart.delegate = self
        lineChart.dataSource = self
        lineChart.minimumValue = 0
        lineChart.maximumValue = 5
        
//        lineChart.contentView.layoutIfNeeded()
        
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
        
        let header = UILabel(frame: CGRectMake(0, 0, lineChart.frame.width, 50))
        header.textColor = UIColor.whiteColor()
        header.font = UIFont.systemFontOfSize(24)
        header.text = "Energy Level:"
        header.textAlignment = NSTextAlignment.Center
        
        lineChart.footerView = footerView
        lineChart.headerView = header
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
//        Animation that loads after 0.5 seconds of viewcontroller loading
        var timer = NSTimer.scheduledTimerWithTimeInterval(0.5, target: self, selector: #selector(ChartViewController.showChart), userInfo: nil, repeats: false)
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
            return UIColor.lightGrayColor()
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
//        else if (lineIndex == 1) {
//            let data = lastYearChartData[Int(horizontalIndex)]
//            let key = chartLegend[Int(horizontalIndex)]
//            informationLabel.text = "Weather last year on \(key): \(data)"
//        }
    }
    
    func didDeselectLineInLineChartView(lineChartView: JBLineChartView!) {
        informationLabel.text = ""
    }
    
    func lineChartView(lineChartView: JBLineChartView!, fillColorForLineAtLineIndex lineIndex: UInt) -> UIColor! {
        if (lineIndex == 1) {
            return UIColor.whiteColor()
        }
        
        return UIColor.clearColor()
    }

}
