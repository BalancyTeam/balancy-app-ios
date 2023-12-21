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
    private let padding = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    
    override public func textRect(forBounds bounds: CGRect) -> CGRect {
      return bounds.inset(by: padding)
    }

    override public func placeholderRect(forBounds bounds: CGRect) -> CGRect {
      return bounds.inset(by: padding)
    }

    override public func editingRect(forBounds bounds: CGRect) -> CGRect {
      return bounds.inset(by: padding)
    }
    
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
        
        switch fieldType {
        case .email:
            self.placeholder = "e-mail"
        case .password:
            self.placeholder = "пароль"
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
