//
//  MainScreenContentView.swift
//  Balancy
//
//  Created by Tobias on 28.07.2024.
//

import UIKit

final class MainScreenContentView: UIView {
    private let filterView: MainScreenFilterView = .init()
    private let emptyContentView: MainScreenNoTasksView = .init()
    
    private var taskType: TaskCategory = .all
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }
}

//MARK: - Setup UI
private extension MainScreenContentView {
    enum Offset {
        static let filterVertical: CGFloat = 30
        static let emptyHorizontal: CGFloat = 24
    }
    
    enum Size {
        static let filterHeight: CGFloat = 42
    }
    
    func setupUI() {
        filterView.configure(taskType) { [weak self] newType in
            self?.taskType = newType
            self?.filterView.setSelected(newType)
        }
        
        addSubviews(filterView, emptyContentView)
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            filterView.topAnchor.constraint(equalTo: topAnchor, constant: Offset.filterVertical),
            filterView.leadingAnchor.constraint(equalTo: leadingAnchor),
            filterView.trailingAnchor.constraint(equalTo: trailingAnchor),
            filterView.heightAnchor.constraint(equalToConstant: Size.filterHeight),
            
            emptyContentView.topAnchor.constraint(equalTo: filterView.bottomAnchor, constant: Offset.filterVertical),
            emptyContentView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Offset.emptyHorizontal),
            emptyContentView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Offset.emptyHorizontal),
            emptyContentView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}


import SwiftUI

#Preview {
    MainScreenContentView().preview
}
