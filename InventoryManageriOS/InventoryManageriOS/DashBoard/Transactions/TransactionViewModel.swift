//
//  TransactionViewModel.swift
//  InventoryManageriOS
//
//  Created by Kyle Zeller on 12/14/23.
//

import Foundation
import UIKit // Needed for UIImage

class TransactionViewModel: ObservableObject {
    @Published var items: [InventoryItem] = []
    @Published var totalPrice: Double = 0.0

    init() {
        items = [
            InventoryItem(name: "Apple", description: "Fresh apple", image: UIImage(systemName: "applelogo") ?? UIImage(), price: 0.99, count: 1),
            InventoryItem(name: "Bread", description: "Whole grain bread", image: UIImage(systemName: "leaf") ?? UIImage(), price: 2.50, count: 1),
            InventoryItem(name: "Milk", description: "Organic milk", image: UIImage(systemName: "carton") ?? UIImage(), price: 1.50, count: 1)
        ]
        updateTotalPrice()
    }


    // Function to add an item to the cart
    func addItem(_ newItem: InventoryItem) {
        // Check if the item already exists in the cart
        if let index = items.firstIndex(where: { $0.id == newItem.id }) {
            items[index].count += 1 // Increment the count if item exists
        } else {
            var newItemWithCount = newItem
            newItemWithCount.count = 1
            items.append(newItemWithCount) // Add new item with count 1
        }
        updateTotalPrice()
    }

    // Function to remove an item from the cart
    func removeItem(_ item: InventoryItem) {
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            if items[index].count > 1 {
                items[index].count -= 1 // Decrement the count
            } else {
                items.remove(at: index) // Remove item if count is 1
            }
        }
        updateTotalPrice()
    }

    // Function to finalize the purchase
    func finalizePurchase() {
        // Implement purchase finalization logic here
        items.removeAll()
        updateTotalPrice()
    }

    // Private function to update the total price
    private func updateTotalPrice() {
        totalPrice = items.reduce(0) { $0 + ($1.price * Double($1.count)) }
    }
}

