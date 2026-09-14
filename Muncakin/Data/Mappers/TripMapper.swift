//
//  TripMapper.swift
//  Muncakin
//
//  Created by Juan Fausta Pringadi on 31/08/26.
//

import Foundation

struct TripMapper {
    static func toDomain(_ model: TripModel) -> Trip {
        Trip(
            id: model.id,
            startDate: model.startDate,
            endDate: model.endDate,
            isPast: model.isPast,
            mountain: MountainMapper.toDomain(model.mountain),
            items: model.items.map {
                TripItemMapper.toDomain($0)
            }
        )
    }
    
    static func toModel(_ entity: Trip, mountain: MountainModel) -> TripModel {
        let tripModel = TripModel(
            id: entity.id,
            startDate: entity.startDate,
            endDate: entity.endDate,
            isPast: entity.isPast,
            mountain: mountain
        )
        
        let itemModels = entity.items.map {
            TripItemMapper.toModel($0)
        }
        
        itemModels.forEach { itemModel in
            itemModel.trip = tripModel
        }
        
        tripModel.items = itemModels
        
        return tripModel
    }
}
