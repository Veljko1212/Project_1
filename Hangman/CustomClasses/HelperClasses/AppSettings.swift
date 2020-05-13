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
        static let color = "color"
        static let notification = "notification"
        static let firstLaunch = "firstLaunch"
    }
    
    var soundOn:Bool {
        get {
            return userDefaults.bool(forKey: Keys.sound) 
        }
        set {
            return userDefaults.set(newValue, forKey: Keys.sound)
        }
    }
    
    var themeColor:UIColor {
        get {
            return userDefaults.colorForKey(key: Keys.color) ?? #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        }
        set {
            return userDefaults.setColor(color: newValue, forKey: Keys.color)
        }
    }
    
    var notificationsOn:Bool {
        get {
            return userDefaults.bool(forKey: Keys.notification)
        }
        set {
            return userDefaults.set(newValue, forKey: Keys.notification)
        }
    }
    
    var isFirstLaunch:Bool {
        get {
            return userDefaults.bool(forKey: Keys.firstLaunch)
        }
        set {
            return userDefaults.set(newValue, forKey: Keys.firstLaunch)
        }
    }

}

