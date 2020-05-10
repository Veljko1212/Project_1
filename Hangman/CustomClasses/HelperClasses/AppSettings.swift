//
//  AppSettings.swift
//  Hangman
//
//  Created by Veljko Milosevic on 10/05/2020.
//  Copyright © 2020 Veljko Milosevic. All rights reserved.
//

import Foundation
import UIKit


class AppSettings {
    
    private let userDefaults = UserDefaults.standard
    private init(){}
    static let shared = AppSettings()
    
    private struct Keys {
        static let sound = "sound"
    }
    
    var soundOn:Bool {
        get {
            return userDefaults.bool(forKey: Keys.sound) 
        }
        set {
            return userDefaults.set(newValue, forKey: Keys.sound)
        }
    }

}

