//
//  CustomButton.swift
//  Balancy
//
//  Created by sofia on 21.12.2023.
//

import UIKit

final class CustomButton: UIButton {
    
//    let buttonText: String
    private let button: UIButton = {
        let button = UIButton()
        button.setTitle("Увійти", for: .normal)
        button.backgroundColor = .systemBlue
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        button.layer.cornerRadius = 10
        //    button.setImage(UIImage(systemName: "plus"), for: .normal)?.withTintColor(.white, renderingMode: .alwaysOriginal), for: .normal)
        return button
    }()

    
//    init(button text: String) {
//        self.layer.cornerRadius = 20
//    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
