//
//  MainScreenViewController.swift
//  Balancy
//
//  Created by Tobias on 06.07.2024.
//

import UIKit

final class MainScreenViewController: UIViewController {
    private let headerView: MainScreenTopBar = .init()
    private let tabBar: MainScreenTabBarView = .init()
    
    private var openTab: TabBarItem = .tasks
    private var selectedDate: Date = .now
    
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
    private enum Size {
        static let tabBar: CGFloat = 66
        static let header: CGFloat = 52
    }
    
    private enum Offset {
        static let tabBarBottom: CGFloat = -12
        static let headerTop: CGFloat = 34
        static let headerLeft: CGFloat = 24
        static let headerRight: CGFloat = -10
    }
    
    func setupUI()  {
        view.addSubviews(tabBar, headerView)
        
        setupConstraints()
        setupHeader()
        setupBarActions()
        
        updateOpenTab(.tasks)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: Offset.headerTop),
            headerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: Offset.headerLeft),
            headerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: Offset.headerRight),
            headerView.heightAnchor.constraint(equalToConstant: Size.header),
            
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
    
    func setupHeader() {
        headerView.setDate(selectedDate)
        headerView.configure {
            //TODO: open Search view
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
