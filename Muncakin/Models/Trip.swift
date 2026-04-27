//
//  Pendakian.swift
//  Challenge2Juan
//
//  Created by Juan Fausta Pringadi on 20/04/26.
//

import Foundation
import SwiftData

@Model
final class Trip {
    @Attribute(.unique) var id: UUID
    var startDate: Date
    var endDate: Date
    var numberOfHikers: Int
    var isPast: Bool
    
    var mountain: Mountain?
    
    @Relationship(deleteRule: .cascade, inverse: \TripItem.trip)
    var items: [TripItem] = []
    
    var checkedCount: Int {
        items.filter {
            $0.isPacked
        }.count
    }
    
    var totalCount: Int
    {
        items.count
    }
    
    func items(in category: ItemCategories) -> [TripItem] {
        items.filter{
            $0.category == category
        }.sorted {
            $0.layer.rawValue < $1.layer.rawValue
        }
    }
    
    init(
        id: UUID = UUID(),
        startDate: Date,
        endDate: Date,
        numberofHikers: Int,
        isPast: Bool,
        mountain: Mountain? = nil
    ){
        self.id = id
        self.startDate = startDate
        self.endDate = endDate
        self.numberOfHikers = numberofHikers
        self.isPast = isPast
        self.mountain = mountain
    }
}
