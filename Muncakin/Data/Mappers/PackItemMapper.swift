//
//  PackItemMapper.swift
//  Muncakin
//
//  Created by Juan Fausta Pringadi on 31/08/26.
//

import Foundation

struct PackItemMapper {
    static func toDomain(_ model: PackItemModel) -> PackItem {
        PackItem(
            id: model.id,
            name: model.name,
            defaultQuantity: model.defaultQuantity,
            units: model.units,
            layer: model.layer,
            category: model.category
        )
    }
    
    static func toModel(_ entity: PackItem) -> PackItemModel {
        PackItemModel(
            id: entity.id,
            name: entity.name,
            defaultQuantity: entity.defaultQuantity,
            units: entity.units,
            layer: entity.layer,
            category: entity.category
        )
    }
}
