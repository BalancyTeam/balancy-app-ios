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
    
    var slides: [OnboardingSlide] = []
    
    func setup(_ slide: OnboardingSlide) {
        slideImageView.image = slide.image
        slideDescriptionLabel.text = slide.description
        
        slideDescriptionLabel.halfTextColorChange(fullText: slide.description, changeText: slide.highlightedText)
    }
}
