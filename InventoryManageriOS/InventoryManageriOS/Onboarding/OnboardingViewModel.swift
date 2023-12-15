//
//  OnboardingViewModel.swift
//  InventoryManageriOS
//
//  Created by Kyle Zeller on 12/12/23.
//

import Foundation
import Firebase // needed for AuthErrorCode in handleLogin


class OnboardingViewModel: ObservableObject {
    // MARK: Properties
    
    @Published var username: String = "" // the username
    @Published var password: String = "" // the password
    @Published var errorMessage: String? // the error message shown to the user
    
    // Computed property to get/set the isLoggedIn flag in UserDefaults
       var isLoggedIn: Bool {
           get {
               UserDefaults.standard.bool(forKey: "isLoggedIn")
           }
           set {
               UserDefaults.standard.set(newValue, forKey: "isLoggedIn")
           }
       }

    
    let firebaseOnboardingManager = OnboardingFirebaseManager.shared // reference to the onboarding firebase manager to talk to fireabse
    
    init(){ } // no logic in the init of this class
    
    // MARK: Methods
    
    /// `handleLogin` attempts to log in a user using Firebase Authentication.
    /// It uses asynchronous calls to interact with Firebase and updates the UI accordingly based on the result.
    ///
    /// - Important: This function does not handle account creation, password recovery, or account deletion,
    ///   as these responsibilities are managed by the admin in this app design.
    ///
    /// - Call this function when the user initiates a login attempt.
    /// - Uses `firebaseOnboardingManager` to communicate with Firebase.
    /// - Updates `isLoggedIn` state and `errorMessage` based on the outcome of the login attempt.
    func handleLogin() async {
        do {
            // Attempt to log in with provided credentials
            let authResult = try await firebaseOnboardingManager.login(email: username, password: password)
            
            // Update UI on main thread after successful login
            DispatchQueue.main.async {
                self.isLoggedIn = true
                // Further actions after successful login can be added here (e.g., navigation)
            }
        } catch let error as NSError {
            // Handle Firebase errors based on error codes
            DispatchQueue.main.async {
                switch error.code {
                case AuthErrorCode.wrongPassword.rawValue:
                    self.errorMessage = "Incorrect password. Please try again. If you can not remember your password, contact your admin for password recovery."
                case AuthErrorCode.userNotFound.rawValue:
                    self.errorMessage = "User not found. Contact your admin for account setup."
                // Additional specific error cases can be handled here
                default:
                    self.errorMessage = "Login error: \(error.localizedDescription)"
                }
            }
        } catch {
            // Handle general errors
            DispatchQueue.main.async {
                self.errorMessage = "An unexpected error occurred. Please try again later."
            }
        }
    }
 
}
