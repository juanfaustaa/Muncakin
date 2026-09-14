//
//  GeneratePackingListUseCaseTests.swift
//  Muncakin
//
//  Created by Juan Fausta Pringadi on 11/09/26.
//

import XCTest
@testable import Muncakin

final class GeneratePackingListUseCaseTests: XCTestCase {
    func testExecuteWhenMountainHasSpecificItemsReturnsThoseItems() throws {
        // Arrange
        let spesificItem = PackItem(
            id: UUID(),
            name: "spesific",
            defaultQuantity: 1,
            units: .gram,
            layer: .mountainEssential,
            category: .others
        )
        
        let mountain = Mountain(
            id: UUID(),
            name: "gunung",
            grade: .gradeI,
            location: "lokasi",
            height: 1234,
            minimumHikeDuration: 2,
            imageName: "gunung_image",
            specificItems: [spesificItem]
        )
        
        let packItemRepository = PackItemRepositoryStub()
        let mountainRepository = MountainRepositoryStub()
        
        packItemRepository.generalItemToBeReturn = []
        mountainRepository.mountainToReturn = mountain
        
        
        let sut = GeneratePackingListUseCase(
            packItemRepository: packItemRepository,
            mountainRepository: mountainRepository
        )
        
        // Act
        
        let result = try sut.execute(mountain: mountain)
        
        // Assert
        XCTAssertEqual(result.count, 1)
        
        let generatedTripItem = try XCTUnwrap(result.first)
        
        XCTAssertEqual(generatedTripItem.name, "spesific")
        XCTAssertEqual(generatedTripItem.quantity, 1)
        XCTAssertEqual(generatedTripItem.units, .gram)
        XCTAssertEqual(generatedTripItem.layer, .mountainEssential)
        XCTAssertEqual(generatedTripItem.category, .others)
        
        XCTAssertFalse(generatedTripItem.isPacked)
        XCTAssertEqual(generatedTripItem.ownership, .owned)
        
        XCTAssertNil(generatedTripItem.notes)
        
        XCTAssertEqual(generatedTripItem.sourcePackItem?.id, spesificItem.id)
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

private final class PackItemRepositoryStub: PackItemRepository {
    
    var generalItemToBeReturn: [PackItem] = []
    
    func fetchGeneralItems() throws -> [PackItem] {
        generalItemToBeReturn
    }
    
    func fetchMountainSpesificItems(for mountain: Mountain) throws -> [PackItem] {
        []
    }
    
    
}
