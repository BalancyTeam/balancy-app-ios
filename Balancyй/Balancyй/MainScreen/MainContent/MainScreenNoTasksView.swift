//
//  MainScreenNoTasksView.swift
//  Balancy
//
//  Created by Tobias on 28.07.2024.
//

import UIKit

final class MainScreenNoTasksView: UIView {
    private let infoImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: ImageName.emptyToDoImage)
        return imageView
    }()
    
    private let infoLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont(name: FontName.regular, size: 16)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }
}

private extension MainScreenNoTasksView {
    enum Size {
        static let imageHeight: CGFloat = 256
        static let imageWidth: CGFloat = 342
        static let textHeight: CGFloat = 18
    }
    
    enum Offset {
        static let textTopOffset: CGFloat = 18
    }
    
    func setupUI() {
        addSubviews(infoImage, infoLabel)
        setupConstraints()
        updateContent()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            infoImage.topAnchor.constraint(equalTo: topAnchor),
            infoImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            infoImage.heightAnchor.constraint(equalToConstant: Size.imageHeight),
            infoImage.widthAnchor.constraint(equalToConstant: Size.imageWidth),
            
            infoLabel.topAnchor.constraint(equalTo: infoImage.bottomAnchor, constant: Offset.textTopOffset),
            infoLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            infoLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            infoLabel.heightAnchor.constraint(equalToConstant: Size.textHeight),
        ])
    }
    
    func updateContent() {
        infoLabel.text = Localized.emptyToDo.localizedString
    }
}
