//
//  AddPhotoViewController.swift
//  Balancy
//
//  Created by  Toropov Oleksandr on 07.12.2023.
//

import UIKit
import SwiftUI

final class AddPhotoViewController: UIViewController {
    
    // MARK: - Properties
    
    private lazy var skipButton: UIButton = {
        let button = UIButton()
        button.setTitle("Пропустити", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "e-Ukraine-Light", size: 12)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logo")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.text = "Додайте фото до Вашого профілю"
        label.font = UIFont(name: "e-Ukraine-Regular", size: 24)
        label.textColor = .white
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var addPhotoButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "addPhotoImage"), for: .normal)
        button.layer.cornerRadius = view.frame.size.height * 0.26 / 2
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var generateCatButton: UIButton = {
        let button = UIButton()
        button.setTitle("Згенерувати котика", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "e-Ukraine-Light", size: 12)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.numberOfPages = 2
        pageControl.currentPage = 0
        pageControl.pageIndicatorTintColor = UIColor(red: 0.17, green: 0.17, blue: 0.18, alpha: 1)
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        return pageControl
    }()
    
    private lazy var nextButton: UIButton = {
        let button = UIButton()
        button.setTitle("Далі", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "e-Ukraine-Medium", size: 16)
        button.backgroundColor = UIColor(red: 0.85, green: 0.2, blue: 0.33, alpha: 1)
        button.layer.cornerRadius = 20
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    // MARK: - UI Configuration
    
    private func configureUI() {
        setBackgroundColor()
        view.addSubview(skipButton)
        view.addSubview(logoImageView)
        view.addSubview(label)
        view.addSubview(pageControl)
        view.addSubview(nextButton)
        view.addSubview(addPhotoButton)
        view.addSubview(generateCatButton)
        setConstraints()
        setupAddPhotoButton()
    }
    
    private func setBackgroundColor() {
        view.backgroundColor = UIColor(red: 0.07, green: 0.07, blue: 0.07, alpha: 1)
    }
}

// MARK: - Constraints

private extension AddPhotoViewController {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            skipButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            skipButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            logoImageView.topAnchor.constraint(equalTo: skipButton.bottomAnchor, constant: 35),
            logoImageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            
            label.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 20),
            label.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            label.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            
            nextButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            nextButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            nextButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            nextButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.06),
            
            addPhotoButton.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 90),
            addPhotoButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            addPhotoButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.26),
            addPhotoButton.widthAnchor.constraint(equalTo: addPhotoButton.heightAnchor),
            
            pageControl.topAnchor.constraint(equalTo: nextButton.topAnchor, constant: -30),
            pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            generateCatButton.topAnchor.constraint(equalTo: addPhotoButton.bottomAnchor, constant: 16),
            generateCatButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            
        ])
    }
}

// MARK: - Preview

struct AddPhotoViewControllerProvider: PreviewProvider {
    static var previews: some View {
        AddPhotoViewController().showPreview()
    }
}
