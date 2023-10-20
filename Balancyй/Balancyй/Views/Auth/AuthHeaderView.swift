//
//  AuthHeaderView.swift
//  Balancy
//
//  Created by sofia on 16.10.2023.
//

import UIKit

class AuthHeaderView: UIView {

//    MARK: - UI Components
//    animation or image wil be here later
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 26, weight: .bold)
        label.text = "Error"
        return label
    }()
    
    private let subTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .secondaryLabel
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 18 , weight: .regular)
        label.text = "Error"
        return label
    }()
    
    
//    MARK: - LifeCycle
    init(title: String, subTitle: String) {
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
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        subTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
//        NSLayoutConstraint.activate([
//            <#Constraints#>
//        ])

    }
}
