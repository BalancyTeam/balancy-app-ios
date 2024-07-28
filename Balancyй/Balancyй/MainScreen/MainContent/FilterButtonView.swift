//
//  FilterButtonView.swift
//  Balancy
//
//  Created by Tobias on 28.07.2024.
//

import UIKit

final class FilterButtonView: UIView {
    private let button: RoundedButtonView = .init(.system)
    private let label: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    private var category: TaskCategory?
    private var onSelect: (() -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }
    
    func updateSelectedType(selected: TaskCategory) {
        self.updateUI(isSelected: selected == category)
    }
    
    func configure(_ category: TaskCategory, selected: TaskCategory, onSelect: @escaping () -> Void) {
        self.category = category
        self.label.text = category.title
        self.onSelect = onSelect
        self.updateUI()
    }
}

private extension FilterButtonView {
    enum Offset {
        static let textHorizontal: CGFloat = 20
        static let textVertical: CGFloat = 12
    }
    
    func setupUI() {
        addSubviews(button, label)
        setupConstraints()
        mapButton(button) { [weak self] in
            self?.onSelect?()
        }
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            button.bottomAnchor.constraint(equalTo: bottomAnchor),
            button.topAnchor.constraint(equalTo: topAnchor),
            button.leadingAnchor.constraint(equalTo: leadingAnchor),
            button.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            label.bottomAnchor.constraint(equalTo: button.bottomAnchor, constant: -Offset.textVertical),
            label.topAnchor.constraint(equalTo: button.topAnchor, constant: Offset.textVertical),
            label.leadingAnchor.constraint(equalTo: button.leadingAnchor, constant: Offset.textHorizontal),
            label.trailingAnchor.constraint(equalTo: button.trailingAnchor, constant: -Offset.textHorizontal),
        ])
    }
    
    func updateUI(isSelected: Bool = false) {
        button.backgroundColor = isSelected ? AppColor.button : .gray
        label.font = UIFont(name: isSelected ? FontName.medium : FontName.light, size: 14)
    }
}


import SwiftUI

#Preview {
    let button = FilterButtonView()
    button.configure(.all, selected: .all) {
        
    }
   return button.preview
}
