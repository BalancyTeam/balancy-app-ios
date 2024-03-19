//
//  ProfileVerificationService.swift
//  Balancy
//
//  Created by Tobias on 05.03.2024.
//

import Foundation
import PhotosUI
import Combine

final class ProfileVerificationService {
    @Published private(set) var selectedImage: PHPickerResult?
    
    func getImageName() -> String? {
        if let name = selectedImage?.itemProvider.suggestedName {
            return URL(fileURLWithPath: name).lastPathComponent
        } else {
            return nil
        }
    }
    
    func verifyImage(_ image: PHPickerResult) -> Bool {
        guard let assetIdentifier = image.assetIdentifier else {
            print("Picked item without identifier")
            return false
        }
        
        let fetchResult = PHAsset.fetchAssets(withLocalIdentifiers: [assetIdentifier], options: nil)
        guard let asset = fetchResult.firstObject,
              let data = PHAssetResource.assetResources(for: asset).first else {
            return false
        }
        
        let fileSizeInBytes = data.value(forKey: "fileSize") as? Int ?? 0
        
        if fileSizeInBytes.convertToSize() < Const.avatarMaxSize {
            selectedImage = image
            return true
        } else {
            return false
        }
    }
    
}
