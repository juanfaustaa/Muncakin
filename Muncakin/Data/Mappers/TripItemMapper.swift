//
//  TripItemMapper.swift
//  Muncakin
//
//  Created by Juan Fausta Pringadi on 31/08/26.
//

import Foundation

struct TripItemMapper {
    static func toDomain(_ model: TripItemModel) -> TripItem {
        TripItem(
            id: model.id,
            name: model.name,
            quantity: model.quantity,
            units: model.units,
            isPacked: model.isPacked,
            layer: model.layer,
            category: model.category,
            ownership: model.ownership,
            notes: model.notes,
            sourcePackItem: model.sourcePackItem.map {
                PackItemMapper.toDomain($0)
            }
        )
    }
    
    static func toModel(_ entity: TripItem) -> TripItemModel {
        TripItemModel(
            id: entity.id,
            name: entity.name,
            quantity: entity.quantity,
            units: entity.units,
            isPacked: entity.isPacked,
            layer: entity.layer,
            category: entity.category,
            ownership: entity.ownership,
            notes: entity.notes,
            sourcePackItem: nil
        )
    }
}
