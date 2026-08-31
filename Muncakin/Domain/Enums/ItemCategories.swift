//
//  ItemCategories.swift
//  Muncakin
//
//  Created by Juan Fausta Pringadi on 31/08/26.
//

import Foundation

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
