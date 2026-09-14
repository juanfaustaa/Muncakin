//
//  Trip.swift
//  Muncakin
//
//  Created by Juan Fausta Pringadi on 31/08/26.
//

import Foundation

struct Trip: Identifiable{
    let id: UUID
    let startDate: Date
    let endDate: Date
    var isPast: Bool
    let mountain: Mountain
    var items: [TripItem]
}
