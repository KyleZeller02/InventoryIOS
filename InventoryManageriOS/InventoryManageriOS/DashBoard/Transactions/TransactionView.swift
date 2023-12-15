//
//  TransactionView.swift
//  InventoryManageriOS
//
//  Created by Kyle Zeller on 12/14/23.
//

import SwiftUI

/// `TransactionView` displays a list of items in a shopping cart.
/// It shows item details such as name, description, quantity, and price.
/// It also provides functionality to remove items from the cart and scan barcodes.
struct TransactionView: View {
    // ViewModel for managing the state and logic of the transaction.
    @StateObject var viewModel = TransactionViewModel()

    // Environment value to detect the current color scheme (light or dark mode).
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        // Wrapping the content inside a NavigationView for navigation capabilities.
        NavigationView {
            // VStack to vertically layout the components.
            VStack {
                // List to dynamically display an array of items.
                List {
                    // Iterating over each item in the viewModel.
                    ForEach(viewModel.items) { item in
                        // Horizontal stack for each item's view.
                        HStack {
                            // VStack for aligning item name and description vertically.
                            VStack(alignment: .leading) {
                                Text(item.name)
                                    .font(.headline) // Font style for the item name.
                                Text(item.description)
                                    .font(.subheadline) // Font style for the item description.
                                    .foregroundColor(.gray) // Text color for the description.
                            }

                            Spacer() // Spacer to push content to the left.

                            // Displaying the quantity of the item.
                            Text("Qty: \(item.count)")
                                .padding(.horizontal) // Padding to space out the text.

                            // Displaying the price of the item.
                            Text("$\(item.price, specifier: "%.2f")")
                                .foregroundColor(Color.green) // Green color for price.

                            // Button to remove the item from the cart.
                            Button(action: {
                                viewModel.removeItem(item)
                            }) {
                                Image(systemName: "minus.circle.fill")
                                    .foregroundColor(Color.red) // Red color for the remove icon.
                                    .padding(8)
                            }
                            .buttonStyle(PlainButtonStyle()) // Applying a plain button style.
                        }
                    }
                }
                .listStyle(GroupedListStyle()) // Style for the list.

                // Button for scanning a barcode.
                Button(action: {
                    // Action to scan a barcode.
                }) {
                    HStack {
                        Image(systemName: "camera.viewfinder")
                            .font(.title2)
                        Text("Scan Barcode")
                            .font(.headline)
                    }
                    .font(.headline) // Headline font for the button text.
                    .foregroundColor(Color.white) // White text color for contrast.
                    .padding() // Padding inside the button for a better touch area.
                    .frame(maxWidth: .infinity) // Makes the button expand to the full width.
                    .background(Color.blue) // Blue background for the button.
                    .cornerRadius(10) // Rounded corners for the button.
                    .padding() // Padding around the button.
                }
                .padding() // Padding around the scan barcode button.
            }
            .navigationTitle("Shopping Cart") // Title for the navigation bar.
        }
    }
}

#Preview {
    TransactionView()
}
