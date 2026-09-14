//
//  EditTripItemViewModel.swift
//  Muncakin
//
//  Created by Juan Fausta Pringadi on 08/09/26.
//

import Foundation

@Observable
final class EditTripItemViewModel {
    private let tripUseCase: TripUseCase
    var item: TripItem
    var trip: Trip
    
    var name: String
    var units: ItemUnits
    var quantity: Int
    var category: ItemCategories
    var ownership: ItemOwnerships
    var notes: String?
    
    var isValid: Bool { !name.trimmingCharacters(in: .whitespaces).isEmpty && quantity > 0 }
    
    init(tripUseCase: TripUseCase, item: TripItem, trip: Trip) {
        self.tripUseCase = tripUseCase
        self.item = item
        self.trip = trip
        self.name = item.name
        self.units = item.units
        self.quantity = item.quantity
        self.category = item.category
        self.ownership = item.ownership
        self.notes = item.notes
    }
    
    func saveChanges() throws -> TripItem {
        let updatedItem = TripItem(
            id: item.id,
            name: name,
            quantity: quantity,
            units: units,
            isPacked: item.isPacked,
            layer: item.layer,
            category: category,
            ownership: ownership,
            notes: notes,
            sourcePackItem: item.sourcePackItem
        )
        try tripUseCase.updateItem(updatedItem, from: trip)
        item = updatedItem
        
        return updatedItem
    }
}
