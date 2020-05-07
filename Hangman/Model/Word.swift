//
//  Word.swift
//  Hangman
//
//  Created by Veljko Milosevic on 05/04/2020.
//  Copyright © 2020 Veljko Milosevic. All rights reserved.
//

import Foundation


struct Word:Codable {
    var title:String
    var hidden:String
    var uniqueCount:Int16
}
