//
//  AddPhotoViewController+PHPicker.swift
//  Balancy
//
//  Created by  Toropov Oleksandr on 08.12.2023.
//

import UIKit
import PhotosUI

extension AddPhotoViewController: PHPickerViewControllerDelegate {
        
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        dismiss(animated: true)
        
        guard let selectedImage = results.first, let imageUrl = selectedImage.itemProvider.suggestedName else { return }
        
        let imageName = URL(fileURLWithPath: imageUrl).lastPathComponent
        
        setSelectedImageName(imageName)
        
        setImage(selectedImage)
    }
}

extension AddPhotoViewController {
    
    private func addPhotoButtonTapped() {
        var configuration = PHPickerConfiguration(photoLibrary: .shared())
        configuration.selectionLimit = 1
        configuration.filter = .images
        let picker = PHPickerViewController(configuration: configuration)
        picker.delegate = self
        
        present(picker, animated: true)
    }
        
    func setupAddPhotoButton() {
        let action = UIAction { [weak self] _ in
            self?.addPhotoButtonTapped()
        }
        addPhotoButton.addAction(action, for: .touchUpInside)
    }
    
    private func setImage(_ selectedImage: PHPickerResult) {
        selectedImage.itemProvider.loadObject(ofClass: UIImage.self) { [weak self] (image, _) in
            guard let image = image as? UIImage else { return }
            DispatchQueue.main.async {
                self?.addPhotoButton.setImage(image, for: .normal)
                self?.nextButton.isEnabled = true
                self?.nextButton.alpha = 0.5
            }
        }
    }
}
