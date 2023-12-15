//
//  ContentView.swift
//  InventoryManageriOS
//
//  Created by Kyle Zeller on 12/12/23.
//

import SwiftUI

/// `OnboardingView` is a SwiftUI view for the onboarding or login screen of the app "StoreMaster: Sales & Stock".
/// This view includes input fields for username and password, a login button, and is styled to adapt to the user's OS color scheme preferences.
struct OnboardingView: View {
    /// The view model that handles the logic for onboarding.
    /// It keeps track of the user input and processes the login action.
    @StateObject var viewModel = OnboardingViewModel()

    /// Environment property to detect the current color scheme of the device (light or dark mode).
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            
            // Represents the app logo or image. This can be replaced with an actual logo image if available.
            // The color adapts to the color scheme: white in dark mode and blue in light mode.
            Image(systemName: "cube.box.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .foregroundColor(colorScheme == .dark ? .white : .blue)

            // The title of the app. It uses large title font and bold weight.
            // The text color changes based on the color scheme.
            // Horizontal padding is added to allow the text to wrap and prevent cutting off on smaller screens.
            Text("StoreMaster: Sales & Stock")
                .font(.largeTitle)
                   .fontWeight(.bold)
                   .foregroundColor(colorScheme == .dark ? .white : .primary)
                   .minimumScaleFactor(0.5)
                   .padding(.horizontal)

            // Username input field.
            // It changes background color based on the color scheme for better visibility.
            // Rounded corners and horizontal padding are applied for aesthetics.
            TextField("Username", text: $viewModel.username)
                .padding()
                .background(colorScheme == .dark ? Color.black : Color(.systemGray6))
                .cornerRadius(10)
                .padding(.horizontal)

            // Password input field, similar styling as the username field.
            SecureField("Password", text: $viewModel.password)
                .padding()
                .background(colorScheme == .dark ? Color.black : Color(.systemGray6))
                .cornerRadius(10)
                .padding(.horizontal)

            // Login button that triggers the HandleLogin function in the view model.
            // Styled to be prominent with a blue background and white text.
            Button("Login") {
                // Use a Task to handle the asynchronous login function
                Task {
                    await viewModel.handleLogin()
                }
            }
            .fontWeight(.semibold)
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
            .padding(.horizontal)
            
            if let errorMessage = viewModel.errorMessage { // show the error
                            Text(errorMessage)
                                .foregroundColor(.red)
                        }
          

            // Footer text providing additional information or welcome message to the user.
            // Its color also adapts to the color scheme.
            Text("Welcome to your inventory management system")
                .font(.footnote)
                .foregroundColor(colorScheme == .dark ? .gray : .secondary)
            Spacer()
        }
        .padding()
    }
}



#Preview {
    OnboardingView()
}
