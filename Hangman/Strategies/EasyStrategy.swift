//
//  EasyStrategy.swift
//  Hangman
//
//  Created by Veljko Milosevic on 09/05/2020.
//  Copyright © 2020 Veljko Milosevic. All rights reserved.
//

import Foundation


class EasyStrategy:GuessingStrategy {
    
    var delegate:StrategyDelegate?
    private var category:Category
    private var currentWord:Word!
    
    init(category:Category) {
        self.category = category
        setupQuestion(handler: nil)
    }
    
    func setupQuestion(handler:(()->Void)?) {
        guard let word = category.words.randomElement() else {
            delegate?.passedAll()
            return
        }
        
        currentWord = word
        let random = currentWord.title.randomElement()!
        let indexes = currentWord.title.findCharactersIndex(character: random)
        indexes.forEach({currentWord.hidden[$0] = random})
        badWordCounter = 0
        goodWordCounter = 0
        handler?()
        
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
    
    private func deleteWonword() {
        category.words.removeAll(where: {$0.title == currentWord.title})
    }
    
    
    private var goodWordCounter: Int = 0 {
        didSet {
            if goodWordCounter == currentWord.uniqueCount - 1 {
                deleteWonword()
                delegate?.gameWon(currentWord)
                saveWin()
            }
        }
    }
    
    private var badWordCounter: Int = 0 {
        didSet {
            if badWordCounter == 7 {
                delegate?.gameLost(currentWord)
                saveLose()
            }
        }
    }
    
    private func saveWin(){
        StatsServices.shared.wonGamesIncrement()
    }
    
    private func saveLose(){
        StatsServices.shared.lostGamesIncrement()
    }
    
    var title: String {
        return category.name
    }
    
    var result:String {
        return currentWord.hidden
    }
    
}

