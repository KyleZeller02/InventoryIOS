//
//  InventoryView.swift
//  InventoryManageriOS
//
//  Created by Kyle Zeller on 12/14/23.
//

import SwiftUI

import SwiftUI

struct InventoryView: View {
    @StateObject var viewModel = InventoryViewModel()
    @State private var searchText = ""

    var body: some View {
        NavigationView {
            VStack {
                // Search Bar
                TextField("Search items", text: $searchText)
                    .padding(7)
                    .background(Color(.systemGray6)) // Adapts automatically
                    .cornerRadius(10)
                    .padding(.horizontal)

                // List of Items
                List(viewModel.items.filter {
                    searchText.isEmpty ? true : $0.name.contains(searchText)
                }) { item in
                     
                        HStack {
                            Image(uiImage: item.image) // Placeholder for item image
                                .resizable()
                                .frame(width: 50, height: 50)
                            VStack(alignment: .leading) {
                                Text(item.name)
                                    .font(.headline)
                                    .foregroundColor(Color.primary) // Adapts to color scheme
                                Text(item.description)
                                    .font(.subheadline)
                                    .foregroundColor(Color.secondary) // Adapts to color scheme
                                Text(String(format: "Price: $%.2f", item.price))
                                    .foregroundColor(Color.primary) // Adapts to color scheme
                                Text("Count: \(item.count)")
                                    .foregroundColor(Color.primary) // Adapts to color scheme
                            }
                        }
                    }
                

                // Add Item Button
                Button(action: {
                    // Implement the action to add a new item
                }) {
                    Text("Add Item")
                        .padding()
                        .background(Color.blue) // Consider using a color that adapts
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()
            }
            .navigationTitle("Inventory")
        }
    }
}


// Define the structure of an inventory item
struct InventoryItem: Identifiable {
    let id = UUID()
    var name: String
    var description: String
    var image: UIImage
    var price: Double
    var count: Int
}

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


#Preview {
    InventoryView()
}
