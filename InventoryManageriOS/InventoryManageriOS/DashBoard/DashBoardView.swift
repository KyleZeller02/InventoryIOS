//
//  DashBoardView.swift
//  InventoryManageriOS
//
//  Created by Kyle Zeller on 12/12/23.
//

import SwiftUI

/// `DashBoardView`
///
/// A SwiftUI view struct that serves as the main dashboard for the application, providing a tab-based navigation interface.
///
/// The view comprises a `TabView` with two main tabs:
/// - `TransactionView`: Displayed under the 'Transaction' tab, symbolized by a credit card icon.
/// - `InventoryView`: Displayed under the 'Inventory' tab, symbolized by a list icon.
///
/// Each tab item is constructed using a `Label` that combines text and a system image, ensuring consistency with the OS design language.
///
/// The `DashBoardView` automatically adapts to the operating system's color scheme (light or dark mode). It uses an environment property
/// to determine the current color scheme and applies an appropriate accent color to the tab items.
///
/// The accent color for the tab items changes based on the color scheme—white in dark mode and blue in light mode. This is customizable
/// as per the application's design requirements.
///
/// Usage:
/// `DashBoardView` is intended as the root view in scenarios where tab-based navigation between transactions and inventory sections is required.
///
/// Example:
/// ```
/// DashBoardView()
/// ```
///
/// This creates an instance of `DashBoardView` with adaptive color scheme support, suitable for use as a primary navigation element in the app.
///
struct DashBoardView: View {
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        TabView {
            TransactionView()
                .tabItem {
                    Label("Transaction", systemImage: "creditcard.fill")
                }

            InventoryView()
                .tabItem {
                    Label("Inventory", systemImage: "list.bullet.rectangle")
                }
        }
        .accentColor(colorScheme == .dark ? .white : .blue)
    }
}

#Preview {
    DashBoardView()
}
