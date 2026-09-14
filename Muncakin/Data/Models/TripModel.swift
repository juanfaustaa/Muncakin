//
//  Pendakian.swift
//  Challenge2Juan
//
//  Created by Juan Fausta Pringadi on 20/04/26.
//

import Foundation
import SwiftData

@Model
final class TripModel {
    @Attribute(.unique) var id: UUID
    var startDate: Date
    var endDate: Date
    var isPast: Bool
    var mountain: MountainModel
    
    @Relationship(deleteRule: .cascade, inverse: \TripItemModel.trip)
    var items: [TripItemModel] = []
    
    init(
        id: UUID = UUID(),
        startDate: Date,
        endDate: Date,
        isPast: Bool,
        mountain: MountainModel
    ){
        self.id = id
        self.startDate = startDate
        self.endDate = endDate
        self.isPast = isPast
        self.mountain = mountain
    }
}
