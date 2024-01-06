//
//  AddPhotoViewModel.swift
//  Balancy
//
//  Created by  Toropov Oleksandr on 06.01.2024.
//

import UIKit

private class AddPhotoViewModel {
    
    func saveImageToFileManager(_ imageName: String, _ image: UIImage) {
        
        let manager = FileManager.default

        guard let documentsDirectory = manager.urls(for: .documentDirectory, in: .userDomainMask).first else {
            return
        }
        
        let fileURL = documentsDirectory.appendingPathComponent(imageName)

        guard let imageData = image.jpegData(compressionQuality: 1.0) else {
            return
        }

        do {
            try imageData.write(to: fileURL)
            print("Photo saved to file manager: \(fileURL)")
        } catch {
            print("Error saving photo to file manager: \(error)")
        }
    }
}
