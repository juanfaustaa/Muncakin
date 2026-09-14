//
//  ItemLayers.swift
//  Muncakin
//
//  Created by Juan Fausta Pringadi on 31/08/26.
//

import Foundation

enum ItemLayers: String, Codable, CaseIterable, Hashable {
    case essential = "essential"
    case essentialOptional = "essentialOptional"
    case mountainEssential = "mountainEssential"
    case additional = "additional"
    
    var sortPriority: Int {
        switch self {
        case.essential: return 0
        case.essentialOptional: return 2
        case.mountainEssential: return 1
        case.additional: return 3
        }
    }
}
