//
//  AddTripItemViewModel.swift
//  Muncakin
//
//  Created by Juan Fausta Pringadi on 07/09/26.
//

import Foundation

@Observable
final class AddTripItemViewModel {
    private let tripUseCase: TripUseCase
    var trip: Trip
    
    init(tripUseCase: TripUseCase, trip: Trip) {
        self.tripUseCase = tripUseCase
        self.trip = trip
    }
    
    var name = ""
    var quantity = 1
    var gramasi = 0
    var units: ItemUnits = .pcs
    var category: ItemCategories = .others
    var ownership: ItemOwnerships = .owned
    var notes = ""
    
    var isValid: Bool { !name.trimmingCharacters(in: .whitespaces).isEmpty }
    
    func addItem() throws -> TripItem {
        let newItem = TripItem(
            id: UUID(),
            name: name,
            quantity: units == .gram ? gramasi : quantity,
            units: units,
            isPacked: false,
            layer: .additional,
            category: category,
            ownership: ownership,
            notes: notes,
            sourcePackItem: nil
        )
        
        try? tripUseCase.addItem(newItem, to: trip)
        
        return newItem
    }
}
