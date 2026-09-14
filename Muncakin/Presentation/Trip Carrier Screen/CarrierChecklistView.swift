//
//  CarrierChecklistView.swift
//  Challenge2Juan
//
//  Created by Juan Fausta Pringadi on 23/04/26.
//

import SwiftUI
import SwiftData

struct CarrierChecklistView: View {
    
    @Environment(\.dismiss) var dismiss
    @State var viewModel: CarrierChecklistViewModel
    let dependencies: AppDependencies
    let onDelete: (Trip) -> Void
    
    var body: some View {
        @Bindable var viewModel = viewModel
        List {
            // Header
            Section {
                ZStack(alignment: .topLeading) {
                    // Background Image
                    Image(viewModel.trip.mountain.imageName)
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
                            Text(viewModel.trip.mountain.name)
                                .font(.title2)
                                .bold()
                                .foregroundStyle(.white)
                                .lineLimit(1)
                            
                            Spacer()
                            
                            Text(viewModel.dateRange)
                                .font(.caption)
                                .bold()
                                .foregroundStyle(.white)
                            
                        }
                        
                        
                        Spacer()
                        
                        HStack {
                            Label(viewModel.trip.mountain.location, systemImage: "mappin.circle.fill")
                            Spacer()
                            Label("\(viewModel.trip.mountain.height) mdpl", systemImage: "mountain.2.fill")
                            Spacer()
                            Label("\(viewModel.hikeDuration) hari", systemImage: "figure.hiking.circle.fill")
                        }
                        .font(.caption.bold())
                        .foregroundStyle(.white.opacity(0.85))
                        
                        Divider()
                            .overlay(.white.opacity(0.3))
                        
                        if viewModel.remaining > 0 {
                            Text("‼️ \(viewModel.remaining) barang belum dipacking!")
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
            ForEach(viewModel.sortedCategories, id: \.self) { category in
                categorySection(for: category)
            }
            
            // Tombol Batalkan
            Section {
                Button(role: .destructive) {
                    viewModel.showCancelAlert = true
                } label: {
                    Text("Batalkan Pendakian")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .foregroundStyle(.red)
                }
                .alert("Batalkan Pendakian?", isPresented: $viewModel.showCancelAlert) {
                    Button("Setuju", role: .destructive) {
                        
                        //                        NotificationsManager.shared.cancelNotifications(for: trip)
                        
                        //                        context.delete(trip)
                        
                        do {
                            let deletedTrip = viewModel.trip
                            try viewModel.deleteTrip()
                            onDelete(deletedTrip)
                            dismiss()
                        } catch {
                            
                        }
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
                    viewModel.showFinishAlert = true
                } label: {
                    Text("Selesaikan Pendakian")
                }
                .disabled(!viewModel.isEnableComplete)
                .tint(viewModel.isEnableComplete ? .green : .gray)
                .alert("Selesaikan Pendakian?", isPresented: $viewModel.showFinishAlert) {
                    Button("Setuju", role: .destructive) {
                        do {
                            let finishedTrip = viewModel.trip
                            NotificationsManager.shared.cancelNotifications(for: finishedTrip)
                            try viewModel.deleteTrip()
                            onDelete(finishedTrip)
                            dismiss()
                        } catch {
                            
                        }
                    }
                    Button("Batal", role: .cancel) {}
                } message: {
                    Text("Apakah Anda benar-benar sudah menyelesaikan pendakian ini?")
                }
            }
            
            ToolbarSpacer()
            
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    viewModel.showAddItem = true
                } label: {
                    Image(systemName: "plus")
                }
                .tint(.green)
                .buttonStyle(.borderedProminent)
            }
            
        }
        .sheet(isPresented: $viewModel.showAddItem) {
            AddTripItemView(
                viewModel: dependencies.makeAddTripItemViewModel(trip: viewModel.trip),
                dependencies: dependencies,
                onSaved: { newItem in
                    viewModel.applyAddedItem(newItem)
                }
            )
        }
    }
    
    @ViewBuilder
    private func categorySection(
        for category: ItemCategories
    ) -> some View {
        Section(category.label) {
            ForEach(viewModel.items(for: category)) { item in
                itemRow(for: item)
            }
        }
    }
    
    @ViewBuilder
    private func itemRow(for item: TripItem) -> some View {
        TripItemRow(
            item: item,
            trip: viewModel.trip,
            onToggle: {
                viewModel.togglePacked(item)
            },
            onDelete: {
                viewModel.deleteItem(item)
            },
            isDeleteable: { _ in
                viewModel.isDeleteable(item)
            },
            onItemUpdated: { _ in
                viewModel.applyUpdatedItem(item)
            },
            dependencies: dependencies
        )
    }
}

//#Preview {
//    CarrierChecklistView(trip: Trip(startDate: Date.now, endDate: Date.distantFuture, numberofHikers: 2, isPast: false, mountain: Mountain(name: "Gunung Test", grade: .gradeI, location: "Jawa Tengah", height: 1234, minimumHikeDuration: 2, imageName: "gunung_ijen")))
//}
