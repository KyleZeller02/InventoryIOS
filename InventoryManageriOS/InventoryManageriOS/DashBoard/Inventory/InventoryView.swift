//
//  InventoryView.swift
//  InventoryManageriOS
//
//  Created by Kyle Zeller on 12/14/23.
//

import SwiftUI

/// `InventoryView` presents a list of items in an inventory. It includes a search bar for filtering items,
/// a list showing each item with details, and a button to add new items to the inventory.
struct InventoryView: View {
    // StateObject to observe changes in the ViewModel.
    @StateObject var viewModel = InventoryViewModel()
    // State property to hold the current search text.
    @State private var searchText = ""

    var body: some View {
        // NavigationView allows for navigation between views and adds a navigation bar.
        NavigationView {
            // VStack arranges its child views in a vertical line.
            VStack {
                // Search Bar for filtering inventory items.
                TextField("Search items", text: $searchText)
                    .padding(7) // Padding around the text field for visual appeal.
                    .background(Color(.systemGray6)) // Background color adapting to dark and light modes.
                    .cornerRadius(10) // Rounded corners for the text field.
                    .padding(.horizontal) // Horizontal padding around the search bar.

                // List displaying inventory items.
                List(viewModel.items.filter {
                    // Filter logic: show all items if search text is empty, or filter by name.
                    searchText.isEmpty ? true : $0.name.contains(searchText)
                }) { item in
                    // HStack arranges item details in a horizontal line.
                    HStack {
                        // Item image display.
                        Image(uiImage: item.image) // Placeholder for item image.
                            .resizable() // Makes the image resizable.
                            .frame(width: 50, height: 50) // Sets the size of the image.

                        // VStack for item details, aligned to the leading edge.
                        VStack(alignment: .leading) {
                            // Item name display.
                            Text(item.name)
                                .font(.headline) // Headline font for the item name.
                                .foregroundColor(Color.primary) // Text color adapting to dark and light modes.

                            // Item description display.
                            Text(item.description)
                                .font(.subheadline) // Subheadline font for the item description.
                                .foregroundColor(Color.secondary) // Secondary color for less emphasis.

                            // Item price display formatted to two decimal places.
                            Text(String(format: "Price: $%.2f", item.price))
                                .foregroundColor(Color.primary) // Primary color for the price text.

                            // Item count display.
                            Text("Count: \(item.count)")
                                .foregroundColor(Color.primary) // Primary color for the count text.
                        }
                    }
                }

                // Button to add a new item to the inventory.
                Button(action: {
                    // Action to add a new item.
                }) {
                    Text("Add Item")
                        .font(.headline) // Headline font for the button text.
                        .foregroundColor(Color.white) // White text color for contrast.
                        .padding() // Padding inside the button for a better touch area.
                        .frame(maxWidth: .infinity) // Makes the button expand to the full width.
                        .background(Color.blue) // Blue background for the button.
                        .cornerRadius(10) // Rounded corners for the button.
                        .padding() // Padding around the button.
                }
                .padding() // Additional padding around the button.
            }
            .navigationTitle("Inventory") // Sets the title of the navigation bar.
        }
    }
}








#Preview {
    InventoryView()
}
