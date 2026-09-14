//
//  SwiftDataPackItemRepository.swift
//  Muncakin
//
//  Created by Juan Fausta Pringadi on 01/09/26.
//

import Foundation
import SwiftData

final class SwiftDataPackItemRepository: PackItemRepository {
    
    
    let context: ModelContext
    
    init(context: ModelContext) {
        self.context = context
    }
    
    func fetchGeneralItems() throws -> [PackItem] {
        let descriptor = FetchDescriptor<PackItemModel>()
        let items = try context.fetch(descriptor)
        
        return items.map {
            PackItemMapper.toDomain($0)
        }
    }
    
    func fetchMountainSpesificItems(for mountain: Mountain) throws -> [PackItem] {
        let mountainID = mountain.id
        let descriptor = FetchDescriptor<MountainModel>(
            predicate: #Predicate { mountainModel in
                mountainModel.id == mountainID
            }
        )
        
        guard let mountainModel = try context.fetch(descriptor).first else {
            return []
        }
        
        return mountainModel.specificItems.map {
            PackItemMapper.toDomain($0)
        }
    }
}
