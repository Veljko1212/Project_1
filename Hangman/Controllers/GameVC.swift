//
//  GameViewController.swift
//  Hangman
//
//  Created by Veljko Milosevic on 07/04/2020.
//  Copyright © 2020 Veljko Milosevic. All rights reserved.
//

import UIKit

class GameVC: UIViewController {
    
    var gameStrategy:GuessingStrategy!
    
    @IBOutlet var buttons: [UIButton]!
    @IBOutlet var images: [UIImageView]!
    @IBOutlet weak var display: UILabel!
    
    private var result:String {
        get {
            return gameStrategy.result
        }
        set {
            display.text = newValue
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = gameStrategy.title
        clearUI()
        
    }
    
    @IBAction func buttonAction(_ sender: UIButton) {
        setupButtonOnClick(button: sender)
        
        let letter = Character(sender.currentTitle!)
        gameStrategy.checkPressedLetter(letter) { (errorNumber) in
            self.setupImagesByErrors(errorCount: errorNumber)
        }
        result = gameStrategy.result
        
    }
    
    @IBAction func menuButtonAction(_ sender: UIBarButtonItem) {
        self.navigationController?.popViewController(animated: true)
    }
    
    private func clearUI() {
        buttons.forEach({
            $0.isEnabled = true
            $0.setTitleColor(.white, for: .normal)
        })
        
        images.forEach({$0.isHidden = true})
        self.result = self.gameStrategy.result
    }
    
    private func setupImagesByErrors(errorCount:Int) {
        images[errorCount].isHidden = false
    }
    
    private func setupButtonOnClick(button:UIButton) {
        button.setTitleColor(.red, for: .normal)
        button.isEnabled = false
    }
}



extension GameVC: StrategyDelegate {
    
    func gameWon(_ currentWord: Word) {
        print("Game won , word is \(currentWord.title)")
        self.gameStrategy.setupQuestion {
            self.clearUI()
        }
        
    }
    
    func gameLost(_ currentWord: Word) {
        print("Game lost , word is \(currentWord.title)")
        self.gameStrategy.setupQuestion {
            self.clearUI()
        }
    }
    
    func passedAll() {
        print("u have passed all the words , please go back")
        self.navigationController?.popViewController(animated: true)
        
    }
    
}


