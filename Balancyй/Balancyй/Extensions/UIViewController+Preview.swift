//
//  UIViewController+Preview.swift
//  Balancy
//
//  Created by  Toropov Oleksandr on 16.12.2023.
//

import SwiftUI

extension UIViewController {
    
    static var preview: some View {
        Preview(viewController: Self()).ignoresSafeArea()
    }
    
    private struct Preview: UIViewControllerRepresentable {
        let viewController: UIViewController
        
        func makeUIViewController(context: Context) -> some UIViewController {
            viewController
        }
        
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        }
    }
}
