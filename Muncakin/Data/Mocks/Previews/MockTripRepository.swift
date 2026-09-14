//
//  MockTripRepository.swift
//  Muncakin
//
//  Created by Juan Fausta Pringadi on 03/09/26.
//

import Foundation

final class MockTripRepository: TripRepository {
    func addTripItem(_ item: TripItem, to trip: Trip) throws {
        //
    }
    
    func deleteTripItem(_ item: TripItem, from trip: Trip) throws {
        //
    }
    
    func updateTripItem(_ item: TripItem, from trip: Trip) throws {
        //
    }
    
    func fetchAllTrips() throws -> [Trip] {
        let mountain = Mountain(
                    id: UUID(),
                    name: "Gunung Rinjani",
                    grade: .gradeIV,
                    location: "Nusa Tenggara Barat",
                    height: 3726,
                    minimumHikeDuration: 3,
                    imageName: "rinjani",
                    specificItems: []
                )

                return [
                    Trip(
                        id: UUID(),
                        startDate: Calendar.current.date(
                            byAdding: .day,
                            value: 2,
                            to: .now
                        )!,
                        endDate: Calendar.current.date(
                            byAdding: .day,
                            value: 4,
                            to: .now
                        )!,
                        isPast: false,
                        mountain: mountain,
                        items: []
                    )
                ]

    }
    
    func saveTrip(_ trip: Trip) throws {
        //
    }
    
    func deleteTrip(_ trip: Trip) throws {
        //
    }
    
    
}
