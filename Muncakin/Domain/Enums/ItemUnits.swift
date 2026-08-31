//
//  Item.swift
//  Muncakin
//
//  Created by Juan Fausta Pringadi on 31/08/26.
//

import Foundation

enum ItemUnits: String, Codable, CaseIterable, Hashable {
    case liter = "liter"
    case mililiter = "mililiter"
    case pcs = "pcs"
    case set = "set"
    case gram = "gram"
    case kilogram = "kilogram"
    case pair = "pasang"
    case pack = "pack"
    case gulung = "gulung"
    
    var label: String {
        switch self{
        case.liter: return "liter"
        case.mililiter: return "mililiter"
        case.pcs: return "buah"
        case.set: return "set"
        case.gram: return "gram"
        case.kilogram: return "kilogram"
        case.pair: return "pasang"
        case.pack: return "pack"
        case.gulung: return "gulung"
        }
    }
}
