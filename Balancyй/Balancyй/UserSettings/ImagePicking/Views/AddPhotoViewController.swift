//
//  AddPhotoViewController.swift
//  Balancy
//
//  Created by  Toropov Oleksandr on 07.12.2023.
//

// TODO: Implement custom view for picking image
// TODO: Change nextButton color depending on users' choice

import UIKit
import SwiftUI
import PhotosUI
import Combine

final class AddPhotoViewController: BaseImageSelectionViewController {
    
    // Properties
    
    private let profilePhotoManager = ProfilePhotoManager()
    private var cancellables: Set<AnyCancellable> = []
    
    // UI
    
    private let skipButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitleColor(AppColor.textWhite, for: .normal)
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
        label.textColor = AppColor.textWhite
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
        button.setTitleColor(AppColor.textWhite, for: .normal)
        button.titleLabel?.font = UIFont(name: FontName.light, size: 12)
        return button
    }()
    
    private let pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.numberOfPages = 2
        pageControl.isUserInteractionEnabled = false
        return pageControl
    }()
    
    let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitleColor(AppColor.textWhite, for: .normal)
        button.titleLabel?.font = UIFont(name: FontName.medium, size: 16)
        button.backgroundColor = AppColor.accentMagenta
        button.layer.cornerRadius = 20
        button.clipsToBounds = true
        button.setDisabled()
        return button
    }()
    
    // Lifecycle
    override init(verificationService: ProfileVerificationService = .init(), imageLoader: LoaderService = ImageLoaderService())  {
        super.init(verificationService: verificationService, imageLoader: imageLoader)
        subscribeOnSelectionImage()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        populateWithData()
    }
    
    // UI Configuration
    
    private func configureUI() {
        view.backgroundColor = AppColor.backgroundDefault
        view.addSubviews(skipButton, logoImageView, addPhotoLabel, pageControl, nextButton, addPhotoButton, generateRandomImageButton)
        setConstraints()
        setupAddPhotoButton()
        setupNextButton()
        setupSkipButton()
        setupGenerateButton()
    }
    
    private func populateWithData() {
        skipButton.setTitle(Localized.skipButton.localizedString, for: .normal)
        
        logoImageView.image = UIImage(named: ImageName.logo)
        
        addPhotoLabel.text = Localized.addPhotoLabel.localizedString
        
        addPhotoButton.setImage(UIImage(named: ImageName.addPhoto), for: .normal)
        
        generateRandomImageButton.setTitle(Localized.generateRandomImageButton.localizedString, for: .normal)
        
        nextButton.setTitle(Localized.nextButton.localizedString, for: .normal)
    }

    private func presentCategoryBalanceViewController() {
        let categoryBalanceViewController = CategoryBalanceViewController()
        categoryBalanceViewController.modalPresentationStyle = .fullScreen
        present(categoryBalanceViewController, animated: true)
    }
    
    private func nextButtonTapped() {
        guard let selectedImageName = verificationService.imageName, let selectedImage = addPhotoButton.currentImage else { return }
        
        profilePhotoManager.save(selectedImageName, selectedImage)
        
        presentCategoryBalanceViewController()
    }
    
    private func setupNextButton() {
        mapButton(nextButton) { [weak self]  in
            self?.nextButtonTapped()
        }
    }
    
    private func setupAddPhotoButton() {
        mapButton(addPhotoButton) { [weak self] in
            self?.openPhotoPicker()
        }
    }
    
    private func setupGenerateButton() {
        mapButton(generateRandomImageButton) { [weak self] in
            self?.generateAvatar()
        }
    }
    
    private func skipButtonTapped() {
        presentCategoryBalanceViewController()
    }
    
    private func setupSkipButton() {
        mapButton(skipButton) { [weak self] in
            self?.skipButtonTapped()
        }
    }
    
    override func verifyImage(_ image: PHPickerResult) {
        if verificationService.isValidImage(image) {
            verificationService.setSelectedImage(image)
        } else {
            handleUnverifiedImage()
        }
    }
    
    private func handleUnverifiedImage() {
        let pickerErrorViewController = AvatarPickerErrorViewController(verificationService: verificationService)
        pickerErrorViewController.modalPresentationStyle = .overCurrentContext
        present(pickerErrorViewController, animated: true)
    }
}

private extension AddPhotoViewController {
    func subscribeOnSelectionImage() {
        verificationService.$selectedImage
            .compactMap { $0 }
            .sink { [weak self] result in
                self?.setImage(result)
            }
            .store(in: &cancellables)
    }
    
    func setImage(_ selectedImage: PHPickerResult) {
        selectedImage.itemProvider.loadObject(ofClass: UIImage.self) { [weak self] (image, _) in
            guard let image = image as? UIImage else { return }
            DispatchQueue.main.async {
                self?.addPhotoButton.setImage(image, for: .normal)
                self?.nextButton.setEnabled()
            }
        }
    }
}

// Constraints

private extension AddPhotoViewController {
    
    private func setConstraints() {
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
