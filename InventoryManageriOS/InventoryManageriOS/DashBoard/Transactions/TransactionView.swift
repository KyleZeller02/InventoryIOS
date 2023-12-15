//
//  TransactionView.swift
//  InventoryManageriOS
//
//  Created by Kyle Zeller on 12/14/23.
//

import SwiftUI

/// `TransactionView` displays a list of items in a shopping cart. It allows users to remove items
/// and includes a button to finalize the purchase. This view is designed to work with a ViewModel
/// that manages the state of the cart, including the list of items and the total price.
struct TransactionView: View {
    // StateObject property wrapper to observe the ViewModel. This ensures the view updates
    // when the data in the ViewModel changes.
    @StateObject var viewModel: TransactionViewModel = TransactionViewModel()

    var body: some View {
        // The NavigationView enables the use of navigation within this view, including a navigation bar.
        NavigationView {
            // VStack arranges subviews in a vertical line. This is used to layout the list of items
            // and the finalize purchase button.
            VStack {
                // List displays a collection of items. It's used here to show the shopping cart items.
                List {
                    // ForEach is used to iterate over the items in the ViewModel. It creates a view for
                    // each item in the list.
                    ForEach(viewModel.items) { item in
                        // HStack arranges the item's name, price, and remove button in a horizontal line.
                        HStack {
                            // Displays the name of the item using the headline font style.
                            Text(item.name)
                                .font(.headline)

                            Spacer()

                            // Displays the price of the item. The price is formatted to two decimal places.
                            // The color green is used for the price text.
                            Text("$\(item.price, specifier: "%.2f")")
                                .font(.subheadline)
                                .foregroundColor(Color.green)

                            // Button to remove the item from the cart. It uses a red minus circle icon.
                            // Padding is added to increase the tappable area.
                            Button(action: {
                                viewModel.removeItem(item)
                            }) {
                                Image(systemName: "minus.circle.fill")
                                    .foregroundColor(Color.red)
                                    .padding(8)
                            }
                            .buttonStyle(PlainButtonStyle()) // Applies a plain button style.
                        }
                    }
                    .onDelete(perform: deleteItems) // Enables swipe-to-delete functionality.
                }
                .listStyle(GroupedListStyle()) // Applies a grouped list style.

                // Displays the total price of all items in the cart at the bottom.
                HStack {
                    Spacer()
                    Text("Total: $\(viewModel.totalPrice, specifier: "%.2f")")
                        .font(.title) // Large title font for total price.
                        .padding()
                }

                // Button to finalize the purchase. It's styled with a blue background and rounded corners.
                Button(action: {
                    viewModel.finalizePurchase()
                }) {
                    Text("Finalize Purchase")
                        .font(.headline)
                        .foregroundColor(Color.white)
                        .padding()
                        .frame(maxWidth: .infinity) // Ensures the button expands to the full width.
                        .background(Color.blue)
                        .cornerRadius(10)
                        .padding()
                }
            }
            .navigationTitle("Shopping Cart") // Sets the title of the navigation bar.
            .toolbar {
                // ToolbarItem in the navigation bar for adding new items, represented by a camera icon.
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        // Action to add a new item.
                    }) {
                        Image(systemName: "camera.viewfinder")
                            .font(.title)
                    }
                }
            }
        }
    }

    /// Deletes items from the cart. This function is called when the user swipes to delete an item.
    /// - Parameter offsets: The index set of items to be deleted.
    private func deleteItems(at offsets: IndexSet) {
        offsets.forEach { index in
            let item = viewModel.items[index]
            viewModel.removeItem(item)
        }
    }
}

#Preview {
    TransactionView()
}
