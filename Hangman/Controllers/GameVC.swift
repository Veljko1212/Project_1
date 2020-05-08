//
//  GameViewController.swift
//  Hangman
//
//  Created by Veljko Milosevic on 07/04/2020.
//  Copyright © 2020 Veljko Milosevic. All rights reserved.
//

import UIKit

class GameVC: UIViewController {
    
    @IBOutlet var buttons: [UIButton]!
    @IBOutlet var images: [UIImageView]!
    @IBOutlet weak var display: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func buttonAction(_ sender: UIButton) {
        
    }
    
    @IBAction func menuButtonAction(_ sender: UIBarButtonItem) {
        self.navigationController?.popViewController(animated: true)
    }
    
}



