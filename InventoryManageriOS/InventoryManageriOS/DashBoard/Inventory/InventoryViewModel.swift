//
//  InventoryViewModel.swift
//  InventoryManageriOS
//
//  Created by Kyle Zeller on 12/15/23.
//

import Foundation
import UIKit // needed for UIImage

// View Model for InventoryView
class InventoryViewModel: ObservableObject {
    @Published var items: [InventoryItem] = []

    // Initialization with some sample items
    init() {
        // Add some sample items
        items.append(InventoryItem(name: "Item 1", description: "Description 1", image: UIImage(systemName: "photo")!, price: 10.99, count: 5))
        // Add more items...
    }

    // Function to add a new item
    func addItem(_ newItem: InventoryItem) {
        items.append(newItem)
    }
}
