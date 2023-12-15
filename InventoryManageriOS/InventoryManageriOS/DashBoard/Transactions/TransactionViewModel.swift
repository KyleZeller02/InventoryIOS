//
//  TransactionViewModel.swift
//  InventoryManageriOS
//
//  Created by Kyle Zeller on 12/14/23.
//

import Foundation

class TransactionViewModel: ObservableObject {
    // Published properties to update the view when changed
    @Published var items: [Item] = [] // List of items in the cart
    @Published var totalPrice: Double = 0.0 // Total price of items in the cart
    
    init() {
            // Initialize with sample items
            items = [
                Item(name: "Apple", price: 0.99),
                Item(name: "Bread", price: 2.50),
                Item(name: "Milk", price: 1.50)
            ]
            updateTotalPrice()
        }

    // Function to add an item to the cart
    func addItem(_ newItem: Item) {
        items.append(newItem)
        updateTotalPrice()
    }

    // Function to remove an item from the cart
    func removeItem(_ item: Item) {
        items.removeAll { $0.id == item.id }
        updateTotalPrice()
    }

    // Function to finalize the purchase
    func finalizePurchase() {
        // Implement the logic to finalize the purchase
        // For example, processing payment, sending order details, etc.

        // Clear the cart after purchase
        items.removeAll()
        updateTotalPrice()
    }

    // Private function to update the total price
    private func updateTotalPrice() {
        totalPrice = items.reduce(0) { $0 + $1.price }
    }
}
