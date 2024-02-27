//
//  CustomTextView.swift
//  Balancy
//
//  Created by sofia on 26.02.2024.
//

import UIKit

/// Describe a custom and reusable text view type for combining two UI elements (String, String) where the second element has an attribute tappableText
class CustomTextView: UITextView, UITextViewDelegate {
    
//    Text font enum
//    enum FontSize {
//        case medium
//        case big
//    }
    
    // MARK: - Init

    // MARK: - TODO: Add FontSize property later
    init(normalText: String, tappableText: String/*, fontSize: FontSize*/) {
        super.init(frame: CGRect.zero, textContainer: nil)

//        normalText attributes
        let normalTextAttributes: [NSAttributedString.Key: Any] = [
          .foregroundColor: UIColor.gray
        ]

        // Attributes for tappable text
        let tappableTextAttributes: [NSAttributedString.Key: Any] = [
          .foregroundColor: UIColor.white,
          .link: "tappableLink"
        ]

        // Usage:

        let normalTextString = NSAttributedString(string: normalText + " ", attributes: normalTextAttributes)

        let tappableTextString = NSAttributedString(string: tappableText, attributes: tappableTextAttributes)

        let fullAttributedString = NSMutableAttributedString()
        fullAttributedString.append(normalTextString)
        fullAttributedString.append(tappableTextString)
        
//        Debug
        print("Full string before setting text view:", fullAttributedString)


        self.backgroundColor = .clear
        self.attributedText = fullAttributedString
        delegate = self

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
