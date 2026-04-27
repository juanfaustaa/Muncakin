//
//  MountainDetailScreen.swift
//  Challenge2Juan
//
//  Created by Juan Fausta Pringadi on 23/04/26.
//

import SwiftUI
import SwiftData

struct MountainDetailView: View {
    let mountain: Mountain

    @Environment(\.modelContext) var context
    @Environment(\.dismiss) var dismiss

    @State private var startDate = Date.now
    @State private var endDate = Date.now
    @State private var numberOfHikers = 1

    // endDate minimum = startDate + minimumHikeDuration
    private var minimumEndDate: Date {
        Calendar.current.date(
            byAdding: .day,
            value: mountain.minimumHikeDuration,
            to: startDate
        ) ?? startDate
    }

    // Tombol aktif hanya jika endDate >= minimumEndDate
    private var isFormValid: Bool {
        endDate >= minimumEndDate && numberOfHikers >= 1
    }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Image(mountain.imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: .infinity)
                    .clipped()

                VStack(alignment: .leading, spacing: 20) {

                    VStack(alignment: .leading, spacing: 12) {
                        Text(mountain.name)
                            .font(.largeTitle).bold()

                        HStack(spacing: 16) {
                            Label(mountain.location, systemImage: "mappin.circle.fill")
                            Label("\(mountain.height)m", systemImage: "mountain.2.fill")
                            Label("Min. \(mountain.minimumHikeDuration) hari",
                                  systemImage: "clock.fill")
                        }
                        .font(.subheadline)
                        .foregroundStyle(.secondary)

                        if mountain.grade.label == "Grade I" {
                            Text(mountain.grade.label)
                                .font(.caption).bold()
                                .padding(.horizontal, 10)
                                .padding(.vertical, 4)
                                .background(.green.opacity(0.15))
                                .foregroundStyle(.green)
                                .clipShape(Capsule())
                        }
                        else if mountain.grade.label == "Grade II" {
                            Text(mountain.grade.label)
                                .font(.caption).bold()
                                .padding(.horizontal, 10)
                                .padding(.vertical, 4)
                                .background(.blue.opacity(0.15))
                                .foregroundStyle(.blue)
                                .clipShape(Capsule())
                        }
                        else if mountain.grade.label == "Grade III" {
                            Text(mountain.grade.label)
                                .font(.caption).bold()
                                .padding(.horizontal, 10)
                                .padding(.vertical, 4)
                                .background(.yellow.opacity(0.15))
                                .foregroundStyle(.yellow)
                                .clipShape(Capsule())
                        }
                        else if mountain.grade.label == "Grade IV" {
                            Text(mountain.grade.label)
                                .font(.caption).bold()
                                .padding(.horizontal, 10)
                                .padding(.vertical, 4)
                                .background(.orange.opacity(0.15))
                                .foregroundStyle(.orange)
                                .clipShape(Capsule())
                        }
                        else if mountain.grade.label == "Grade V" {
                            Text(mountain.grade.label)
                                .font(.caption).bold()
                                .padding(.horizontal, 10)
                                .padding(.vertical, 4)
                                .background(.red.opacity(0.15))
                                .foregroundStyle(.red)
                                .clipShape(Capsule())
                        }
                    }

                    Divider()

                    if !mountain.specificItems.isEmpty {
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Barang Wajib Tambahan")
                                .font(.headline)

                            ForEach(mountain.specificItems) { item in
                                HStack {
                                    Image(systemName: "checkmark.seal.fill")
                                        .foregroundStyle(.orange)
                                    Text(item.name)
                                        .font(.subheadline)
                                    Spacer()
                                    Text(item.category.label)
                                        .font(.caption)
                                        .foregroundStyle(.secondary)
                                }
                                .padding(.vertical, 4)
                            }
                        }

                        Divider()
                    }

                    VStack(alignment: .leading, spacing: 12) {
                        Text("Detail Pendakian")
                            .font(.headline)

                        Stepper("Jumlah Pendaki: \(numberOfHikers)",
                                value: $numberOfHikers, in: 1...50)

                        DatePicker("Tanggal Mulai",
                                   selection: $startDate,
                                   in: Date.now...,
                                   displayedComponents: .date)
                        // Jika startDate berubah, pastikan endDate tidak lebih kecil
                        .onChange(of: startDate) {
                            if endDate < minimumEndDate {
                                endDate = minimumEndDate
                            }
                        }

                        DatePicker("Tanggal Selesai",
                                   selection: $endDate,
                                   in: minimumEndDate...,
                                   displayedComponents: .date)
                    }
                    
                    Spacer()
                    
                    Button {
                        let trip = TripService.createTrip(
                            mountain: mountain,
                            startDate: startDate,
                            endDate: endDate,
                            numberOfHikers: numberOfHikers,
                            context: context
                        )
                        
                        NotificationsManager.shared.schedulePackingReminder(for: trip)
                        
                        NotificationsManager.shared.scheduleFinishReminder(for: trip)
                        
                        dismiss()
                    } label: {
                        Text("Mulai Packing")
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(isFormValid ? .green : Color.gray.opacity(0.3))
                            .foregroundStyle(isFormValid ? .white : .gray)
                            .clipShape(RoundedRectangle(cornerRadius: 60))
                    }
                    .disabled(!isFormValid)
                }
                .padding()
            }
        }
        .ignoresSafeArea(edges: .top)
    }
}


