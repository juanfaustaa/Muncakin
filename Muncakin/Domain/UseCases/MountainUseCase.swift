//
//  MountainUseCase.swift
//  Muncakin
//
//  Created by Juan Fausta Pringadi on 02/09/26.
//

import Foundation

final class MountainUseCase {
    let mountainRepository: MountainRepository
    
    init(mountainRepository: MountainRepository) {
        self.mountainRepository = mountainRepository
    }
    
    func fetchAllMountains() throws -> [Mountain] {
        let mountains = try mountainRepository.fetchAllMountains()
        
        return mountains
    }
}
