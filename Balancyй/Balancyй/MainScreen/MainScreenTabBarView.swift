//
//  MainScreenTabBarView.swift
//  Balancy
//
//  Created by Tobias on 06.07.2024.
//

import UIKit

final class MainScreenTabBarView: UIView {
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
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let addButtonImage: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .white
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let tasksButtonImage: UIImageView = {
        let imageView = UIImageView()
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
    
    func updateStyle(forState state: TabBarItem) {
        tasksButtonImage.tintColor = state == .tasks ? AppColor.tabBarSelected : AppColor.tabBarDeselected
        profileButtonImage.tintColor = state == .profile ? AppColor.tabBarSelected : AppColor.tabBarDeselected
    }
}

//MARK: - Setup UI
private extension MainScreenTabBarView {
    private enum Size {
        static let bar: CGFloat = 254
        static let addButton: CGFloat = 66
        static let addButtonImage: CGFloat = 36
        static let secondaryButtonSize: CGFloat = 48.0
        static let secondaryImageSize: CGFloat = 24.0
    }
    
    func setupUI() {
        backgroundColor = .clear
        addSubviews(barStack)
        
        setupBarStack()
        setupConstraints()
        
        setupButtonActions()
        setupButtonsImages()
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
            barStack.widthAnchor.constraint(equalToConstant: Size.bar),
            barStack.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            addButton.widthAnchor.constraint(equalToConstant: Size.addButton),
            addButton.heightAnchor.constraint(equalToConstant: Size.addButton),
            addButtonImage.centerXAnchor.constraint(equalTo: addButton.centerXAnchor),
            addButtonImage.centerYAnchor.constraint(equalTo: addButton.centerYAnchor),
            addButtonImage.heightAnchor.constraint(equalToConstant: Size.addButtonImage),
            addButtonImage.widthAnchor.constraint(equalToConstant: Size.addButtonImage),
            
            tasksButton.widthAnchor.constraint(equalToConstant: Size.secondaryButtonSize),
            tasksButton.heightAnchor.constraint(equalToConstant: Size.secondaryButtonSize),
            tasksButtonImage.centerXAnchor.constraint(equalTo: tasksButton.centerXAnchor),
            tasksButtonImage.centerYAnchor.constraint(equalTo: tasksButton.centerYAnchor),
            tasksButtonImage.heightAnchor.constraint(equalToConstant: Size.secondaryImageSize),
            tasksButtonImage.widthAnchor.constraint(equalToConstant: Size.secondaryImageSize),
            
            profileButton.widthAnchor.constraint(equalToConstant: Size.secondaryButtonSize),
            profileButton.heightAnchor.constraint(equalToConstant: Size.secondaryButtonSize),
            profileButtonImage.centerXAnchor.constraint(equalTo: profileButton.centerXAnchor),
            profileButtonImage.centerYAnchor.constraint(equalTo: profileButton.centerYAnchor),
            profileButtonImage.heightAnchor.constraint(equalToConstant: Size.secondaryImageSize),
            profileButtonImage.widthAnchor.constraint(equalToConstant: Size.secondaryImageSize),
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
    
    func setupButtonsImages() {
        let taskImage = UIImage(named: ImageName.tasks)
        tasksButtonImage.image = taskImage?.withRenderingMode(.alwaysTemplate)
        
        let profileImage = UIImage(named: ImageName.profile)
        profileButtonImage.image = profileImage?.withRenderingMode(.alwaysTemplate)
        
        let addImage = UIImage(named: ImageName.addButton)
        addButtonImage.image = addImage?.withRenderingMode(.alwaysTemplate)
    }
}

//MARK: - Preview
import SwiftUI

#Preview {
    let bar = MainScreenTabBarView()
    bar.updateStyle(forState: .tasks)
    
    return bar.preview
}
