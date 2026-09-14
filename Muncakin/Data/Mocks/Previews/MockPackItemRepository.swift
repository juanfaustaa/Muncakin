//
//  MockPackItemRepository.swift
//  Muncakin
//
//  Created by Juan Fausta Pringadi on 03/09/26.
//

import Foundation

final class MockPackItemRepository: PackItemRepository {
    func fetchGeneralItems() throws -> [PackItem] {
        [
            PackItem(
                id: UUID(),
                name: "Carrier",
                defaultQuantity: 1,
                units: .pcs,
                layer: .essential,
                category: .personalThings
            ),

            PackItem(
                id: UUID(),
                name: "Headlamp",
                defaultQuantity: 1,
                units: .pcs,
                layer: .essential,
                category: .safetyTools
            ),

            PackItem(
                id: UUID(),
                name: "Jas Hujan",
                defaultQuantity: 1,
                units: .pcs,
                layer: .essentialOptional,
                category: .personalThings
            )
        ]
    }
    
    func fetchMountainSpesificItems(for mountain: Mountain) throws -> [PackItem] {
        return []
    }
}
