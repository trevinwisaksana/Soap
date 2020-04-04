//
//  InterfaceController.swift
//  Soap WatchKit App Extension
//
//  Created by Trevin Wisaksana on 25/03/20.
//  Copyright © 2020 Trevin Wisaksana. All rights reserved.
//

import WatchKit
import Foundation
import UserNotifications

class InterfaceController: WKInterfaceController {
    
    // MARK: - Properties
    
    private let motionManager = MotionManager()
    
    // MARK: - Overrides

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        motionManager.startUpdates()
        
        UNUserNotificationCenter.current().delegate = self
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}

// MARK: - UNUserNotificationCenterDelegate

extension InterfaceController: UNUserNotificationCenterDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        
    }
}
