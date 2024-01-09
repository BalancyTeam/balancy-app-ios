//
//  AddPhotoViewController.swift
//  Balancy
//
//  Created by  Toropov Oleksandr on 07.12.2023.
//

// TODO: - Implement randomImageButtonTapped method

import UIKit
import SwiftUI

final class AddPhotoViewController: UIViewController {
    
    // Properties
    
    private let profilePhotoManager = ProfilePhotoManager()
    
    var selectedImageName: String?
    
    var isImageSet = false
    
    // UI
    
    private lazy var skipButton: UIButton = {
        let button = UIButton()
        button.setTitle("Пропустити", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: FontName.light, size: 12)
        return button
    }()
    
    private let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: ImageName.logo)
        return imageView
    }()
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.text = "Додайте фото до Вашого профілю"
        label.font = UIFont(name: FontName.regular, size: 24)
        label.textColor = .white
        label.numberOfLines = 0
        return label
    }()
    
    lazy var addPhotoButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: ImageName.addPhoto), for: .normal)
        button.layer.cornerRadius = view.frame.size.height * 0.14
        button.layer.masksToBounds = true
        return button
    }()
    
    private lazy var generateCatButton: UIButton = {
        let button = UIButton()
        button.setTitle("Згенерувати котика", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: FontName.light, size: 12)
        return button
    }()
    
    private lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.numberOfPages = 2
        pageControl.currentPage = 0
        pageControl.pageIndicatorTintColor = AppColor.pageIndicatorTintColor
        pageControl.isUserInteractionEnabled = false
        return pageControl
    }()
    
    private lazy var nextButton: UIButton = {
        let button = UIButton()
        button.setTitle("Далі", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: FontName.medium, size: 16)
        button.backgroundColor = AppColor.button
        button.layer.cornerRadius = 20
        button.clipsToBounds = true
        return button
    }()
    
    // Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    // UI Configuration
    
    private func configureUI() {
        view.backgroundColor = AppColor.background
        view.addSubview(skipButton)
        view.addSubview(logoImageView)
        view.addSubview(label)
        view.addSubview(pageControl)
        view.addSubview(nextButton)
        view.addSubview(addPhotoButton)
        view.addSubview(generateCatButton)
        setConstraints()
        setupAddPhotoButton()
        setupNextButton()
        setupSkipButton()
    }
    
    private func randomImageButtonTapped() {
        isImageSet = true
    }
    
    private func presentCategoryBalanceViewController() {
        let categoryBalanceViewController = CategoryBalanceViewController()
        categoryBalanceViewController.modalPresentationStyle = .fullScreen
        present(categoryBalanceViewController, animated: true)
    }
    
    private func nextButtonTapped() {
        guard let selectedImageName = selectedImageName else { return }
        guard let selectedImage = addPhotoButton.currentImage else { return }
        
        if !isImageSet {
            nextButton.isEnabled = false
        } else {
            nextButton.isEnabled = true
            profilePhotoManager.saveImageToFileManager(selectedImageName, selectedImage)
        }
        
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
}

// Constraints

private extension AddPhotoViewController {
    
    private func setConstraints() {
        [skipButton, logoImageView, label, pageControl, nextButton, addPhotoButton, generateCatButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            skipButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            skipButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            logoImageView.topAnchor.constraint(greaterThanOrEqualTo: skipButton.bottomAnchor, constant: 20),
            logoImageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            
            label.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 20),
            label.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            label.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            nextButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            nextButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            nextButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            nextButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.06),
            
            addPhotoButton.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 45),
            addPhotoButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            addPhotoButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.28),
            addPhotoButton.widthAnchor.constraint(equalTo: addPhotoButton.heightAnchor),
            
            pageControl.topAnchor.constraint(equalTo: nextButton.topAnchor, constant: -30),
            pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            generateCatButton.topAnchor.constraint(equalTo: addPhotoButton.bottomAnchor, constant: 30),
            generateCatButton.bottomAnchor.constraint(equalTo: pageControl.topAnchor, constant: -45),
            generateCatButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            
        ])
    }
}

// Preview

#Preview {
    AddPhotoViewController.preview
}
