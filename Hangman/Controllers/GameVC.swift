//
//  GameViewController.swift
//  Hangman
//
//  Created by Veljko Milosevic on 07/04/2020.
//  Copyright © 2020 Veljko Milosevic. All rights reserved.
//

import UIKit
import AVFoundation

class GameVC: UIViewController {
    
    var gameStrategy:GuessingStrategy!
    var audioService = AudioService()
    
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
        gameStrategy.setupQuestion {
            self.clearUI()
        }
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        view.backgroundColor = AppSettings.shared.themeColor
    }
    
    @IBAction func buttonAction(_ sender: UIButton) {
        self.audioService.playSound(sound: .win)
        setupButtonOnClick(button: sender)
        
        let letter = Character(sender.currentTitle!)
        gameStrategy.checkPressedLetter(letter) { (errorNumber) in
            self.setupImagesByErrors(errorCount: errorNumber)
            self.audioService.playSound(sound: .lose)
        }
        result = gameStrategy.result
        
    }
    
    @IBAction func menuButtonAction(_ sender: UIBarButtonItem) {
        self.navigationController?.popViewController(animated: true)
    }
    
    private func clearUI() {
        let easyButton = String(result.first(where: {$0 != " " && $0 != "⟷"}) ?? "0")
        
        buttons.forEach({
            if $0.currentTitle == easyButton {
                $0.isEnabled = false
                $0.setTitleColor(.red, for: .disabled)
            }
            else {
                $0.isEnabled = true
                $0.setTitleColor(.white, for: .normal)
            }
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
        self.audioService.playSound(sound: .passed)
        self.setupAlert(type: .win, word: currentWord) {
            self.gameStrategy.setupQuestion {
                self.clearUI()
            }
        }
    }
    
    func gameLost(_ currentWord: Word) {
        self.audioService.playSound(sound: .hanged)
        self.setupAlert(type: .lose, word: currentWord) {
            self.gameStrategy.setupQuestion {
                self.clearUI()
            }
        }
    }
    
    func passedAll() {
        self.setupAlert(type: .passed, word: nil) {
            self.navigationController?.popViewController(animated: true)
        }
    }
    
}


