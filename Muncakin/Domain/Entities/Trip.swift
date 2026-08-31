//
//  Trip.swift
//  Muncakin
//
//  Created by Juan Fausta Pringadi on 31/08/26.
//

import Foundation

struct Trip{
    let id: UUID
    let startDate: Date
    let endDate: Date
    let isPast: Bool
    let mountain: Mountain
    let items: [TripItem]
    
//    var checkedCount: Int { <- presentation
//        items
//            .filter { $0.isPacked }
//            .count
//    }
//    
//    var totalCount: Int { <- presentation
//        items.count
//    }
//    
//    func sortItemsByCategory(in category: ItemCategories) -> [TripItem] { <- presentation
//        items
//            .filter { $0.category == category }
//            .sorted { $0.layer.rawValue < $1.layer.rawValue }
//    }
}
