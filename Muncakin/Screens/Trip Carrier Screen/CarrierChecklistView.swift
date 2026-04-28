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
    
    private var dateRange: String {
        let fmt = DateFormatter()
        fmt.locale = Locale(identifier: "id_ID")
        fmt.dateFormat = "dd/MM/yy"
        return "\(fmt.string(from: trip.startDate)) - \(fmt.string(from: trip.endDate))"
    }
    
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
                ZStack(alignment: .topLeading) {
                    // Background Image
                    Image(trip.mountain?.imageName ?? "mountain_placeholder")
                        .resizable()
                        .scaledToFill()
                        .frame(maxWidth: .infinity)
                        .frame(height: 168)
                        .clipped()
                    
                    // Gradient overlay
                    LinearGradient(
                        colors: [.clear, .black.opacity(0.75)],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                    
                    // Content
                    VStack(alignment: .leading, spacing: 8) {
                        HStack {
                            Text(trip.mountain?.name ?? "Unknown Mountain")
                                .font(.title2)
                                .bold()
                                .foregroundStyle(.white)
                                .lineLimit(1)
                            
                            Spacer()
                            
                            Text(dateRange)
                                .font(.caption)
                                .bold()
                                .foregroundStyle(.white)
                            
                        }
                        
                        
                        Spacer()
                        
                        HStack {
                            Label(trip.mountain?.location ?? "-", systemImage: "mappin.circle.fill")
                            Spacer()
                            Label("\(trip.mountain?.height ?? 0) mdpl", systemImage: "mountain.2.fill")
                            Spacer()
                            Label("\(trip.mountain?.minimumHikeDuration ?? 0) hari", systemImage: "figure.hiking.circle.fill")
                        }
                        .font(.caption.bold())
                        .foregroundStyle(.white.opacity(0.85))
                        
                        Divider()
                            .overlay(.white.opacity(0.3))
                        
                        if remaining > 0 {
                            Text("‼️ \(remaining) barang belum dipacking!")
                                .font(.subheadline.bold())
                                .foregroundStyle(.white)
                        } else {
                            Text("Kamu siap mendaki 🤩")
                                .font(.subheadline.bold())
                                .foregroundStyle(.white)
                        }
                    }
                    .padding(16)
                }
                .clipShape(RoundedRectangle(cornerRadius: 14))
            }
            .listRowInsets(EdgeInsets())
            .listRowBackground(Color.clear)
            
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
        .navigationTitle("Carrier")
        .navigationSubtitle("Barang disusun dari paling bawah ke atas")
        .listStyle(.insetGrouped)
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

#Preview {
    CarrierChecklistView(trip: Trip(startDate: Date.now, endDate: Date.distantFuture, numberofHikers: 2, isPast: false, mountain: Mountain(name: "Gunung Test", grade: .gradeI, location: "Jawa Tengah", height: 1234, minimumHikeDuration: 2, imageName: "gunung_ijen")))
}
