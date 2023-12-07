//
//  AddPhotoViewController.swift
//  Balancy
//
//  Created by  Toropov Oleksandr on 07.12.2023.
//

import UIKit

final class AddPhotoViewController: UIViewController {
    
    // MARK: - Properties
    
    private let logoImageView: UIImageView = {
        let imageView = UIImageView()
        guard  let logoImage = UIImage(named: "logo") else { return imageView }
        imageView.image = logoImage
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.text = "Додайте фото до Вашого профілю"
        label.font = UIFont(name: "e-Ukraine-Regular", size: 24)
        label.textColor = .white
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let addPhotoButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 112
        button.backgroundColor = UIColor(red: 0.11, green: 0.11, blue: 0.12, alpha: 1)
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let generateCatButton: UIButton = {
        let button = UIButton()
        button.setTitle("Згенерувати котика", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "e-Ukraine-Light", size: 12)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.numberOfPages = 2
        pageControl.currentPage = 0
        pageControl.pageIndicatorTintColor = UIColor(red: 0.17, green: 0.17, blue: 0.18, alpha: 1)
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        return pageControl
    }()
    
    private let nextButton: UIButton = {
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
    
    func configureUI() {
        setBackgroundColor()
        view.addSubview(logoImageView)
        view.addSubview(label)
        view.addSubview(pageControl)
        view.addSubview(nextButton)
        view.addSubview(addPhotoButton)
        view.addSubview(generateCatButton)
        setConstraints()   
    }
    
    func setBackgroundColor() {
        view.backgroundColor = UIColor(red: 0.07, green: 0.07, blue: 0.07, alpha: 1)
    }
}
        
// MARK: - Constraints
    
extension AddPhotoViewController {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            logoImageView.heightAnchor.constraint(equalToConstant: 64),
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 94),
            logoImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            logoImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -323),
            
            label.heightAnchor.constraint(equalToConstant: 68),
            label.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 24),
            label.leadingAnchor.constraint(equalTo: logoImageView.leadingAnchor),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -86),
            
            addPhotoButton.heightAnchor.constraint(equalToConstant: 224),
            addPhotoButton.widthAnchor.constraint(equalTo: addPhotoButton.heightAnchor),
            addPhotoButton.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 54),
            addPhotoButton.leadingAnchor.constraint(equalTo: label.leadingAnchor, constant: 54),
            
            generateCatButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            generateCatButton.topAnchor.constraint(equalTo: addPhotoButton.bottomAnchor, constant: 45),
                        
            nextButton.heightAnchor.constraint(equalToConstant: 50),
            nextButton.leadingAnchor.constraint(equalTo: label.leadingAnchor),
            nextButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -34),
            nextButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -27),
            
            pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pageControl.bottomAnchor.constraint(equalTo: nextButton.topAnchor, constant: -11)
        ])
    }
}


