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
        case email
        case password
    }
    
    private let authFieldType: CustomTextFieldType
    private let borderWidth: CGFloat = 1
    private let borderColor = #colorLiteral(red: 0.72, green: 0.72, blue: 0.74, alpha: 0.4).cgColor

    
    // MARK: - Init

    init(fieldType: CustomTextFieldType) {
        self.authFieldType = fieldType
        super .init(frame: .zero)
        
        self.layer.cornerRadius = 20
        self.layer.masksToBounds = true
        self.returnKeyType = .done
        self.autocorrectionType = .no
        self.autocapitalizationType = .none
        
        layer.borderWidth = borderWidth
        layer.borderColor = borderColor
        
        self.leftViewMode = .always
        self.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: self.frame.size.height))
        
        switch fieldType {
        case .email:
            self.placeholder = "e-mail"
            self.keyboardType = .emailAddress
            self.textContentType = .emailAddress
        case .password:
            self.placeholder = "пароль"
            self.textContentType = .oneTimeCode
            self.isSecureTextEntry = true
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
