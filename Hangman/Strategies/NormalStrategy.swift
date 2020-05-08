//
//  NormalStrategy.swift
//  Hangman
//
//  Created by Veljko Milosevic on 08/04/2020.
//  Copyright © 2020 Veljko Milosevic. All rights reserved.
//

import Foundation


class NormalStrategy:GuessingStrategy {
    
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
    
    private func deleteWonword() {
        category.words.removeAll(where: {$0.title == currentWord.title})
    }
    
    
    private var goodWordCounter: Int = 0 {
        didSet {
            if goodWordCounter == currentWord.uniqueCount {
                delegate?.gameWon(currentWord)
                deleteWonword()
            }
        }
    }
    
    private var badWordCounter: Int = 0 {
        didSet {
            if badWordCounter == 7 {
                delegate?.gameLost(currentWord)
            }
        }
    }
    
    
    var title: String {
        return category.name
    }
    
    var result:String {
        return currentWord.hidden
    }
    
}


