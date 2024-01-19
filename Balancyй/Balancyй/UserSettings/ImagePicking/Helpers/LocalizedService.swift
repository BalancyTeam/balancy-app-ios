//
//  LocalizedService.swift
//  Balancy
//
//  Created by  Toropov Oleksandr on 19.01.2024.
//

import Foundation

class LocalizedService {
    func getString(for target: LocalizedTarget) -> String {
        NSLocalizedString(target.rawValue, comment: "ImagePicking")
    }
    
    enum LocalizedTarget: String {
        case skipButton = "skip"
        case addPhotoLabel = "addPhoto"
        case generateRandomImageButton = "generateCat"
        case nextButton = "next"
    }
}
