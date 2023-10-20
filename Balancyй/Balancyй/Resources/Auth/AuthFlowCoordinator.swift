//
//  AuthFlowCoordinator.swift
//  Balancy
//
//  Created by sofia on 29.09.2023.
//

import Foundation
import UIKit

/// Sets entry point for Auth Flow
class AuthFlowCoordinator {
    static func setAuthEntryPoint() {
        let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene
        let window = scene?.windows.first
        
        
    // Load the "AuthFlow" storyboard
        let authFlowStoryboard = UIStoryboard(name: "AuthFlow", bundle: nil)
            
    // Instantiate the HomeViewController from the storyboard
        let authViewController = authFlowStoryboard.instantiateInitialViewController()
        
        // Set it as the root view controller
            window?.rootViewController = authViewController
            window?.makeKeyAndVisible()
    }
}
