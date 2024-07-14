//
//  Date+Extensions.swift
//  Balancy
//
//  Created by Tobias on 14.07.2024.
//

import Foundation

extension Date {
    func toNormalizedDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d MMMM"
        let dateString = dateFormatter.string(from: self)
        return dateString
    }
}
