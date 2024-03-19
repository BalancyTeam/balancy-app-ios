//
//  LocalizedService.swift
//  Balancy
//
//  Created by  Toropov Oleksandr on 19.01.2024.
//

import Foundation

enum Localized: String {
    
    case skipButton = "skip"
    case addPhotoLabel = "addPhoto"
    case generateRandomImageButton = "generateCat"
    case nextButton = "next"
    case errorDescription = "errorDescription"
    case addOther = "addOther"
    
    var localizedString: String {
        switch self {
        case .skipButton:
            return NSLocalizedString(Localized.skipButton.rawValue, comment: "ImagePicking")
        case .addPhotoLabel:
            return NSLocalizedString(Localized.addPhotoLabel.rawValue, comment: "ImagePicking")
        case .generateRandomImageButton:
            return NSLocalizedString(Localized.generateRandomImageButton.rawValue, comment: "ImagePicking")
        case .nextButton:
            return NSLocalizedString(Localized.nextButton.rawValue, comment: "ImagePicking")
        case .errorDescription:
            return NSLocalizedString(Localized.errorDescription.rawValue, comment: "AvatarImageError")
        case .addOther:
            return NSLocalizedString(Localized.addOther.rawValue, comment: "AvatarImageError")
        }
    }
}

