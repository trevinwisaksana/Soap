//
//  HandWashCounter.swift
//  Soap WatchKit App Extension
//
//  Created by Trevin Wisaksana on 04/04/20.
//  Copyright © 2020 Trevin Wisaksana. All rights reserved.
//

import Foundation

final class HandWashCounter {
    
    /// Adds the hand wash counter by one
    func increment() {
        let currentValue = UserDefaults.standard.integer(forKey: UserDefaultsKey.HandWashCounter.key)
        
        let updatedValue = currentValue + 1
        UserDefaults.standard.set(updatedValue, forKey: UserDefaultsKey.HandWashCounter.key)
        
        UserDefaults.standard.set(Date(), forKey: UserDefaultsKey.LastSaveDate.key)
    }
    
    /// Get the current count today
    func currentCount() -> Int {
        return UserDefaults.standard.integer(forKey: UserDefaultsKey.HandWashCounter.key)
    }
    
    /// Resets the hand wash count if it is a new day
    func resetCountIfNeeded() {
        let calendar = Calendar.current
        
        var components = DateComponents()
        components.day = 1
        components.second = -1
        
        let startOfDay = calendar.startOfDay(for: Date())
        
        guard let endOfDay = calendar.date(byAdding: components, to: startOfDay) else {
            return
        }
        
        if let lastSaveDate = UserDefaults.standard.object(forKey: UserDefaultsKey.LastSaveDate.key) as? Date {
            /// If the last save date has passed the end of the day
            if lastSaveDate > endOfDay {
                UserDefaults.standard.set(0, forKey: UserDefaultsKey.HandWashCounter.key)
            }
        }
    }
    
}
