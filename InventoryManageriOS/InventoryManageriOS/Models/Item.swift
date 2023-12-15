//
//  Item.swift
//  InventoryManageriOS
//
//  Created by Kyle Zeller on 12/14/23.
//

import Foundation
import UIKit

struct InventoryItem: Identifiable {
    let id = UUID()
    var name: String
    var description: String
    var image: UIImage
    var price: Double
    var count: Int
}


