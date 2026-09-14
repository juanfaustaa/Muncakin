//
//  TripItem.swift
//  Muncakin
//
//  Created by Juan Fausta Pringadi on 31/08/26.
//

import Foundation

struct TripItem: Identifiable {
    let id: UUID
    var name: String
    var quantity: Int
    var units: ItemUnits
    var isPacked: Bool
    let layer: ItemLayers
    var category: ItemCategories
    var ownership: ItemOwnerships
    var notes: String?
    let sourcePackItem: PackItem?
}
