//
//  TripService.swift
//  Challenge2Juan
//
//  Created by Juan Fausta Pringadi on 23/04/26.
//

import Foundation
import SwiftData
import SwiftUI

struct TripService {
    @MainActor
    static func createTrip(
        mountain: Mountain,
        startDate: Date,
        endDate: Date,
        numberOfHikers: Int,
        context: ModelContext
    ) -> Trip {
        let trip = Trip(
            startDate: startDate,
            endDate: endDate,
            numberofHikers: numberOfHikers,
            isPast: false,
            mountain: mountain
        )
        context.insert(trip)
        
        // Fetching atau mengambil semua PackItem
        let descriptor = FetchDescriptor<PackItem>()
        let allPackItems = (try?context.fetch(descriptor)) ?? []
        
        // filter barang-barang essential, essentialOptional, dan mountainEssential dari allPackItems
        let relevant = allPackItems.filter { item in
            item.layer == .essential ||
            item.layer == .essentialOptional ||
            (item.layer == .mountainEssential && item.mountains.contains{ $0.id == mountain.id })
        }
        
        // ngeiterate "relevant" dan masukin ke TripItem
        for packItem in relevant {
            let tripItem = TripItem(
                name: packItem.name,
                quantity: packItem.defaultQuantity,
                units: packItem.units,
                layer: packItem.layer,
                category: packItem.category,
                trip: trip,
                sourcePackItem: packItem
            )
            context.insert(tripItem)
            trip.items.append(tripItem)
        }
        
        return trip
    }
}
