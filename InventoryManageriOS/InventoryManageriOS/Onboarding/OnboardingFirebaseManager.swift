//
//  OnboardingFirebaseManager.swift
//  InventoryManageriOS
//
//  Created by Kyle Zeller on 12/12/23.
//

import Foundation
import FirebaseAuth

class OnboardingFirebaseManager{
    
    static let shared = OnboardingFirebaseManager() // Singleton instance
    
    func login(email: String, password: String) async throws -> AuthDataResult {
        let authResult = try await Auth.auth().signIn(withEmail: email, password: password)
        return authResult
    }

}
