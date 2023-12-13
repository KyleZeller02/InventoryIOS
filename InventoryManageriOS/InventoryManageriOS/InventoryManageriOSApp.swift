//
//  InventoryManageriOSApp.swift
//  InventoryManageriOS
//
//  Created by Kyle Zeller on 12/12/23.
//

import SwiftUI
import Firebase

@main
struct InventoryManageriOSApp: App {
    // Initialize Firebase
    init() {
        FirebaseApp.configure()
       // UserDefaults.standard.set(false, forKey: "isLoggedIn") // comment out as needed 

        
    }

    // Computed property to check the login status from UserDefaults
    var isUserLoggedIn: Bool {
        UserDefaults.standard.bool(forKey: "isLoggedIn")
    }

    var body: some Scene {
        WindowGroup {
            // Decide which view to show based on login status
            if isUserLoggedIn {
                DashBoardView() // show dashboard view if user is logged in
            } else {
                OnboardingView() // Show onboarding view if the user is not logged in
            }
        }
    }
}
