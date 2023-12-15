//
//  Item.swift
//  InventoryManageriOS
//
//  Created by Kyle Zeller on 12/14/23.
//

import Foundation

struct Item: Identifiable {
    let id = UUID()
    var name: String
    var price: Double
}
