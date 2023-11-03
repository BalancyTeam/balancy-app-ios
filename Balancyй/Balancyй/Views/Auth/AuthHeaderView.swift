//
//  AuthHeaderView.swift
//  Balancy
//
//  Created by sofia on 16.10.2023.
//

import UIKit

final class AuthHeaderView: UIView {

//    MARK: - UI Components
//    animation or image wil be here later
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(named: "#FFFFFF")
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.text = "Error"
        return label
    }()
    
    private let subTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(named: "#A1A1A1")
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 14 , weight: .regular)
        label.text = "Error"
        return label
    }()
    
    
//    MARK: - LifeCycle
    init(title: String,
         subTitle: String) {
        super.init(frame: .zero)
        self.titleLabel.text = title
        self.subTitleLabel.text = subTitle
        self.setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    MARK: - UI Setup
    private func setupUI() {
        self.addSubview(titleLabel)
        self.addSubview(subTitleLabel)
        
//        Enables access to using autolayout
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        subTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([

          titleLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 240),
          titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
          titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),

          subTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
          subTitleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
          subTitleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),

        ])
    }
}
