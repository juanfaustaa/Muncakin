//
//  TripItem.swift
//  Challenge2Juan
//
//  Created by Juan Fausta Pringadi on 22/04/26.
//

import Foundation
import SwiftData

@Model
final class TripItem {
    @Attribute(.unique) var id: UUID
    var name: String
    var quantity: Int
    var units: ItemUnits
    var isPacked: Bool
    var layer: ItemLayers
    var category: ItemCategories
    var ownership: ItemOwnerships
    var notes: String?
    var trip: Trip?
    var sourcePackItem: PackItem?
    
    init(
        id: UUID = UUID(),
        name: String,
        quantity: Int,
        units: ItemUnits,
        isPacked: Bool = false,
        layer: ItemLayers,
        category: ItemCategories,
        ownership: ItemOwnerships = .owned,
        notes: String? = nil,
        trip: Trip? = nil,
        sourcePackItem: PackItem? = nil
    ){
        self.id = id
        self.name = name
        self.quantity = quantity
        self.units = units
        self.isPacked = isPacked
        self.layer = layer
        self.category = category
        self.ownership = ownership
        self.notes = notes
        self.trip = trip
        self.sourcePackItem = sourcePackItem
    }
}
