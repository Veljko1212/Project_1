//
//  ViewController.swift
//  Hangman
//
//  Created by Veljko Milosevic on 06/05/2020.
//  Copyright © 2020 Veljko Milosevic. All rights reserved.
//

import UIKit

class RootVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.isHidden = false
    }
    
}

