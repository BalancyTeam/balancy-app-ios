//
//  Int+Extensions.swift
//  Balancy
//
//  Created by Tobias on 05.03.2024.
//

import Foundation

extension Int {
    func convertToSize() -> Double {
        let totalSizeInMB = Double(self) / (1024 * 1024)
        return totalSizeInMB
    }
}
