//
//  Category.swift
//  Hangman
//
//  Created by Veljko Milosevic on 05/04/2020.
//  Copyright © 2020 Veljko Milosevic. All rights reserved.
//

import Foundation


struct Category:Codable {
    var name:String
    var image:String
    var words:[Word]
}

