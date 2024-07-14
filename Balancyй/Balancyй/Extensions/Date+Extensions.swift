//
//  Date+Extensions.swift
//  Balancy
//
//  Created by Tobias on 14.07.2024.
//

import Foundation

extension Date {
    var weekDay: String {
        getWithFormat("EE")
    }
    
    var dayDate: String {
        getWithFormat("dd")
    }
    
    var normalizedByDay: Date {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year, .month, .day], from: self)
        return calendar.date(from: components) ?? self
    }
    
    private func getWithFormat(_ format: String) ->  String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        let formatted = dateFormatter.string(from: self)
        return formatted
    }
}
