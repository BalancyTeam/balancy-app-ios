//
//  MainScreenTopBar.swift
//  Balancy
//
//  Created by Tobias on 09.07.2024.
//

import UIKit

final class MainScreenTopBar: UIView {
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: FontName.medium, size: 22)
        label.textColor = AppColor.primaryText
        label.textAlignment = .left
        return label
    }()
    
    private let searchImageView: UIImageView =  {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = AppColor.secondaryText
        return imageView
    }()
    
    private let searchButton: UIButton = .init(type: .system)
    private var onSearchClick: (() -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }
    
    func setDate(_ date: Date?) {
        dateLabel.text = date?.toDayMonthString()
    }
    
    func configure(searchAction: @escaping () -> Void) {
        onSearchClick = searchAction
    }
}

private extension MainScreenTopBar {
    private enum Size {
        static let searchImage: CGFloat = 21
        static let searchButton: CGFloat = 48
        static let date: CGFloat = 120
    }
    
    func setupUI() {
        backgroundColor = .clear
        
        addSubviews(dateLabel, searchButton)
        searchButton.addSubviews(searchImageView)
        
        setupConstraints()
        setupSearchButton()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            dateLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            dateLabel.topAnchor.constraint(equalTo: topAnchor),
            dateLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            dateLabel.widthAnchor.constraint(lessThanOrEqualToConstant: Size.date),
            
            searchButton.trailingAnchor.constraint(equalTo: trailingAnchor),
            searchButton.topAnchor.constraint(equalTo: topAnchor),
            searchButton.bottomAnchor.constraint(equalTo: bottomAnchor),
            searchButton.widthAnchor.constraint(equalToConstant: Size.searchButton),
            
            searchImageView.centerYAnchor.constraint(equalTo: searchButton.centerYAnchor),
            searchImageView.centerXAnchor.constraint(equalTo: searchButton.centerXAnchor),
            searchImageView.widthAnchor.constraint(equalToConstant: Size.searchImage),
            searchImageView.heightAnchor.constraint(equalToConstant: Size.searchImage)
        ])
    }
    
    func setupSearchButton() {
        setSearchImage()
        setSearchAction()
    }
    
    func setSearchAction() {
        mapButton(searchButton) { [weak self] in
            self?.onSearchClick?()
        }
    }
    
    func setSearchImage() {
        let image = UIImage(named: ImageName.searchImage)
        searchImageView.image = image?.withRenderingMode(.alwaysTemplate)
    }
}
