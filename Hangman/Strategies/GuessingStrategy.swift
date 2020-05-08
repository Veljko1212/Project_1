//
//  GuessingStrategy.swift
//  Hangman
//
//  Created by Veljko Milosevic on 08/04/2020.
//  Copyright © 2020 Veljko Milosevic. All rights reserved.
//

import Foundation


protocol GuessingStrategy {
    func setupQuestion(handler:(()->Void)?)
    func checkPressedLetter(_ letter:Character,_ handler:@escaping(Int)->Void)
    var title:String {get}
    var result:String {get}
}


protocol StrategyDelegate {
    func gameWon(_ currentWord:Word)
    func gameLost(_ currentWord:Word)
    func passedAll()
}

