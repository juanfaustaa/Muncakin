//
//  PackItem.swift
//  Muncakin
//
//  Created by Juan Fausta Pringadi on 31/08/26.
//

import Foundation

struct PackItem: Identifiable {
    let id: UUID
    let name: String
    let defaultQuantity: Int
    let units: ItemUnits
    let layer: ItemLayers
    let category: ItemCategories
}
