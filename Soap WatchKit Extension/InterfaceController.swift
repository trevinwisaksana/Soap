//
//  InterfaceController.swift
//  Soap WatchKit Extension
//
//  Created by Trevin Wisaksana on 07/04/20.
//  Copyright © 2020 Trevin Wisaksana. All rights reserved.
//

import WatchKit
import Foundation
import UserNotifications

class InterfaceController: WKInterfaceController {
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var countLabel: WKInterfaceLabel!
    
    // MARK: - Properties
    
    private let motionManager = MotionManager()
    private let handWashCounter = HandWashCounter()
    
    // MARK: - Overrides
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        motionManager.delegate = self
        motionManager.startUpdates()
        
        UNUserNotificationCenter.current().delegate = self
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        
        /// This will resent the hand washing count when needed
        handWashCounter.resetCountIfNeeded()
        
        countLabel.setText("\(handWashCounter.currentCount())")
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
}

// MARK: - MotionManagerDelegate

extension InterfaceController: MotionManagerDelegate {
    func didUpdateCounter(_ manager: MotionManager) {
        handWashCounter.increment()
        
        countLabel.setText("\(handWashCounter.currentCount())")
    }
}

// MARK: - UNUserNotificationCenterDelegate

extension InterfaceController: UNUserNotificationCenterDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        
    }
}
