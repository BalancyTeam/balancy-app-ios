import Foundation
import PhotosUI
import UIKit
import SwiftUI

final class AvatarPickerErrorViewController: BaseImageSelectionViewController {
    private let contentHorizontalPadding: CGFloat = 24
    private let errorHorizontalPadding: CGFloat = 52
    private let contentHeight: CGFloat = 50
    
    private let containerView: UIView = {
        var backgroundView = UIView()
        backgroundView.backgroundColor = AppColor.backgroundPrimary
        backgroundView.setCornerRadius(28)
        backgroundView.setShadow(
            radius: 20,
            color:  UIColor(red: 0, green: 0, blue: 0, alpha: 0.2),
            opacity: 1
        )
        
        return backgroundView
    }()
    
    private let imageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: ImageName.loadErrorImage)
        return image
    }()
    
    private let errorTextLabel: UILabel = {
        let label = UILabel()
        label.textColor = AppColor.textWhite
        label.textAlignment = .center
        label.font = UIFont(name: FontName.medium, size: 22)
        
        return label
    }()
    
    private let errorDescriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = AppColor.textPrimary
        label.font = UIFont(name: FontName.light, size: 16)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .center
        
        return label
    }()
    
    private let addButtonView: RoundedButtonView = {
        let button = RoundedButtonView(.system)
        button.backgroundColor = AppColor.accentMagenta
        
        return button
    }()
    
    private let generateCatButtonView: RoundedButtonView = {
        let button = RoundedButtonView(.system)
        button.backgroundColor = .clear
        button.setupBorder(width: 2, color: AppColor.backgroundQuaternary)
        
        return button
    }()
    
    override init(verificationService: ProfileVerificationService = .init(), imageLoader: LoaderService = ImageLoaderService())  {
        super.init(verificationService: verificationService, imageLoader: imageLoader)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.isOpaque = false
        view.backgroundColor = .clear
        setupUI()
    }
    
    override func verifyImage(_ image: PHPickerResult) {
        if verificationService.isValidImage(image) {
            verificationService.setSelectedImage(image)
            dismissPopup()
        }
    }
    
    override func generateAvatar() {
        super.generateAvatar()
        dismissPopup()
    }
}

//MARK: - UI Setup
private extension AvatarPickerErrorViewController {
    func setupUI() {
        view.addSubview(containerView, applyConstraints: false)
        containerView.addSubviews(imageView, errorTextLabel, errorDescriptionLabel, addButtonView, generateCatButtonView)
        
        setupConstraints()
        setupAddButtonAction()
        setupGenerateButtonAction()
        setupViewTexts()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: containerView.topAnchor),
            imageView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 280),
            
            errorTextLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 18),
            errorTextLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: contentHorizontalPadding),
            errorTextLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -contentHorizontalPadding),
            errorTextLabel.heightAnchor.constraint(equalToConstant: 29),
            
            errorDescriptionLabel.topAnchor.constraint(equalTo: errorTextLabel.bottomAnchor, constant: 12),
            errorDescriptionLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: errorHorizontalPadding),
            errorDescriptionLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -errorHorizontalPadding),
            errorDescriptionLabel.heightAnchor.constraint(equalToConstant: contentHeight),
            
            addButtonView.topAnchor.constraint(equalTo: errorDescriptionLabel.bottomAnchor, constant: 20),
            addButtonView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: contentHorizontalPadding),
            addButtonView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -contentHorizontalPadding),
            addButtonView.heightAnchor.constraint(equalToConstant: contentHeight),
            
            generateCatButtonView.topAnchor.constraint(equalTo: addButtonView.bottomAnchor, constant: 12),
            generateCatButtonView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: contentHorizontalPadding),
            generateCatButtonView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -contentHorizontalPadding),
            generateCatButtonView.heightAnchor.constraint(equalToConstant: contentHeight),
            generateCatButtonView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -28),
            
            containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            containerView.widthAnchor.constraint(equalToConstant: 342),
            containerView.bottomAnchor.constraint(greaterThanOrEqualTo: generateCatButtonView.bottomAnchor, constant: 28)
        ])
    }
    
    func setupViewTexts() {
        errorTextLabel.font = UIFont(name: FontName.medium, size: 22)
        errorDescriptionLabel.text = Localized.errorDescription.localizedString
    }
    
    func setupAddButtonAction() {
        addButtonView.setTitle(Localized.addOther.localizedString)
        mapButton(addButtonView) {
            self.onClickAddButton()
        }
    }
    
    func setupGenerateButtonAction() {
        generateCatButtonView.setTitle(Localized.generateRandomImageButton.localizedString, textColor: AppColor.textPrimary)
        mapButton(generateCatButtonView) {
            self.generateAvatar()
        }
    }
}

//MARK: - Button actions
private extension AvatarPickerErrorViewController {
    func onClickAddButton() {
        openPhotoPicker()
    }
}

//MARK: - Preview
#Preview {
    AvatarPickerErrorViewController.preview
}
