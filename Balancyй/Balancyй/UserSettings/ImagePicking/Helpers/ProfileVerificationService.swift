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
    
    var imageName: String? {
        guard let name = selectedImage?.itemProvider.suggestedName else { return nil }
        return URL(fileURLWithPath: name).lastPathComponent
    }
    
    func isValidImage(_ image: PHPickerResult) -> Bool {
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
        
        return fileSizeInBytes.fileSizeInMegabytes < Const.avatarMaxSize
    }
    
    func setSelectedImage(_ image: PHPickerResult) {
        selectedImage = image
    }
}
