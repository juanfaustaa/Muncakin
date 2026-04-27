//
//  CarrierChecklistView.swift
//  Challenge2Juan
//
//  Created by Juan Fausta Pringadi on 23/04/26.
//

import SwiftUI
import SwiftData

struct CarrierChecklistView: View {
    let trip: Trip
    
    @Environment(\.modelContext) var context
    @Environment(\.dismiss) var dismiss
    
    @State private var showAddItem = false
    @State private var showFinishAlert = false
    
    var isEnableComplete: Bool {
        return Date.now >= trip.endDate
    }
    
    var remaining: Int {
        trip.totalCount - trip.checkedCount
    }
    
    var body: some View {
        List {
            // Header
            Section {
                if remaining > 0 {
                    Text("\(remaining) barang belum dipacking!")
                        .font(.title3)
                        .bold()
                }
                else {
                    Text("Kamu siap mendaki 🤩")
                        .font(.title3)
                        .bold()
                }
            }
            
            // Items per category
            ForEach(ItemCategories.allCases.sorted { catA, catB in
                
                let aItems = trip.items(in: catA)
                let bItems = trip.items(in: catB)
                
                let aFullyPacked = !aItems.isEmpty && aItems.allSatisfy { $0.isPacked }
                let bFullyPacked = !bItems.isEmpty && bItems.allSatisfy { $0.isPacked }
                
                return !aFullyPacked && bFullyPacked
                
            }, id: \.self) { category in
                let categoryItems = trip.items(in: category).sorted { !$0.isPacked && $1.isPacked }
                if !categoryItems.isEmpty {
                    Section(category.label) {
                        ForEach(categoryItems) { item in
                            TripItemRow(item: item)
                        }
                    }
                }
            }
            
            // Tombol Batalkan
            Section {
                Button(role: .destructive) {
                    showFinishAlert = true
                } label: {
                    Text("Batalkan Pendakian")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .foregroundStyle(.red)
                }
                .alert("Batalkan Pendakian?", isPresented: $showFinishAlert) {
                    Button("Setuju", role: .destructive) {
                        
                        NotificationsManager.shared.cancelNotifications(for: trip)
                        
                        context.delete(trip)
                        
                        dismiss()
                    }
                    Button("Batal", role: .cancel) {}
                } message: {
                    Text("Apakah Anda benar-benar yakin ingin membatalkan pendakian ini?")
                }
            }
        }
        .listStyle(.insetGrouped)
        .navigationTitle("Carrier")
        .navigationSubtitle("Susunan dari paling bawah ke atas")
        .navigationBarTitleDisplayMode(.large)
        .toolbar {
            
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    showAddItem = true
                } label: {
                    Text("Selesaikan Pendakian")
                }
                .disabled(!isEnableComplete)
                .tint(isEnableComplete ? .green : .gray)
                .alert("Selesaikan Pendakian?", isPresented: $showFinishAlert) {
                    Button("Setuju", role: .destructive) {
                        
                        NotificationsManager.shared.cancelNotifications(for: trip)
                        
                        context.delete(trip)
                        
                        dismiss()
                    }
                    Button("Batal", role: .cancel) {}
                } message: {
                    Text("Apakah Anda benar-benar sudah menyelesaikan pendakian ini?")
                }
            }
            
            ToolbarSpacer()
            
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    showAddItem = true
                } label: {
                    Image(systemName: "plus")
                }
                .tint(.green)
                .buttonStyle(.borderedProminent)
            }
            
        }
        .sheet(isPresented: $showAddItem) {
            AddTripItemView(trip: trip)
        }
    }
}
