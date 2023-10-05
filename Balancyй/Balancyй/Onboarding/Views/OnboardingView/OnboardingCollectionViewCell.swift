//
//  OnboardingCollectionViewCell.swift
//  Balancy
//
//  Created by Дарья Пивовар on 27.09.2023.
//

import UIKit

class OnboardingCollectionViewCell: UICollectionViewCell {
    
    static let identifier = String(describing: OnboardingCollectionViewCell.self)
    
    
    @IBOutlet weak var slideImageView: UIImageView!
    @IBOutlet weak var slideDescriptionLabel: UILabel!

    
    
    func setup(_ slide: OnboardingSlide) {
        slideImageView.image = slide.image
        slideDescriptionLabel.text = slide.description
    }
}
