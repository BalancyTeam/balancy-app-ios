//
//  UserPreferenceManager.swift
//  Balancy
//
//  Created by Oleksandr on 15.10.2024.
//

import Foundation

class UserPreferenceManager {
    private let userDefaults: UserDefaults
    
    init(userDefaults: UserDefaults = .standard) {
        self.userDefaults = userDefaults
    }
    
    func saveTime(hour: Int, minute: Int) {
        let timeData = ["hour": hour, "minute": minute]
        userDefaults.set(timeData, forKey: "selectedTime")
    }
    
    func loadTime() -> (hour: Int, minute: Int)? {
        if let timeData = userDefaults.dictionary(forKey: "selectedTime") as? [String: Int],
           let hour = timeData["hour"],
           let minute = timeData["minute"] {
            return (hour, minute)
        }
        return nil
    }
}

