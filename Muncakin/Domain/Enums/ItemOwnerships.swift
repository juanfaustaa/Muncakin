//
//  ItemOwnerships.swift
//  Muncakin
//
//  Created by Juan Fausta Pringadi on 31/08/26.
//

import Foundation

enum ItemOwnerships: String, Codable, CaseIterable, Hashable {
    case owned = "owned"
    case rent = "rent"
    case group = "group"
    
    var label: String {
        switch self {
        case.owned: return "Pribadi"
        case.rent: return "Sewa"
        case.group: return "Kelompok"
        }
    }
}
