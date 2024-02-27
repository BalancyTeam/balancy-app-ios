//
//  AddPhotoViewController.swift
//  Balancy
//
//  Created by  Toropov Oleksandr on 07.12.2023.
//

// TODO: Implement randomImageButtonTapped method
// TODO: Implement custom view for picking image
// TODO: Change nextButton color depending on users' choice

import UIKit
import SwiftUI

final class AddPhotoViewController: UIViewController {
    
    // Properties
    
    private let profilePhotoManager = ProfilePhotoManager()
    
    private var selectedImageName: String?
    
    // UI
    
    private let skipButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: FontName.light, size: 12)
        return button
    }()
    
    private let logoImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private let addPhotoLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: FontName.regular, size: 24)
        label.textColor = .white
        label.numberOfLines = 0
        return label
    }()
    
    lazy var addPhotoButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = view.frame.size.height * 0.14
        button.layer.masksToBounds = true
        return button
    }()
    
    private let generateRandomImageButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: FontName.light, size: 12)
        return button
    }()
    
    private let pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.numberOfPages = 2
        pageControl.pageIndicatorTintColor = AppColor.pageIndicatorTintColor
        pageControl.isUserInteractionEnabled = false
        return pageControl
    }()
    
    let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: FontName.medium, size: 16)
        button.backgroundColor = AppColor.button
        button.layer.cornerRadius = 20
        button.clipsToBounds = true
        button.setDisabled()
        return button
    }()
    
    // Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        populateWithData()
    }
    
    // UI Configuration
    
    private func configureUI() {
        view.backgroundColor = AppColor.background
        view.addSubview(skipButton)
        view.addSubview(logoImageView)
        view.addSubview(addPhotoLabel)
        view.addSubview(pageControl)
        view.addSubview(nextButton)
        view.addSubview(addPhotoButton)
        view.addSubview(generateRandomImageButton)
        setConstraints()
        setupAddPhotoButton()
        setupNextButton()
        setupSkipButton()
    }
    
    private func populateWithData() {
        skipButton.setTitle(Localized.skipButton.localizedString, for: .normal)
        
        logoImageView.image = UIImage(named: ImageName.logo)
        
        addPhotoLabel.text = Localized.addPhotoLabel.localizedString
        
        addPhotoButton.setImage(UIImage(named: ImageName.addPhoto), for: .normal)
        
        generateRandomImageButton.setTitle(Localized.generateRandomImageButton.localizedString, for: .normal)
        
        nextButton.setTitle(Localized.nextButton.localizedString, for: .normal)
    }
    
    private func randomImageButtonTapped() {
    }
    
    private func presentCategoryBalanceViewController() {
        let categoryBalanceViewController = CategoryBalanceViewController()
        categoryBalanceViewController.modalPresentationStyle = .fullScreen
        present(categoryBalanceViewController, animated: true)
    }
    
    private func nextButtonTapped() {
        guard let selectedImageName = selectedImageName, let selectedImage = addPhotoButton.currentImage else { return }
        
        profilePhotoManager.save(selectedImageName, selectedImage)
        
        presentCategoryBalanceViewController()
    }
    
    private func setupNextButton() {
        let action = UIAction { [weak self] _ in
            self?.nextButtonTapped()
        }
        
        nextButton.addAction(action, for: .touchUpInside)
    }
    
    private func skipButtonTapped() {
        presentCategoryBalanceViewController()
    }
    
    private func setupSkipButton() {
        let action = UIAction { [weak self] _ in
            self?.skipButtonTapped()
        }
        skipButton.addAction(action, for: .touchUpInside)
    }
    
    func setSelectedImageName(_ imageName: String) {
        selectedImageName = imageName
    }
}

// Constraints

private extension AddPhotoViewController {
    
    private func setConstraints() {
        [skipButton, logoImageView, addPhotoLabel, pageControl, nextButton, addPhotoButton, generateRandomImageButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            skipButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            skipButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            logoImageView.topAnchor.constraint(greaterThanOrEqualTo: skipButton.bottomAnchor, constant: 20),
            logoImageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            
            addPhotoLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 20),
            addPhotoLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            addPhotoLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            nextButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            nextButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            nextButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            nextButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.06),
            
            addPhotoButton.topAnchor.constraint(equalTo: addPhotoLabel.bottomAnchor, constant: 45),
            addPhotoButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            addPhotoButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.28),
            addPhotoButton.widthAnchor.constraint(equalTo: addPhotoButton.heightAnchor),
            
            pageControl.topAnchor.constraint(equalTo: nextButton.topAnchor, constant: -30),
            pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            generateRandomImageButton.topAnchor.constraint(equalTo: addPhotoButton.bottomAnchor, constant: 30),
            generateRandomImageButton.bottomAnchor.constraint(equalTo: pageControl.topAnchor, constant: -45),
            generateRandomImageButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            
        ])
    }
}

// Preview

#Preview {
    AddPhotoViewController.preview
}
