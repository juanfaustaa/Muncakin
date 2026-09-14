//
//  GeneratePackingListUseCase.swift
//  Muncakin
//
//  Created by Juan Fausta Pringadi on 02/09/26.
//

import Foundation

final class GeneratePackingListUseCase {
    private let packItemRepository: PackItemRepository
    private let mountainRepository: MountainRepository
    
    init(packItemRepository: PackItemRepository, mountainRepository: MountainRepository) {
        self.packItemRepository = packItemRepository
        self.mountainRepository = mountainRepository
    }
    
    func execute(mountain: Mountain) throws -> [TripItem] {
        let baseTripItems = try generateBasePackingItems()
        let mountainSpecificTripItems = try generateMountainSpecificItems(for: mountain)
        
        return baseTripItems + mountainSpecificTripItems
    }
    
    private func generateBasePackingItems() throws -> [TripItem] {
        let items = try packItemRepository.fetchGeneralItems().filter { item in
            item.layer == .essential ||
            item.layer == .essentialOptional
        }
        
        let tripItems = items.map { item in
            TripItem(
                id: UUID(),
                name: item.name,
                quantity: item.defaultQuantity,
                units: item.units,
                isPacked: false,
                layer: item.layer,
                category: item.category,
                ownership: .owned,
                notes: nil,
                sourcePackItem: item
            )
        }
        
        return tripItems
    }
    
    private func generateMountainSpecificItems(for mountain: Mountain) throws -> [TripItem] {
        guard let fetchedMountain = try mountainRepository.fetchMountain(mountain: mountain) else {
            return []
        }
        
        let specificItems = fetchedMountain.specificItems
        
        let tripItems = specificItems.map { item in
            TripItem(
                id: UUID(),
                name: item.name,
                quantity: item.defaultQuantity,
                units: item.units,
                isPacked: false,
                layer: item.layer,
                category: item.category,
                ownership: .owned,
                notes: nil,
                sourcePackItem: item
            )
        }
        
        return tripItems
    }
}
