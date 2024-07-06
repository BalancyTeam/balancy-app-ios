//
//  MainScreenViewController.swift
//  Balancy
//
//  Created by Tobias on 06.07.2024.
//

import UIKit
import SwiftUI

final class MainScreenViewController: UIViewController {
    private let tabBar: MainScreenTabBarView = {
        let bar = MainScreenTabBarView()
        return bar
    }()
    
    private var openTab: MainTabType = .tasks
    
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
    func setupUI() {
        view.addSubviews(tabBar)
        updateOpenTab(.tasks)
        
        setupConstraints()
        setupBarActions()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            tabBar.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -12),
            tabBar.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tabBar.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tabBar.heightAnchor.constraint(equalToConstant: 66),
        ])
    }
    
    func setupBarActions() {
        tabBar.configureButtonActions {
            print("Open AddingTaskViewController")
        } openTasksAction: { [weak self] in
            self?.updateOpenTab(.tasks)
        } openProfileAction: { [weak self] in
            self?.updateOpenTab(.profile)
        }
    }
    
    func updateOpenTab(_ tab: MainTabType) {
        openTab = tab
        tabBar.updateTabBarButtons(with: openTab)
    }
}

//MARK: - Preview
#Preview {
    MainScreenViewController.preview
}
