//
//  StatisticVC.swift
//  HangmaN
//
//  Created by Veljko Milosevic on 11/01/2020.
//  Copyright © 2020 Veljko Milosevic. All rights reserved.
//

import UIKit
import Charts

class StatisticVC: UIViewController {
    
    @IBOutlet weak var gamesPlayed: UILabel!
    @IBOutlet weak var gamesWon: UILabel!
    @IBOutlet weak var gamesLost: UILabel!
    @IBOutlet weak var pieView: PieChartView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func goTomenuButton(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
        
        let datapoints = ["Win", "Lose"]
        let numAll = StatsServices.shared.allGamesNum
        let numWon = StatsServices.shared.wonGames
        let numLost = StatsServices.shared.lostGames
        
        gamesPlayed.text = String(numAll)
        gamesWon.text = String(numWon)
        gamesLost.text = String(numLost)
        
        let wonPercentage =
            Double((Double(numWon) / Double(numAll)) * 100)
        let LostPercentage =
            Double((Double(numLost) / Double(numAll)) * 100)
        let values = [wonPercentage, LostPercentage]
        
        pieView.setChart(dataPoints: datapoints, values: values)
        
    }
    
    
}
