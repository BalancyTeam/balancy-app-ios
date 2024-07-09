//
//  UISlider+Extensions.swift
//  Balancy
//
//  Created by Oleksandr Toropov on 09.07.2024.
//

import UIKit

extension UISlider {
    var thumbCenterX: CGFloat {
        let trackRect = self.trackRect(forBounds: bounds)
        let thumbRect = self.thumbRect(forBounds: bounds, trackRect: trackRect, value: value)
        return thumbRect.midX
    }
}
