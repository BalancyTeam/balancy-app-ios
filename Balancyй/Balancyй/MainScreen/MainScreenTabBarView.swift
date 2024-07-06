//
//  MainScreenTabBarView.swift
//  Balancy
//
//  Created by Tobias on 06.07.2024.
//

import UIKit
import SwiftUI

final class MainScreenTabBarView: UIView {
    private let secondaryButtonSize: CGFloat = 48.0
    private let secondaryImageSize: CGFloat = 24.0
    
    private let barStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .bottom
        stack.distribution = .equalCentering
        
        return stack
    }()
    
    private let tasksButton: UIButton = .init(type: .system)
    private let profileButton: UIButton = .init(type: .system)
    
    private let addButton: RoundedButtonView = {
        let button = RoundedButtonView(.system)
        button.backgroundColor = AppColor.button
        
        return button
    }()
    
    private let profileButtonImage: UIImageView = {
        let imageView = UIImageView()
        let image = UIImage(named: ImageName.profile)
        imageView.image = image?.withRenderingMode(.alwaysTemplate)
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    private let addButtonImage: UIImageView = {
        let imageView = UIImageView()
        let image = UIImage(named: ImageName.addButton)
        imageView.image = image?.withRenderingMode(.alwaysTemplate)
        imageView.tintColor = .white
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    private let tasksButtonImage: UIImageView = {
        let imageView = UIImageView()
        let image = UIImage(named: ImageName.tasks)
        imageView.image = image?.withRenderingMode(.alwaysTemplate)
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    private var onAdd: (() -> Void)?
    private var onOpenTasks: (() -> Void)?
    private var onOpenProfile: (() -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }
    
    func configureButtonActions(addAction: @escaping () -> Void, openTasksAction: @escaping () -> Void, openProfileAction: @escaping () -> Void) {
        self.onAdd = addAction
        self.onOpenTasks = openTasksAction
        self.onOpenProfile = openProfileAction
    }
    
    func updateTabBarButtons(with state: MainTabType) {
        tasksButtonImage.tintColor = state == .tasks ? AppColor.tabBarSelected : AppColor.tabBarDeselected
        profileButtonImage.tintColor = state == .profile ? AppColor.tabBarSelected : AppColor.tabBarDeselected
    }
}

//MARK: - Setup UI
private extension MainScreenTabBarView {
    func setupUI() {
        backgroundColor = .clear
        addSubviews(barStack)
        
        setupBarStack()
        setupConstraints()
        
        setupButtonActions()
    }
    
    func setupBarStack() {
        tasksButton.translatesAutoresizingMaskIntoConstraints = false
        addButton.translatesAutoresizingMaskIntoConstraints = false
        profileButton.translatesAutoresizingMaskIntoConstraints = false
        
        barStack.addArrangedSubview(tasksButton)
        barStack.addArrangedSubview(addButton)
        barStack.addArrangedSubview(profileButton)
        
        profileButton.addSubview(profileButtonImage, applyConstraints: false)
        addButton.addSubview(addButtonImage, applyConstraints: false)
        tasksButton.addSubview(tasksButtonImage, applyConstraints: false)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            barStack.centerXAnchor.constraint(equalTo: centerXAnchor),
            barStack.widthAnchor.constraint(equalToConstant: 254),
            barStack.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            addButton.widthAnchor.constraint(equalToConstant: 66),
            addButton.heightAnchor.constraint(equalToConstant: 66),
            addButtonImage.centerXAnchor.constraint(equalTo: addButton.centerXAnchor),
            addButtonImage.centerYAnchor.constraint(equalTo: addButton.centerYAnchor),
            addButtonImage.heightAnchor.constraint(equalToConstant: 36),
            addButtonImage.widthAnchor.constraint(equalToConstant: 36),
            
            tasksButton.widthAnchor.constraint(equalToConstant: secondaryButtonSize),
            tasksButton.heightAnchor.constraint(equalToConstant: secondaryButtonSize),
            tasksButtonImage.centerXAnchor.constraint(equalTo: tasksButton.centerXAnchor),
            tasksButtonImage.centerYAnchor.constraint(equalTo: tasksButton.centerYAnchor),
            tasksButtonImage.heightAnchor.constraint(equalToConstant: secondaryImageSize),
            tasksButtonImage.widthAnchor.constraint(equalToConstant: secondaryImageSize),
            
            profileButton.widthAnchor.constraint(equalToConstant: secondaryButtonSize),
            profileButton.heightAnchor.constraint(equalToConstant: secondaryButtonSize),
            
            profileButtonImage.centerXAnchor.constraint(equalTo: profileButton.centerXAnchor),
            profileButtonImage.centerYAnchor.constraint(equalTo: profileButton.centerYAnchor),
            profileButtonImage.heightAnchor.constraint(equalToConstant: secondaryImageSize),
            profileButtonImage.widthAnchor.constraint(equalToConstant: secondaryImageSize),
        ])
    }
    
    func setupButtonActions() {
        mapButton(addButton) { [weak self] in
            self?.onAdd?()
        }
        
        mapButton(tasksButton) { [weak self] in
            self?.onOpenTasks?()
        }
        
        mapButton(profileButton) { [weak self] in
            self?.onOpenProfile?()
        }
    }
}

//MARK: - Preview
#Preview {
    let bar = MainScreenTabBarView()
    bar.updateTabBarButtons(with: .tasks)
    
    return bar.preview
}
