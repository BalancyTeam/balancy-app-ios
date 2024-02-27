//
//  UIButton+Extensions.swift
//  Balancy
//
//  Created by  Toropov Oleksandr on 23.01.2024.
//

import UIKit

extension UIButton {
    
    func setEnabled() {
        self.isEnabled = true
        self.alpha = 1
    }
    
    func setDisabled() {
        self.isEnabled = false
        self.alpha = 0.5
    }
}
