//
//  CustomButton.swift
//  Balancy
//
//  Created by sofia on 21.12.2023.
//

import UIKit

/// Describe a custom button type
class CustomButton: UIButton {

    enum FontSize {
        case medium
        case big
    }
    
    // MARK: - Init

    init(title: String, hasBackground: Bool = false, fontSize: FontSize) {
        super.init(frame: .zero)
        self.setTitle(title, for: .normal)
        self.layer.cornerRadius = 20
        self.layer.masksToBounds = true
        
        self.backgroundColor = hasBackground ? #colorLiteral(red: 0.8471, green: 0.1961, blue: 0.3255, alpha: 1) : .clear
        
        let titleColor: UIColor = .white
        self.setTitleColor(titleColor, for: .normal)
        
        switch fontSize {
        case .big:
            self.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        
        case .medium:
            self.titleLabel?.font = .systemFont(ofSize: 12, weight: .semibold)
            
        }
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
