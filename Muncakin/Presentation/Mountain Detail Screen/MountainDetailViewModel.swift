//
//  MountainDetailViewModel.swift
//  Muncakin
//
//  Created by Juan Fausta Pringadi on 02/09/26.
//

import Foundation

@Observable
final class MountainDetailViewModel {
    private let mountainUseCase: MountainUseCase
    private let tripUseCase: TripUseCase
    private let packingListUseCase: GeneratePackingListUseCase
    
    var mountain: Mountain
    var startDate = Date.now
    var endDate = Date.now
    var numberOfHikers: Int = 1
    var errorMessage: String?
    var isTripValid: Bool {
        endDate >= Calendar.current.date(byAdding: .day, value: mountain.minimumHikeDuration - 1, to: startDate) ?? startDate && numberOfHikers >= 1
    }
    
    var minimumEndDate: Date {
        Calendar.current.date(byAdding: .day, value: mountain.minimumHikeDuration - 1, to: startDate) ?? startDate
    }
    
    init(mountainUseCase: MountainUseCase, tripUseCase: TripUseCase, packingListUseCase: GeneratePackingListUseCase, mountain: Mountain) {
        self.mountainUseCase = mountainUseCase
        self.tripUseCase = tripUseCase
        self.packingListUseCase = packingListUseCase
        self.mountain = mountain
    }
    
    func createTrip() throws -> Trip {
        let newTrip = try tripUseCase.createTrip(
            mountain: mountain,
            startDate: startDate,
            endDate: endDate
        )
        
        return newTrip
    }
    
}
