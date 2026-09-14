//
//  SwiftDataMountainRepository.swift
//  Muncakin
//
//  Created by Juan Fausta Pringadi on 01/09/26.
//

import Foundation
import SwiftData

final class SwiftDataMountainRepository: MountainRepository {
    
    private let context: ModelContext
    
    init(context: ModelContext){
        self.context = context
    }
    
    func fetchAllMountains() throws -> [Mountain] {
        let descriptor = FetchDescriptor<MountainModel>()
        let mountains = try context.fetch(descriptor)
        
        return mountains.map {
            MountainMapper.toDomain($0)
        }
    }
    
    func fetchMountain(mountain: Mountain) throws -> Mountain? {
        let mountainId = mountain.id
        let descriptor = FetchDescriptor<MountainModel>(
            predicate: #Predicate { mountainModel in
                mountainModel.id == mountainId
            }
        )
        
        guard let mountainModel = try context.fetch(descriptor).first else {
            return nil
        }
        
        return MountainMapper.toDomain(mountainModel)
    }
}
