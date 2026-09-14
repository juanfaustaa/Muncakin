//
//  SeedOrchestrator.swift
//  Muncakin
//
//  Created by Juan Fausta Pringadi on 01/09/26.
//

import Foundation
import SwiftData

struct SeedOrchestrator {
    static func seed(context: ModelContext) throws {
        let mountains = MountainSeed.mountainSeed
        let essentials = PackItemSeed.essentials
        let mountainEssentials = PackItemSeed.mountainEssentials
        
        mountains.forEach {
            context.insert($0)
        }
        
        essentials.forEach {
            context.insert($0)
        }
        
        mountainEssentials.forEach {
            context.insert($0)
        }
        
        try context.save()
    }
}
