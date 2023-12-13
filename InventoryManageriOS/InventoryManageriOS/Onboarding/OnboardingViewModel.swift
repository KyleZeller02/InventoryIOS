//
//  OnboardingViewModel.swift
//  InventoryManageriOS
//
//  Created by Kyle Zeller on 12/12/23.
//

import Foundation


class OnboardingViewModel: ObservableObject {
    // MARK: Properties
    
    @Published var username: String = "" // the username
    @Published var password: String = "" // the password
    @Published var errorMessage: String?
    
    // Computed property to get/set the isLoggedIn flag in UserDefaults
       var isLoggedIn: Bool {
           get {
               UserDefaults.standard.bool(forKey: "isLoggedIn")
           }
           set {
               UserDefaults.standard.set(newValue, forKey: "isLoggedIn")
           }
       }

    
    let firebaseOnboardingManager = OnboardingFirebaseManager.shared
    
    init(){
        
    }
    
    // MARK: Methods
    
    func handleLogin() async {
            do {
                let authResult = try await firebaseOnboardingManager.login(email: username, password: password)
                // If login is successful, set isLoggedIn to true
                self.isLoggedIn = true
                // Perform further actions as needed after a successful login
            } catch {
                // Handle any errors and update errorMessage
                DispatchQueue.main.async {
                    self.errorMessage = error.localizedDescription
                    print(error.localizedDescription)
                }
            }
        }
        
}
