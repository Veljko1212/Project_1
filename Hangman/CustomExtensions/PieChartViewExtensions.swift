//
//  PieChartViewExtensions.swift
//  HangmanTop
//
//  Created by Veljko Milosevic on 15/03/2020.
//  Copyright © 2020 Veljko Milosevic. All rights reserved.
//

import Charts

extension PieChartView {
    func setChart(dataPoints:[String],values:[Double]) {
        var dataEntries = [PieChartDataEntry]()
        for i in 0..<dataPoints.count {
            let dataEntry =  PieChartDataEntry(value: values[i], label: dataPoints[i])
            dataEntries.append(dataEntry)
        }
        
        let pieChartDataSet = PieChartDataSet(entries: dataEntries, label: "")
        pieChartDataSet.sliceSpace = 5
        pieChartDataSet.selectionShift = 2
        //
        let colors: [[UIColor]] = [[#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1),#colorLiteral(red: 0.8460897843, green: 0.02618473401, blue: 0.3785707442, alpha: 1)],[#colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1),#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)],[#colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1),#colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)],[#colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1),#colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)],[#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1),#colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)],[#colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1),#colorLiteral(red: 0.3138374961, green: 0, blue: 0.4695233185, alpha: 1)],[#colorLiteral(red: 0.9686274529, green: 0.771606577, blue: 0.6279468358, alpha: 1),#colorLiteral(red: 0.8460897843, green: 0.4890146364, blue: 0.3958639453, alpha: 1)],[#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1),#colorLiteral(red: 0.7281410593, green: 0.8460897843, blue: 0.8308820629, alpha: 1)]]
        
        pieChartDataSet.colors = colors.randomElement()!
        
        let pieChartData = PieChartData(dataSet: pieChartDataSet)
        
        let pFormatter = NumberFormatter()
        pFormatter.numberStyle = .percent
        pFormatter.maximumFractionDigits = 1
        pFormatter.multiplier = 1
        pFormatter.percentSymbol = " %"
        pieChartData.setValueFormatter(DefaultValueFormatter(formatter: pFormatter))
        
        pieChartData.setValueFont(UIFont(name: "HelveticaNeue-Light", size: 16)!)
        pieChartData.setValueTextColor(.white)
        self.legend.textColor = UIColor.black
        self.legend.font = UIFont(name: "HelveticaNeue-Light", size: 17)!
        self.legend.formSize = 25
        
        self.data = pieChartData
        self.setNeedsDisplay()
        self.animate(xAxisDuration: 2.0,easingOption: .easeOutElastic)
        
        
    }
}
