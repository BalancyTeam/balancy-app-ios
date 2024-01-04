//
//  AddPhotoViewController + PHPicker.swift
//  Balancy
//
//  Created by  Toropov Oleksandr on 08.12.2023.
//

import UIKit
import PhotosUI

extension AddPhotoViewController: PHPickerViewControllerDelegate {
    
    // MARK: - PHPickerViewControllerDelegate
    
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        dismiss(animated: true, completion: nil)

        guard let firstResult = results.first else { return }

        firstResult.itemProvider.loadObject(ofClass: UIImage.self) { [weak self] (image, error) in
            guard let image = image as? UIImage else { return }
            DispatchQueue.main.async {
                self?.addPhotoButton.setImage(image, for: .normal)
            }
        }
    }

    // MARK: - Private Methods

    private func addPhotoButtonTapped() {
        var configuration = PHPickerConfiguration(photoLibrary: .shared())
        configuration.selectionLimit = 1
        configuration.filter = .images
        let picker = PHPickerViewController(configuration: configuration)
        picker.delegate = self

        present(picker, animated: true)
    }

    // MARK: - Public Methods

    func setupAddPhotoButton() {
        let action = UIAction { [weak self] _ in
            self?.addPhotoButtonTapped()
        }
        addPhotoButton.addAction(action, for: .touchUpInside)
    }
}
