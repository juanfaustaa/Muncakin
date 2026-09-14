//
//  A.swift
//  Muncakin
//
//  Created by Juan Fausta Pringadi on 04/09/26.
//

import SwiftData

final class AppDependencies {
    let mountainUseCase: MountainUseCase
    let tripUseCase: TripUseCase
    let packingListUseCase: GeneratePackingListUseCase
    
    init(
        mountainUseCase: MountainUseCase,
        tripUseCase: TripUseCase,
        packingListUseCase: GeneratePackingListUseCase
    ) {
        self.mountainUseCase = mountainUseCase
        self.tripUseCase = tripUseCase
        self.packingListUseCase = packingListUseCase
    }
    
    func makeHomeViewModel() -> HomeViewModel {
        HomeViewModel(
            mountainUseCase: mountainUseCase,
            tripUseCase: tripUseCase
        )
    }
    
    func makeMountainDetailViewModel(
        mountain: Mountain
    ) -> MountainDetailViewModel {
        MountainDetailViewModel(
            mountainUseCase: mountainUseCase,
            tripUseCase: tripUseCase,
            packingListUseCase: packingListUseCase,
            mountain: mountain,
        )
    }
    
    func makeAddTripItemViewModel(trip: Trip) -> AddTripItemViewModel {
        AddTripItemViewModel(
            tripUseCase: tripUseCase, trip: trip
        )
    }
    
    func makeCarrierChecklistViewModel(trip: Trip) -> CarrierChecklistViewModel {
        CarrierChecklistViewModel(
            tripUseCase: tripUseCase,
            trip: trip
        )
    }
    
    func makeEditTripViewModel(item: TripItem,trip: Trip) -> EditTripItemViewModel {
        EditTripItemViewModel(
            tripUseCase: tripUseCase,
            item: item,
            trip: trip
        )
    }
}

extension AppDependencies {
    static func production(modelContext: ModelContext) -> AppDependencies {
        let mountainRepository = SwiftDataMountainRepository(context: modelContext)
        let tripRepository = SwiftDataTripRepository(context: modelContext)
        let packItemRepository = SwiftDataPackItemRepository(context: modelContext)
        
        let mountainUseCase = MountainUseCase(
            mountainRepository: mountainRepository
        )
        
        let packingListUseCase = GeneratePackingListUseCase(
            packItemRepository: packItemRepository,
            mountainRepository: mountainRepository
        )
        
        let tripUseCase = TripUseCase(
            tripRepository: tripRepository,
            packingListUseCase: packingListUseCase
        )
        
        return AppDependencies(
            mountainUseCase: mountainUseCase,
            tripUseCase: tripUseCase,
            packingListUseCase: packingListUseCase
        )
    }
    
    static var preview: AppDependencies {
        let mountainRepository = MockMountainRepository()
        let tripRepository = MockTripRepository()
        let packItemRepository = MockPackItemRepository()
        
        let mountainUseCase = MountainUseCase(
            mountainRepository: mountainRepository
        )
        
        let packingListUseCase = GeneratePackingListUseCase(
            packItemRepository: packItemRepository,
            mountainRepository: mountainRepository
        )
        
        let tripUseCase = TripUseCase(
            tripRepository: tripRepository,
            packingListUseCase: packingListUseCase
        )
        
        return AppDependencies(
            mountainUseCase: mountainUseCase,
            tripUseCase: tripUseCase,
            packingListUseCase: packingListUseCase
        )
    }
}
