//
//  MainScreenViewController.swift
//  Balancy
//
//  Created by Tobias on 06.07.2024.
//

import UIKit

final class MainScreenViewController: UIViewController {
    private let tabBar: MainScreenTabBarView = .init()
    private let taskTab: MainScreenContentView = .init()
    private var openTab: TabBarItem = .tasks
    
    init() {
        super.init(nibName: nil, bundle: nil)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - UI Setup
private extension MainScreenViewController {
    enum Size {
        static let tabBar: CGFloat = 66
    }
    
    enum Offset {
        static let tabBarBottom: CGFloat = -12
        static let contentTop: CGFloat = 238
        static let contentBottom: CGFloat = 68
    }
    
    func setupUI() {
        view.addSubviews(tabBar, taskTab)
        updateOpenTab(.tasks)
        
        setupConstraints()
        setupBarActions()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            taskTab.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: Offset.contentTop),
            taskTab.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            taskTab.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            taskTab.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -Offset.contentBottom),
            
            tabBar.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: Offset.tabBarBottom),
            tabBar.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tabBar.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tabBar.heightAnchor.constraint(equalToConstant: Size.tabBar),
        ])
    }
    
    func setupBarActions() {
        tabBar.configureButtonActions {
            //TODO: Open AddingTaskViewController
        } openTasksAction: { [weak self] in
            self?.updateOpenTab(.tasks)
        } openProfileAction: { [weak self] in
            self?.updateOpenTab(.profile)
        }
    }
    
    func updateOpenTab(_ tab: TabBarItem) {
        openTab = tab
        tabBar.updateStyle(forState: openTab)
    }
}

//MARK: - Preview
import SwiftUI

#Preview {
    MainScreenViewController.preview
}
