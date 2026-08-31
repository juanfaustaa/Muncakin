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
    var numberOfHikers: Int
    var isPast: Bool
    
    var mountain: MountainModel?
    
    @Relationship(deleteRule: .cascade, inverse: \TripItemModel.trip)
    var items: [TripItemModel] = []
    
    init(
        id: UUID = UUID(),
        startDate: Date,
        endDate: Date,
        numberofHikers: Int,
        isPast: Bool,
        mountain: MountainModel? = nil
    ){
        self.id = id
        self.startDate = startDate
        self.endDate = endDate
        self.numberOfHikers = numberofHikers
        self.isPast = isPast
        self.mountain = mountain
    }
}
