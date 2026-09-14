//
//  TripRepository.swift
//  Muncakin
//
//  Created by Juan Fausta Pringadi on 01/09/26.
//

import Foundation

protocol TripRepository {
    func fetchAllTrips() throws -> [Trip]
    func saveTrip(_ trip: Trip) throws
    func deleteTrip(_ trip: Trip) throws
    func addTripItem(_ item: TripItem, to trip: Trip) throws
    func deleteTripItem(_ item: TripItem, from trip: Trip) throws
    func updateTripItem(_ item: TripItem, from trip: Trip) throws
}
