//
//  ProfilePhotoManager.swift
//  Balancy
//
//  Created by  Toropov Oleksandr on 06.01.2024.
//

import UIKit

final class ProfilePhotoManager {
    
    func saveImageToFileManager(_ imageName: String, _ image: UIImage) {

        guard let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first, let imageData = image.jpegData(compressionQuality: 1.0) else {
            return
        }
        
        let fileURL = documentsDirectory.appendingPathComponent(imageName)

        do {
            try imageData.write(to: fileURL)
            print("Photo saved to file manager: \(fileURL)")
        } catch {
            print("Error saving photo to file manager: \(error)")
        }
    }
}
