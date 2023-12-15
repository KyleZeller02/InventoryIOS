//
//  TransactionView.swift
//  InventoryManageriOS
//
//  Created by Kyle Zeller on 12/14/23.
//

import SwiftUI

/// `TransactionView` displays a list of items in a shopping cart, allows removal of items,
/// and includes a button to finalize the purchase.
struct TransactionView: View {
    @StateObject var viewModel: TransactionViewModel = TransactionViewModel()

    var body: some View {
        // Wraps the view in a NavigationView for navigation capabilities.
        NavigationView {
            VStack {
                // Displays a list of items in the cart.
                List {
                    ForEach(viewModel.items) { item in
                        HStack {
                            // Displays the name of the item.
                            Text(item.name)
                                .font(.headline)

                            Spacer()

                            // Displays the price of the item in green color.
                            Text("$\(item.price, specifier: "%.2f")")
                                .font(.subheadline)
                                .foregroundColor(Color.green)

                            // Button to remove the item from the cart.
                            Button(action: {
                                viewModel.removeItem(item)
                            }) {
                                Image(systemName: "minus.circle.fill")
                                    .foregroundColor(Color.red)
                                    .padding(8) // Adds padding for easier tapping.
                            }
                            .buttonStyle(PlainButtonStyle()) // Ensures standard button style.
                        }
                    }
                    .onDelete(perform: deleteItems)
                }
                .listStyle(GroupedListStyle())

                // Displays the total price of all items in the cart.
                HStack {
                    Spacer()
                    Text("Total: $\(viewModel.totalPrice, specifier: "%.2f")")
                        .font(.title)
                        .padding()
                }

                // Button to finalize the purchase.
                Button(action: {
                    viewModel.finalizePurchase()
                }) {
                    Text("Finalize Purchase")
                        .font(.headline)
                        .foregroundColor(Color.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(10)
                        .padding()
                }
            }
            .navigationTitle("Shopping Cart") // Sets the title of the navigation bar.
            .toolbar {
                // Toolbar item for scanning new items.
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        // Action to scan an item.
                    }) {
                        Image(systemName: "camera.viewfinder")
                            .font(.title)
                    }
                }
            }
        }
    }

    /// Function to delete items from the cart using swipe-to-delete gesture.
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
