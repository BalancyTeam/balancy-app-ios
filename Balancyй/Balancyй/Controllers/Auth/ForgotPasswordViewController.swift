//
//  ForgotPasswordViewController.swift
//  Balancy
//
//  Created by sofia on 22.09.2023.
//

import UIKit

final class ForgotPasswordViewController: UIViewController {
    
    private let headerView = AuthHeaderView(title: "Забули пароль?", subTitle: "Не хвилюйся, ми відправимо новий на пошту")
    private let emailField = CustomTextField(fieldType: .email)

//     MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
//    MARK: - UI Setup
    private func setupUI() {
        
        self.view.addSubview(headerView)
        
        headerView.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            
            self.headerView.topAnchor.constraint(equalTo: self.view.layoutMarginsGuide.topAnchor),
            self.headerView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.headerView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.headerView.heightAnchor.constraint(equalToConstant: 370),

        ])
    }
}
