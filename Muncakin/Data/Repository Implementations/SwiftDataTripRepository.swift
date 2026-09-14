//
//  SwiftDataTripRepository.swift
//  Muncakin
//
//  Created by Juan Fausta Pringadi on 01/09/26.
//

import Foundation
import SwiftData

enum TripPersistenceError: LocalizedError {
    case mountainNotFound
    case itemNotFound
    case sourcePackItemNotFound
    
    var errorDescription: String? {
        switch self{
        case.mountainNotFound: return "Gunung yang dipilih tidak ditemukan."
        case.itemNotFound: return "Barang tidak ditemukan pada trip ini. Muat ulang daftar barang."
        case.sourcePackItemNotFound: return "Template barang tidak ditemukan."
        }
    }
}

final class SwiftDataTripRepository: TripRepository {
    
    let context: ModelContext
    init(context: ModelContext) {
        self.context = context
    }
    
    func fetchAllTrips() throws -> [Trip] {
        let descriptor = FetchDescriptor<TripModel>()
        let trips = try context.fetch(descriptor)
        
        return trips.map {
            TripMapper.toDomain($0)
        }
    }
    
    func saveTrip(_ trip: Trip) throws {
        let mountainID = trip.mountain.id
        
        let descriptor = FetchDescriptor<MountainModel>(
            predicate: #Predicate { model in
                model.id == mountainID
            }
        )
        
        guard let mountainModel = try context.fetch(descriptor).first else {
            throw TripPersistenceError.mountainNotFound
        }
        
        let tripModel = TripMapper.toModel(
            trip,
            mountain: mountainModel
        )
        
        for (item, itemModel) in zip(trip.items, tripModel.items) {
            itemModel.sourcePackItem = try resolveSourcePackItem(for: item)
        }
        
        context.insert(tripModel)
        try context.save()
    }
    
    func deleteTrip(_ trip: Trip) throws {
        let tripID = trip.id
        
        let descriptor = FetchDescriptor<TripModel>(
            predicate: #Predicate { tripModel in
                tripModel.id == tripID
            }
        )
        
        guard let toBeDeleteTrip = try context.fetch(descriptor).first else {
            return
        }
        
        context.delete(toBeDeleteTrip)
        try context.save()
    }
    
    func addTripItem(_ item: TripItem, to trip: Trip) throws {
        let tripID = trip.id
        
        let descriptor = FetchDescriptor<TripModel>(
            predicate: #Predicate { tripModel in
                tripModel.id == tripID
            }
        )
        
        guard let tripModel = try context.fetch(descriptor).first else {
            return
        }
        
        let tripItemModel = TripItemMapper.toModel(item)
        tripItemModel.sourcePackItem = try resolveSourcePackItem(for: item)

        context.insert(tripItemModel)
        tripItemModel.trip = tripModel

        try context.save()
    }
    
    func deleteTripItem(_ item: TripItem, from trip: Trip) throws {
        let tripID = trip.id
        
        let tripDescriptor = FetchDescriptor<TripModel>(
            predicate: #Predicate { model in
                model.id == tripID
            }
        )
        
        guard let tripModel = try context.fetch(tripDescriptor).first else {
            return
        }
        
        let tripItemID = item.id
        
        let tripItemDescriptor = FetchDescriptor<TripItemModel>(
            predicate: #Predicate { model in
                model.id == tripItemID
            }
        )
        
        guard let index = tripModel.items.firstIndex(
            where: {
                $0.id == tripItemID
            }
        ) else {
            return
        }
        
        let tripItemToBeDelete = tripModel.items[index]
        
        tripModel.items.remove(at: index)
        context.delete(tripItemToBeDelete)
        
        try context.save()
        
    }
    
    func updateTripItem(_ item: TripItem, from trip: Trip) throws {
        let itemID = item.id
        let tripID = trip.id
        
        let descriptor = FetchDescriptor<TripItemModel>(
            predicate: #Predicate { model in
                model.id == itemID &&
                model.trip?.id == tripID
            }
        )
        
        guard let model = try context.fetch(descriptor).first else {
            throw TripPersistenceError.itemNotFound
        }
        
        model.name = item.name
        model.quantity = item.quantity
        model.isPacked = item.isPacked
        model.category = item.category
        model.layer = item.layer
        model.notes = item.notes
        model.ownership = item.ownership
        model.units = item.units
        
        try context.save()
    }
    
    private func resolveSourcePackItem(for item: TripItem) throws -> PackItemModel? {
        guard let source = item.sourcePackItem else {
            return nil
        }
        
        let sourceID = source.id
        let descriptor = FetchDescriptor<PackItemModel>(
            predicate: #Predicate { model in
                model.id == sourceID
            }
        )
        
        guard let model = try context.fetch(descriptor).first else {
            throw TripPersistenceError.sourcePackItemNotFound
        }
        
        return model
    }
}
