//
//  TripItem.swift
//  Muncakin
//
//  Created by Juan Fausta Pringadi on 31/08/26.
//

import Foundation

struct TripItem{
    let id: UUID
    let name: String
    let quantity: Int
    let units: ItemUnits
    let isPacked: Bool
    let layer: ItemLayers
    let category: ItemCategories
    let ownership: ItemOwnerships
    let notes: String?
    let trip: Trip?
    let sourcePackItem: PackItem
}
