//
//  ProfilePhotoManager.swift
//  Balancy
//
//  Created by  Toropov Oleksandr on 06.01.2024.
//

import UIKit

final class ProfilePhotoManager {
    
    func save(_ imageName: String, _ image: UIImage) {
        let fileManager = FileManager.default
        let imageNameWithExtension = imageName + ".jpg"
        
        guard let documentsDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first, let imageData = image.jpegData(compressionQuality: 1.0) else {
            return
        }
        
        let profileImagesDirectory = documentsDirectory.appendingPathComponent("ProfileImages")
        try? fileManager.createDirectory(at: profileImagesDirectory, withIntermediateDirectories: true)
        
        removeAllFilesInDirectory(at: profileImagesDirectory)
        
        let fileURL = profileImagesDirectory.appendingPathComponent(imageNameWithExtension)
        try? imageData.write(to: fileURL)
    }
    
    func removeAllFilesInDirectory(at path: URL) {
        let fileManager = FileManager.default
        
        guard let files = try? fileManager.contentsOfDirectory(at: path, includingPropertiesForKeys: nil) else { return }
        
        for file in files {
            try? fileManager.removeItem(at: file)
        }
    }
}
