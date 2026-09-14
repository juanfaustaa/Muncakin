//
//  TripUseCasesTest.swift
//  Muncakin
//
//  Created by Juan Fausta Pringadi on 12/09/26.
//

import XCTest
@testable import Muncakin

final class TripUseCasesTest: XCTestCase {
    private var triprepositorySpy: TripRepositorySpy!
    private var packingListUseCase: GeneratePackingListUseCase!
    private var sut: TripUseCase!
    
    private var mountainRepository: MountainRepositoryStub!
    private var packItemRepository: PackItemRepositoryStub!
    
    
    override func setUp() {
        super.setUp()
        mountainRepository = MountainRepositoryStub()
        packItemRepository = PackItemRepositoryStub()
        triprepositorySpy = TripRepositorySpy()
        packingListUseCase = GeneratePackingListUseCase(
            packItemRepository: packItemRepository,
            mountainRepository: mountainRepository
        )
        
        sut = TripUseCase(
            tripRepository: triprepositorySpy,
            packingListUseCase: packingListUseCase
        )
    }
    
    override func tearDown() {
        sut = nil
        
        triprepositorySpy = nil
        packingListUseCase = nil
        
        super.tearDown()
    }
    
    
    func testCreateTripThatHasInvalidDate() throws {
        // arrange
        let mountainTest = Mountain(
            id: UUID(),
            name: "Gunung Test",
            grade: .gradeI,
            location: "Jawa Barat",
            height: 1234,
            minimumHikeDuration: 3,
            imageName: "Gunung Test",
            specificItems: []
        )
        
        
        // act and assert
        XCTAssertThrowsError(
            try sut.createTrip(
                mountain: mountainTest,
                startDate: Calendar.current.date(byAdding: .day, value: 1, to: .now)!,
                endDate: Calendar.current.date(byAdding: .day, value: 1, to: .now)!
            )
        ) { error in
            guard let tripError = error as? TripError else {
                return XCTFail(
                    "Expected TripError, tetapi mendapatkan \(error)"
                )
            }
            
            switch tripError {
            case .durationTooShort:
                break
            }
        }
        
        XCTAssertTrue(triprepositorySpy.savedTrips.isEmpty)
    }
    
    func testCreateTripIfTripIsValidAndSaved() throws {
        // arrange
        let mountainTest = Mountain(
            id: UUID(),
            name: "Gunung Test",
            grade: .gradeI,
            location: "Jawa Barat",
            height: 1234,
            minimumHikeDuration: 3,
            imageName: "Gunung Test",
            specificItems: []
        )
        
        // act
        let trip = try sut.createTrip(
            mountain: mountainTest,
            startDate: Calendar.current.date(byAdding: .day, value: 1, to: .now)!,
            endDate: Calendar.current.date(byAdding: .day, value: 4, to: .now)!
        )
        
        // assert
        XCTAssertEqual(triprepositorySpy.savedTrips.count, 1)
        XCTAssertNotNil(trip)
        
    }
    
    
}

private final class TripRepositorySpy: TripRepository {
    
    var tripsToReturn: [Trip] = []
    
    var fetchError: Error?
    var saveError: Error?
    var deleteError: Error?
    var addItemError: Error?
    var deleteItemError: Error?
    var updateItemError: Error?
    
    private(set) var fetchAllTripsCallCount = 0
    private(set) var savedTrips: [Trip] = []
    private(set) var deletedTrips: [Trip] = []
    
    private(set) var addedItems: [
        (item: TripItem, trip: Trip)
    ] = []
    
    private(set) var deletedItems: [
        (item: TripItem, trip: Trip)
    ] = []
    
    private(set) var updatedItems: [
        (item: TripItem, trip: Trip)
    ] = []
    
    func fetchAllTrips() throws -> [Trip] {
        
        fetchAllTripsCallCount+=1
        
        if let fetchError {
            throw fetchError
        }
        
        return tripsToReturn
    }
    
    func saveTrip(_ trip: Trip) throws {
        if let saveError {
            throw saveError
        }
        
        savedTrips.append(trip)
    }
    
    func deleteTrip(_ trip: Trip) throws {
        if let deleteError {
            throw deleteError
        }
        
        deletedTrips.append(trip)
    }
    
    func addTripItem(_ item: TripItem, to trip: Trip) throws {
        if let addItemError {
            throw addItemError
        }
        
        addedItems.append((item, trip))
    }
    
    func deleteTripItem(_ item: TripItem, from trip: Trip) throws {
        if let deleteItemError {
            throw deleteItemError
        }
        
        deletedItems.append((item, trip))
    }
    
    func updateTripItem(_ item: TripItem, from trip: Trip) throws {
        if let updateItemError {
            throw updateItemError
        }
        
        updatedItems.append((item, trip))
    }
    
}

private final class PackItemRepositoryStub: PackItemRepository {
    
    var generalItemToBeReturn: [PackItem] = []
    
    func fetchGeneralItems() throws -> [PackItem] {
        generalItemToBeReturn
    }
    
    func fetchMountainSpesificItems(for mountain: Mountain) throws -> [PackItem] {
        []
    }
    
}

private final class MountainRepositoryStub: MountainRepository {
    
    var mountainToReturn: Mountain?
    
    func fetchAllMountains() throws -> [Mountain] {
        []
    }
    
    func fetchMountain(mountain: Mountain) throws -> Mountain? {
        mountainToReturn
    }
    
}
