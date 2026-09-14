//
//  MountainMapper.swift
//  Muncakin
//
//  Created by Juan Fausta Pringadi on 31/08/26.
//

import Foundation

struct MountainMapper {
    static func toDomain(_ model: MountainModel) -> Mountain {
        Mountain(
            id: model.id,
            name: model.name,
            grade: model.grade,
            location: model.location,
            height: model.height,
            minimumHikeDuration: model.minimumHikeDuration,
            imageName: model.imageName,
            specificItems: model.specificItems.map {
                PackItemMapper.toDomain($0)
            }
        )
    }
    
    static func toModel(_ entity: Mountain) -> MountainModel {
        MountainModel(
            id: entity.id,
            name: entity.name,
            grade: entity.grade,
            location: entity.location,
            height: entity.height,
            minimumHikeDuration: entity.minimumHikeDuration,
            imageName: entity.imageName,
            specificItems: entity.specificItems.map {
                PackItemMapper.toModel($0)
            }
        )
    }
}
