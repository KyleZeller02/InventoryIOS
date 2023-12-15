//
//  OnboardingFirebaseManager.swift
//  InventoryManageriOS
//
//  Created by Kyle Zeller on 12/12/23.
//

import Foundation
import FirebaseAuth

/// `OnboardingFirebaseManager` is a singleton class responsible for handling Firebase authentication-related tasks.
///
/// This class provides methods to interact with Firebase's authentication services, such as logging in users.
/// Being a singleton, it ensures that there's a single, shared instance managing the authentication operations throughout the app.
///
/// Usage:
/// - Access the shared instance using `OnboardingFirebaseManager.shared`.
/// - Call the `login` method to perform user login via Firebase.
class OnboardingFirebaseManager {

    /// Shared singleton instance of `OnboardingFirebaseManager`.
    /// Use this instance to access class methods for Firebase authentication.
    static let shared = OnboardingFirebaseManager()

    /// Private initializer to prevent the creation of multiple instances.
     ///
     /// Since `OnboardingFirebaseManager` is implemented as a singleton, the initializer is made private.
     /// This ensures that it cannot be instantiated multiple times from outside the class.
     /// The singleton pattern guarantees that only one instance of this class exists throughout the app,
     /// providing a centralized point of access to its methods and properties.
     ///
     /// This approach is particularly useful for managing shared resources or states, such as
     /// Firebase authentication in this case, ensuring consistency and preventing conflicts
     /// that could arise from multiple instances.
     private init() {
         // Private initializer to ensure singleton usage
     }

    /// Logs in a user with the provided email and password using Firebase authentication.
    ///
    /// This method performs an asynchronous network request to Firebase's authentication servers.
    /// It throws an error if the login process fails, allowing the caller to handle it appropriately.
    ///
    /// - Parameters:
    ///   - email: The email address of the user trying to log in.
    ///   - password: The password of the user.
    /// - Returns: An `AuthDataResult` object containing user information and additional metadata.
    /// - Throws: An error if the login process fails (e.g., wrong credentials, no internet connection).
    func login(email: String, password: String) async throws -> AuthDataResult {
        // Perform the login operation using Firebase Authentication
        let authResult = try await Auth.auth().signIn(withEmail: email, password: password)
        return authResult
    }
}

