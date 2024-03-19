//
//  BaseImageSelectionViewController.swift
//  Balancy
//
//  Created by Tobias on 05.03.2024.
//

import UIKit
import SwiftUI
import PhotosUI

class BaseImageSelectionViewController: UIViewController {
    private(set) var verificationService: ProfileVerificationService
    private var imageLoader: LoaderService
    
    init(verificationService: ProfileVerificationService,
         imageLoader: LoaderService = ImageLoaderService()) {
        self.verificationService = verificationService
        self.imageLoader = imageLoader
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func handleUnverifiedImage() {
        
    }
    
    func handleVerifiedImage() {
        
    }
    
    func generateAvatar() {
        Task {
            do {
                try await imageLoader.loadImage()
            } catch {
                print("Error loading image: \(error.localizedDescription)")
            }
        }
    }
}

extension BaseImageSelectionViewController: PHPickerViewControllerDelegate {
    func openPhotoPicker() {
        var configuration = PHPickerConfiguration(photoLibrary: .shared())
        configuration.selectionLimit = 1
        configuration.filter = .images
        let picker = PHPickerViewController(configuration: configuration)
        picker.delegate = self
        
        present(picker, animated: true)
    }
    
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        dismiss(animated: true)
        
        guard let selectedImage = results.first, let _ = selectedImage.itemProvider.suggestedName else { return }
        
        if verificationService.verifyImage(selectedImage) {
            handleVerifiedImage()
        } else {
            handleUnverifiedImage()
        }
    }
}
