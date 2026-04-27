//
//  enums.swift
//  Challenge2Juan
//
//  Created by Juan Fausta Pringadi on 22/04/26.
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

enum ItemCategories: String, Codable, CaseIterable, Hashable {
    case shelter = "shelter"
    case personalThings = "personalThings"
    case foodAndLogistics = "foodAndLogistics"
    case safetyTools = "safetyTools"
    case firstAid = "firstAid"
    case document = "document"
    case others = "others"

    var label: String {
        switch self {
        case.shelter: return "Shelter"
        case.personalThings: return "Barang Pribadi"
        case.foodAndLogistics: return "Makanan dan Logistik"
        case.safetyTools: return "Alat Keamanan"
        case.firstAid: return "P3K"
        case.document: return "Dokumen"
        case.others: return "Lainnya"
        }
    }
}

enum ItemOwnerships: String, Codable, CaseIterable, Hashable {
    case owned = "owned"
    case rent = "rent"
    
    var label: String {
        switch self {
        case.owned: return "Pribadi"
        case.rent: return "Sewa"
        }
    }
}

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

enum MountainGrades: String, Codable, CaseIterable, Hashable {
    case gradeI = "Grade I"
    case gradeII = "Grade II"
    case gradeIII = "Grade III"
    case gradeIV = "Grade IV"
    case gradeV = "Grade V"
    
    var label: String {
        switch self {
        case.gradeI: return "Grade I"
        case.gradeII: return "Grade II"
        case.gradeIII: return "Grade III"
        case.gradeIV: return "Grade IV"
        case.gradeV: return "Grade V"
        }
    }
}
