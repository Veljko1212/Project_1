//
//  NotificationServices.swift
//  Hangman
//
//  Created by Veljko Milosevic on 11/04/2020.
//  Copyright © 2020 Veljko Milosevic. All rights reserved.
//

import Foundation
import NotificationCenter

class NotificationServices {
    
    private let center = UNUserNotificationCenter.current()
    
    func askForPermission() {
        if AppSettings.shared.isFirstLaunch == false {
            center.requestAuthorization(options: [.alert, .sound]) {
                granted, error in
                if granted {
                    AppSettings.shared.isFirstLaunch = true
                    AppSettings.shared.notificationsOn = true
                    print("We have permission")
                    self.setupNotification()
                } else {
                    print("Permission denied")
                }
            }
        }
        return
    }
    
    private func setupNotification() {
        if AppSettings.shared.notificationsOn {
            let content = UNMutableNotificationContent()
            content.title = "Hello!"
            content.body = "Play me today !!"
            content.sound = UNNotificationSound.default
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 60,repeats: true)
            let request = UNNotificationRequest(identifier: "MyNotification",content: content,trigger: trigger)
            
            center.add(request)
        }
            
        else {return}
            
        
    }
    
    func showNotification(value:Bool) {
        switch value {
        case true:
            AppSettings.shared.notificationsOn = true
        case false:
            resetNotifications()
        
        }
    }
    
    
    
   private func resetNotifications() {
        center.removeAllPendingNotificationRequests()
    }
}
