//
//  MainScreenViewController.swift
//  Balancy
//
//  Created by Tobias on 06.07.2024.
//

import UIKit

final class MainScreenViewController: UIViewController {
    private let headerView: MainScreenTopBar = .init()
    
    init() {
         super.init(nibName: nil, bundle: nil)

         setupUI()
     }

     required init?(coder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
     }
}

private extension MainScreenViewController {
    private enum Size {
        static let header: CGFloat = 52
    }
    
    private enum Offset {
        static let headerTop: CGFloat = 34
        static let headerLeft: CGFloat = 24
        static let headerRight: CGFloat = -10
    }
    
    func setupUI()  {
        view.addSubviews(headerView)
        
        setupConstraints()
        setupHeader()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: Offset.headerTop),
            headerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: Offset.headerLeft),
            headerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: Offset.headerRight),
            headerView.heightAnchor.constraint(equalToConstant: Size.header),
        ])
    }
    
    func setupHeader() {
        headerView.setDate(.now)
        headerView.configure {
            //TODO: open Search view
        }
    }
}
