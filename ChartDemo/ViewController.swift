//
//  ViewController.swift
//  ChartDemo
//
//  Created by Ravindra Sonkar on 17/05/18.
//  Copyright © 2018 Ravindra Sonkar. All rights reserved.
//

import UIKit
import Charts

class ViewController: UIViewController, ChartViewDelegate{

    @IBOutlet weak var lineChartView: LineChartView!
    
    let months = ["19-Sep-2017 to 23-Sep-2017", "24-Sep-2017 to 30-Sep-2017", "01-Oct-2017 to 07-Oct-2017", "08-Oct-2017 to 18-Oct-2017"]
    
    let dollars1 = [1453.0,2352,5431,1442]
    let dollars2 = [5641.0,2234,8763,4453]
    let dollars3 = [6541.0,3456,7843,5678]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setChartData(months: months)
        
           }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func setChartData(months : [String]) {
        
        var yVals1 : [ChartDataEntry] = [ChartDataEntry]()
        for i in 0 ..< months.count {
            yVals1.append(ChartDataEntry(x:Double(i) , y:dollars1[i]))
        }
        
        let set1: LineChartDataSet = LineChartDataSet(values: yVals1, label: "First Set")
        set1.axisDependency = .left // Line will correlate with left axis values
        set1.setColor(UIColor.red.withAlphaComponent(0.5))
        set1.setCircleColor(UIColor.red)
        set1.circleRadius = 3.0
        set1.fillAlpha = 65 / 255.0
        set1.fillColor = UIColor.red
        set1.highlightColor = UIColor.white
        set1.drawCircleHoleEnabled = false
        
        var yVals2 : [ChartDataEntry] = [ChartDataEntry]()
        for i in 0 ..< months.count {
            yVals2.append(ChartDataEntry(x:Double(i) , y: dollars2[i]))
        }
        
        let set2: LineChartDataSet = LineChartDataSet(values: yVals2, label: "Second Set")
        set2.axisDependency = .left // Line will correlate with left axis values
        set2.setColor(UIColor.green.withAlphaComponent(0.5))
        set2.setCircleColor(UIColor.green)
        set2.circleRadius = 3.0
        set2.fillAlpha = 65 / 255.0
        set2.fillColor = UIColor.green
        set2.highlightColor = UIColor.white
        set2.drawCircleHoleEnabled = false
        set2.circleHoleRadius = 0.5
        
        var yVals3 : [ChartDataEntry] = [ChartDataEntry]()
        for i in 0 ..< months.count {
            yVals3.append(ChartDataEntry(x:Double(i) , y: dollars3[i]))
        }
        
        let set3: LineChartDataSet = LineChartDataSet(values: yVals3, label: "Third Set")
        set3.axisDependency = .left // Line will correlate with left axis values
        set3.setColor(UIColor.blue.withAlphaComponent(0.5))
        set3.setCircleColor(UIColor.blue)
        set3.circleRadius = 3.0
        set3.fillAlpha = 65 / 255.0
        set3.fillColor = UIColor.blue
        set3.highlightColor = UIColor.white
        set3.drawCircleHoleEnabled = false
        
        //3 - create an array to store our LineChartDataSets
        var dataSets : [LineChartDataSet] = [LineChartDataSet]()
        dataSets.append(set1)
        dataSets.append(set2)
        dataSets.append(set3)
        
        //4 - pass our months in for our x-axis label value along with our dataSets
        let data : LineChartData = LineChartData(dataSets: dataSets)
        lineChartView.xAxis.valueFormatter = IndexAxisValueFormatter(values: months)
        
        // data.setValueTextColor(UIColor.white)
        
        //5 - finally set our data
        self.lineChartView.data = data
        
        lineChartView.xAxis.granularity = 1 //  to show intervals
        lineChartView.xAxis.wordWrapEnabled = true
        
        lineChartView.xAxis.labelFont = UIFont.boldSystemFont(ofSize: 8.0)
        
        lineChartView.xAxis.labelPosition = .bottom // lebel position on graph
        
        lineChartView.legend.form = .line // indexing shape
        lineChartView.xAxis.drawGridLinesEnabled = false // show gird on graph
        lineChartView.rightAxis.drawLabelsEnabled = false// to show right side value on graph
        lineChartView.data?.setDrawValues(false) //
        lineChartView.chartDescription?.text = ""
        lineChartView.doubleTapToZoomEnabled = false
        lineChartView.pinchZoomEnabled = false
        lineChartView.scaleXEnabled = false
        lineChartView.scaleYEnabled = false
        
        lineChartView.animate(yAxisDuration: 1.5, easingOption: .easeInOutQuart)
    }
}

