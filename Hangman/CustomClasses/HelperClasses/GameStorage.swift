//
//  GameStorage.swift
//  Hangman
//
//  Created by Veljko Milosevic on 08/05/2020.
//  Copyright © 2020 Veljko Milosevic. All rights reserved.
//

import Foundation


class GameStorage {
    private init(){}
    static let shared = GameStorage()
    var categories = [CategoryCD]()
    
    func getCategoryFromCategoryCD(indexPath:IndexPath) -> Category {
        let categoryCD = categories[indexPath.row]
        var words = [Word]()
        
        for c in categoryCD.words! {
            let word = c as! WordCD
            words.append(Word(title: word.title!, hidden: word.hidden!, uniqueCount: word.uniqueCount))
        }
        return Category(name: categoryCD.name!, image: "", words: words)
    }
}
