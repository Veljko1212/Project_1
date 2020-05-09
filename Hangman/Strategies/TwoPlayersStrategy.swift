//
//  TwoPlayersStrategy.swift
//  Hangman
//
//  Created by Veljko Milosevic on 09/04/2020.
//  Copyright © 2020 Veljko Milosevic. All rights reserved.
//

import Foundation
import UIKit


class TwoPlayersStrategy : GuessingStrategy{
    
    var delegate:StrategyDelegate?
    private var currentWord:Word!
    
    init() {
        currentWord = Word(title: "", hidden: "", uniqueCount: 3)
    }
    
    func setupQuestion(handler:(()->Void)?) {
        
        let viewController = UIApplication.getTopViewController()!
        viewController.setupSetWordAlert { (guessingWord) in
            let word = Word(title: guessingWord.uppercased(), hidden: guessingWord.makeEmoji(), uniqueCount: Int16(guessingWord.calculateUnique()))
            self.currentWord = word
            handler!()
        }
        
        badWordCounter = 0
        goodWordCounter = 0
        
    }
    
    func checkPressedLetter(_ letter: Character,_ handler:@escaping(Int)->Void) {
        if currentWord.title.contains(letter) {
            let indexes = currentWord.title.findCharactersIndex(character: letter)
            indexes.forEach({currentWord.hidden[$0] = letter})
            goodWordCounter += 1
        }
        else {
            handler(badWordCounter)
            badWordCounter += 1
        }
        
    }
    
    
    private var goodWordCounter: Int = 0 {
        didSet{
            if goodWordCounter == currentWord.uniqueCount{
                delegate?.gameWon(currentWord)
                
            }
        }
    }
    
    private var badWordCounter: Int = 0 {
        didSet{
            if badWordCounter == 7 {
                delegate?.gameLost(currentWord)
                
            }
        }
    }
    
    
    var title: String {
        return "Multiplayer"
    }
    
    var result:String {
        return currentWord.hidden
    }
}



