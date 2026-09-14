//
//  HomeViewModel.swift
//  Muncakin
//
//  Created by Juan Fausta Pringadi on 02/09/26.
//

import Foundation

@Observable
final class HomeViewModel {
    private let mountainUseCase: MountainUseCase
    private let tripUseCase: TripUseCase
    
    init(mountainUseCase: MountainUseCase, tripUseCase: TripUseCase) {
        self.mountainUseCase = mountainUseCase
        self.tripUseCase = tripUseCase
    }
    
    var mountains: [Mountain] = []
    var trips: [Trip] = []
    var searchQuery = ""
    
    var isLoading = false
    var errorMessage: String?
    
    var searchedMountains: [Mountain] {
        guard !searchQuery.isEmpty else {
            return mountains
        }
        
        return mountains.filter {
            $0.name.localizedCaseInsensitiveContains(searchQuery)
        }
    }
    
    func loadData() {
        isLoading = true
        errorMessage = nil
        
        do{
            mountains = try mountainUseCase.fetchAllMountains()
            trips = try tripUseCase.fetchAllUpcomingTrips()
        } catch {
            errorMessage = error.localizedDescription
        }
        
        isLoading = false
    }
    
    func removeDeletedTrip(trip: Trip) {
        guard let index = trips.firstIndex(where: {
            $0.id == trip.id
        }) else{
            return
        }
        
        trips.remove(at: index)
    }
    
}
