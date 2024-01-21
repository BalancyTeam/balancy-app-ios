import Foundation
import UIKit

final class AvatarPickerErrorViewController: UIViewController {
    private let containerView: UIView = {
        var backgroundView = UIView()
        backgroundView.backgroundColor = AppColors.containerBack
        backgroundView.setCornerRadius(28)
        backgroundView.setShadow(
            radius: 20,
            color:  UIColor(red: 0, green: 0, blue: 0, alpha: 0.2),
            opacity: 1)
       
        return backgroundView
    }()
    
    private let imageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "LoadErrorImage")
        
        return image
    }()
    
    private let errorTextLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont(name: "e-Ukraine-Medium", size: 22)
        
        return label
    }()
    
    private let errorDescriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = AppColors.buttonText
        label.font = UIFont(name: "e-Ukraine-Light", size: 16)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .center
        
        return label
    }()
    
    private let addButtonView: RoundedButtonView = {
        let button = RoundedButtonView(.system)
        button.backgroundColor = AppColors.button
        
        return button
    }()
    
    private let generateCatButtonView: RoundedButtonView = {
        let button = RoundedButtonView(.system)
        button.backgroundColor = .clear
        button.setupBorder(width: 2, color: AppColors.buttonBorder)
        
        return button
    }()
    
    private let imageLoader: LoaderService
    
    init() {
        self.imageLoader = ImageLoaderService()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
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
            imageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 0),
            imageView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 280),
            
            errorTextLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 18),
            errorTextLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 24),
            errorTextLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -24),
            errorTextLabel.heightAnchor.constraint(equalToConstant: 29),
            
            errorDescriptionLabel.topAnchor.constraint(equalTo: errorTextLabel.bottomAnchor, constant: 12),
            errorDescriptionLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 51.5),
            errorDescriptionLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -51.5),
            errorDescriptionLabel.heightAnchor.constraint(equalToConstant: 50),
            
            addButtonView.topAnchor.constraint(equalTo: errorDescriptionLabel.bottomAnchor, constant: 20),
            addButtonView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 24),
            addButtonView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -24),
            addButtonView.heightAnchor.constraint(equalToConstant: 50),
            
            generateCatButtonView.topAnchor.constraint(equalTo: addButtonView.bottomAnchor, constant: 12),
            generateCatButtonView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 24),
            generateCatButtonView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -24),
            generateCatButtonView.heightAnchor.constraint(equalToConstant: 50),
            generateCatButtonView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -28),
            
            containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            containerView.widthAnchor.constraint(equalToConstant: 342),
            containerView.bottomAnchor.constraint(greaterThanOrEqualTo: generateCatButtonView.bottomAnchor, constant: 28)
        ])
    }
    
    func setupViewTexts() {
        errorTextLabel.font = UIFont(name: "e-Ukraine-Medium", size: 22)
        errorDescriptionLabel.text = "Додайте файл розміром до 30 мб"
    }
    
    func setupAddButtonAction() {
        addButtonView.setTitle("Додати інше фото")
        mapButton(addButtonView) {
            self.onClickAddButton()
        }
    }
    
    func setupGenerateButtonAction() {
        generateCatButtonView.setTitle("Згенерувати котика", textColor: AppColors.buttonText)
        mapButton(generateCatButtonView) {
            self.onClickGenerateButton()
        }
    }
}

//MARK: - Button actions
private extension AvatarPickerErrorViewController {
    func onClickAddButton() {
        //TODO: add image picker Logic after merge
    }
    
    func onClickGenerateButton() {
        dismissPopup()
    }
}
