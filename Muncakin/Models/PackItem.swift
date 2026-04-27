//
//  PackItem.swift
//  Challenge2Juan
//
//  Created by Juan Fausta Pringadi on 22/04/26.
//

import Foundation
import SwiftData

@Model
final class PackItem {
    @Attribute(.unique) var id: UUID
    var name: String
    var defaultQuantity: Int
    var units: ItemUnits
    var layer: ItemLayers
    var category: ItemCategories
    
    @Relationship(inverse: \Mountain.specificItems)
    var mountains: [Mountain] = []
    
    init(
        id: UUID = UUID(),
        name: String,
        defaultQuantity: Int,
        units: ItemUnits,
        layer: ItemLayers,
        category: ItemCategories,
        mountains: [Mountain] = []
    ){
        self.id = id
        self.name = name
        self.defaultQuantity = defaultQuantity
        self.units = units
        self.layer = layer
        self.category = category
        self.mountains = mountains
    }
}
