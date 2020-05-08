//
//  StringExtensions.swift
//  Hangman
//
//  Created by Veljko Milosevic on 08/04/2020.
//  Copyright © 2020 Veljko Milosevic. All rights reserved.
//

import Foundation

extension String {
    
    func findCharactersIndex(character:Character) -> [Int] {
        var empty = [Int]()
        for i in self.enumerated() {
            if i.element == character {
                empty.append(i.offset)
            }
        }
        return empty
        
    }
    
    subscript(index: Int) -> Character {
        get {
            return Array(self)[index]
        }
        set(newValue) {
            var temp = Array(self)
            temp[index] = newValue
            self = String(temp)
        }
    }
    
    func makeEmoji()-> String {
        return self.replacingOccurrences(of: "[a-z,A-Z]", with: "⟷", options: [.regularExpression])
    }
    
    func calculateUnique() -> Int {
        let word = self.uppercased().replacingOccurrences(of: " ", with: "")
        let numberOfDistinctChars = Set(word).count
        return numberOfDistinctChars
    }
    
}

