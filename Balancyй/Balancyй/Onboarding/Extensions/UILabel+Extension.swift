//
//  UILabel+Extension.swift
//  Balancy
//
//  Created by Дарья Пивовар on 06.10.2023.
//

import Foundation
import UIKit

extension UILabel {
    func halfTextColorChange (fullText : String , changeText : String) {
        let strNumber: NSString = fullText as NSString
        let range = (strNumber).range(of: changeText)
        let attribute = NSMutableAttributedString.init(string: fullText)
        attribute.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor(named: "customColorForOnboarding") , range: range)
        self.attributedText = attribute
    }
}
