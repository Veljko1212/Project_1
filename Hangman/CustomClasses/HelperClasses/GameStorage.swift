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
}
