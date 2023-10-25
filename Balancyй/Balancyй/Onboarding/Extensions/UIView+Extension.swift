//
//  UIView+Extensions.swift
//  Balancy
//
//  Created by Дарья Пивовар on 27.09.2023.
//

import UIKit

extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get { return self.cornerRadius }
        set {
            self.layer.cornerRadius = newValue
        }
    }
}
