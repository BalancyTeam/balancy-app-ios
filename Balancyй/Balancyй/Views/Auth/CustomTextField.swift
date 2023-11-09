//
//  CustomTextField.swift
//  Balancy
//
//  Created by sofia on 02.11.2023.
//

import UIKit

/// Configures and represents a single user field
final class CustomTextField: UITextField {

    enum CustomTextFieldType {
        case username
        case password
        case email
    }
    
    // MARK: - Will be used for field borders later

    override func draw(_ rect: CGRect) {

        let borderColor = UIColor(named: "#48484A")?.cgColor ?? UIColor.lightGray.cgColor
//        let borderColor = #colorLiteral(red: 72, green: 72, blue: 72, alpha: 1).cgColor

      layer.borderWidth = 1
      layer.borderColor = borderColor

      super.draw(rect)
    }
    
    private let authFieldType: CustomTextFieldType
    
    // MARK: - Init

    init(authFieldType: CustomTextFieldType) {
        self.authFieldType = authFieldType
        super .init(frame: .zero)
        
        self.backgroundColor = UIColor(named: "#121212")
        
        // MARK: - Debug line
//        self.backgroundColor = .secondarySystemBackground
        
        self.layer.cornerRadius = 20
        
        self.returnKeyType = .done
        self.autocorrectionType = .no
        self.autocapitalizationType = .none
        
        draw(.zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
