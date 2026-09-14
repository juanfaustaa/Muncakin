//
//  TripUseCase.swift
//  Muncakin
//
//  Created by Juan Fausta Pringadi on 02/09/26.
//

import Foundation

enum TripError: Error {
    case durationTooShort
}

final class TripUseCase {
    
    private let tripRepository: TripRepository
    private let packingListUseCase: GeneratePackingListUseCase
    
    init(tripRepository: TripRepository, packingListUseCase: GeneratePackingListUseCase) {
        self.tripRepository = tripRepository
        self.packingListUseCase = packingListUseCase
    }
    
    func createTrip(
        mountain: Mountain,
        startDate: Date,
        endDate: Date
    ) throws -> Trip {
        let tripItems = try packingListUseCase.execute(mountain: mountain)
        
        let trip = Trip(
            id: UUID(),
            startDate: startDate,
            endDate: endDate,
            isPast: false,
            mountain: mountain,
            items: tripItems
        )
        
        if !minimumHikeDurationValidation(on: trip){
            throw TripError.durationTooShort
        }
        
        try tripRepository.saveTrip(trip)
        
        return trip
    }
    
    func deleteTrip(trip: Trip) throws {
        try tripRepository.deleteTrip(trip)
    }
    
    func fetchAllUpcomingTrips() throws -> [Trip] {
        let trips = try tripRepository.fetchAllTrips()
        
        let upcomingTrips = trips.filter {
            !$0.isPast && $0.startDate >= Date.now
        }
        
        return upcomingTrips
    }
    
    private func minimumHikeDurationValidation(on trip: Trip) -> Bool {
        let minimumEndDate = Calendar.current.date(
            byAdding: .day,
            value: trip.mountain.minimumHikeDuration - 1,
            to: trip.startDate
        ) ?? trip.startDate

        return minimumEndDate <= trip.endDate
    }
    
    func addItem(_ item: TripItem, to trip: Trip) throws {
        try tripRepository.addTripItem(item, to: trip)
    }
    
    func deleteItem(_ item: TripItem, from trip: Trip) throws {
        try tripRepository.deleteTripItem(item, from: trip)
    }
    
    func updateItem(_ item: TripItem, from trip: Trip) throws {
        try tripRepository.updateTripItem(item, from: trip)
    }
}
