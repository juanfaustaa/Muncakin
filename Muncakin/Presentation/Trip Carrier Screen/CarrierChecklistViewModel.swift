//
//  TripCarrierViewModel.swift
//  Muncakin
//
//  Created by Juan Fausta Pringadi on 02/09/26.
//

import Foundation

@Observable
final class CarrierChecklistViewModel {
    private let tripUseCase: TripUseCase
    var trip: Trip
    
    init(tripUseCase: TripUseCase, trip: Trip){
        self.tripUseCase = tripUseCase
        self.trip = trip
    }
    
    var showAddItem = false
    var showFinishAlert = false
    var showCancelAlert = false
    
    var editTripItem: TripItem?
    var isWantToDelete: Bool = false
    
    func isDeleteable(_ item: TripItem) -> Bool {
        return (item.layer == .additional || item.layer == .essentialOptional)
    }
    
    var dateRange: String {
        let fmt = DateFormatter()
        fmt.locale = Locale(identifier: "id_ID")
        fmt.dateFormat = "dd/MM/yy"
        return "\(fmt.string(from: trip.startDate)) - \(fmt.string(from: trip.endDate))"
    }
    
    var isEnableComplete: Bool {
        return Date.now >= trip.endDate
    }
    
    var remaining: Int {
        totalCount - checkedCount
    }
    
    var checkedCount: Int {
        trip.items
            .filter { $0.isPacked }
            .count
    }
    
    var totalCount: Int {
        trip.items.count
    }
    
    func items(for category: ItemCategories) -> [TripItem] {
        trip.items
            .filter { $0.category == category }
            .sorted { lhs, rhs in
                lhs.isPacked == rhs.isPacked ? lhs.layer.sortPriority < rhs.layer.sortPriority : !lhs.isPacked
            }
    }
    
    private func isCategoryFullyPacked(_ category: ItemCategories) -> Bool {
        let items = items(for: category)
        
        return !items.isEmpty && items.allSatisfy { $0.isPacked }
    }
    
    var sortedCategories: [ItemCategories] {
        ItemCategories.allCases
            .filter {
                !items(for: $0).isEmpty
            }
            .sorted{ lhs, rhs in
                let lhsPacked = isCategoryFullyPacked(lhs)
                let rhsPacked = isCategoryFullyPacked(rhs)
                
                return !lhsPacked && rhsPacked
            }
    }
    
    var hikeDuration: Int {
        let calendar = Calendar.current
        
        let startDate = calendar.startOfDay(for: trip.startDate)
        let endDate = calendar.startOfDay(for: trip.endDate)
        
        let dayDifference = calendar.dateComponents(
            [.day],
            from: startDate,
            to: endDate
        ).day ?? 0
        
        return dayDifference + 1
    }
    
    func togglePacked(_ item: TripItem){
        var updatedItem = item
        updatedItem.isPacked.toggle()
        
        do {
            try tripUseCase.updateItem(updatedItem, from: trip)
            
            guard let index = trip.items.firstIndex(where: {
                $0.id == item.id
            }) else {
                return
            }
            
            trip.items[index] = updatedItem
            
        } catch {
            // later
        }
    }
    
    func applyUpdatedItem(_ updatedItem: TripItem) {
        guard let index = trip.items.firstIndex(where: {
            $0.id == updatedItem.id
        }) else {
            return
        }
        
        trip.items[index] = updatedItem
    }
    
    func applyAddedItem(_ newItem: TripItem) {
        trip.items.append(newItem)
    }
    
    func deleteItem(_ item: TripItem) {
        guard let index = trip.items.firstIndex(where: {
            $0.id == item.id
        }) else {
            return
        }
        
        do {
            let removedItem = trip.items[index]
            try tripUseCase.deleteItem(removedItem, from: trip)
            trip.items.remove(at: index)
        } catch {
            //
        }
    }
    
    func deleteTrip() throws {
        try tripUseCase.deleteTrip(trip: trip)
    }
}
