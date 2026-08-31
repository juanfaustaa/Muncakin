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
    
    var label: String {
        switch self {
        case.essential: return "Esensial"
        case.essentialOptional: return "Esensial tapi opsional"
        case.mountainEssential: return "Esensial untuk gunung ini"
        case.additional: return "Tambahan"
        }
    }
}
