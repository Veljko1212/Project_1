//
//  StatisticVC.swift
//  HangmaN
//
//  Created by Veljko Milosevic on 11/01/2020.
//  Copyright © 2020 Veljko Milosevic. All rights reserved.
//

import UIKit

class StatisticVC: UIViewController {
    
    @IBOutlet weak var gamesPlayed: UILabel!
    @IBOutlet weak var gamesWon: UILabel!
    @IBOutlet weak var gamesLost: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let numAll = StatsServices.shared.allGamesNum
        let numWon = StatsServices.shared.wonGames
        let numLost = StatsServices.shared.lostGames
        print("All games \(numAll)")
        print("Won games \(numWon)")
        print("Lost games \(numLost)")
        
    }
    
    @IBAction func goTomenuButton(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    
    
}
