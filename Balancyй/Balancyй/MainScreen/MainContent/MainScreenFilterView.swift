//
//  MainScreenFilterView.swift
//  Balancy
//
//  Created by Tobias on 28.07.2024.
//

import UIKit

final class MainScreenFilterView: UIView {
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.isScrollEnabled = true
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        return scrollView
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .equalSpacing
        stackView.spacing = 12
        return stackView
    }()
    
    private var buttons: [FilterButtonView] = []
    private var selected: TaskCategory = .all
    private var onSelectCategory: ((TaskCategory) -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }
    
    func setSelected(_ selected: TaskCategory) {
        self.updateSelected(type: selected)
    }
    
    func configure(_ startType: TaskCategory, onClick: @escaping (TaskCategory) -> Void) {
        self.onSelectCategory = onClick
        self.updateSelected(type: startType)
    }
}

//MARK: - Setup UI
private extension MainScreenFilterView {
    enum Offset {
        static let stackSpacing: CGFloat = 12
        static let contentHotizontal: CGFloat = 24
    }
    
    func setupUI() {
        addSubviews(scrollView)
        scrollView.addSubviews(stackView)
        
        setupConstraints()
        createButtons()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            stackView.heightAnchor.constraint(equalTo: scrollView.heightAnchor)
        ])
    }
    
    func createButtons() {
        let leftSpacer: UIView = .createSpacer(width: Offset.contentHotizontal)
        stackView.addArrangedSubview(leftSpacer)
        
        TaskCategory.allCases.forEach { type in
            let button = FilterButtonView()
            button.configure(type, selected: selected) { [weak self] in
                self?.updateSelected(type: type)
            }
            self.buttons.append(button)
            stackView.addArrangedSubview(button)
        }
        
        let rightSpacer: UIView = .createSpacer(width: Offset.contentHotizontal)
        stackView.addArrangedSubview(rightSpacer)
    }
    
    func updateSelected(type: TaskCategory) {
        self.selected = type
        buttons.forEach {
            $0.updateSelectedType(selected: type)
        }
    }
}


import SwiftUI

#Preview {
    var taskType: TaskCategory = .work
    let filterView = MainScreenFilterView()
    filterView.configure(taskType) { type in
        taskType = type
        filterView.setSelected(type)
    }
    
    return filterView.preview
        .frame(height: 42)
}
