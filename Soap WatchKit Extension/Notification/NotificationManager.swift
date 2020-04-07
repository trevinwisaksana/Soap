//
//  NotificationManager.swift
//  Soap WatchKit App Extension
//
//  Created by Trevin Wisaksana on 04/04/20.
//  Copyright © 2020 Trevin Wisaksana. All rights reserved.
//

import UserNotifications

final class NotificationManager {
    static let shared = NotificationManager()
    
    func pushNotification() {
        let content = UNMutableNotificationContent()
        content.title = "Keep it up!"
        content.body = "You've just washed your hands. Keep doing it frequently."
        content.sound = .default
        
        let request = UNNotificationRequest(identifier: "LocalNotification", content: content, trigger: nil)
        
        /// Add notification to be notified
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }
    
}
