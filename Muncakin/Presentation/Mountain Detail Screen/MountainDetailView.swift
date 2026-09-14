//
//  MountainDetailScreen.swift
//  Challenge2Juan
//
//  Created by Juan Fausta Pringadi on 23/04/26.
//

import SwiftUI
import SwiftData

struct MountainDetailView: View {
    
    @State var viewModel: MountainDetailViewModel
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Image(viewModel.mountain.imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: .infinity)
                    .clipped()

                VStack(alignment: .leading, spacing: 20) {

                    VStack(alignment: .leading, spacing: 12) {
                        Text(viewModel.mountain.name)
                            .font(.largeTitle).bold()

                        HStack(spacing: 16) {
                            Label(viewModel.mountain.location, systemImage: "mappin.circle.fill")
                            Label("\(viewModel.mountain.height)m", systemImage: "mountain.2.fill")
                            Label("Min. \(viewModel.mountain.minimumHikeDuration) hari",
                                  systemImage: "clock.fill")
                        }
                        .font(.subheadline)
                        .foregroundStyle(.secondary)

                        if viewModel.mountain.grade.label == "Grade I" {
                            Text(viewModel.mountain.grade.label)
                                .font(.caption).bold()
                                .padding(.horizontal, 10)
                                .padding(.vertical, 4)
                                .background(.green.opacity(0.15))
                                .foregroundStyle(.green)
                                .clipShape(Capsule())
                        }
                        else if viewModel.mountain.grade.label == "Grade II" {
                            Text(viewModel.mountain.grade.label)
                                .font(.caption).bold()
                                .padding(.horizontal, 10)
                                .padding(.vertical, 4)
                                .background(.blue.opacity(0.15))
                                .foregroundStyle(.blue)
                                .clipShape(Capsule())
                        }
                        else if viewModel.mountain.grade.label == "Grade III" {
                            Text(viewModel.mountain.grade.label)
                                .font(.caption).bold()
                                .padding(.horizontal, 10)
                                .padding(.vertical, 4)
                                .background(.yellow.opacity(0.15))
                                .foregroundStyle(.yellow)
                                .clipShape(Capsule())
                        }
                        else if viewModel.mountain.grade.label == "Grade IV" {
                            Text(viewModel.mountain.grade.label)
                                .font(.caption).bold()
                                .padding(.horizontal, 10)
                                .padding(.vertical, 4)
                                .background(.orange.opacity(0.15))
                                .foregroundStyle(.orange)
                                .clipShape(Capsule())
                        }
                        else if viewModel.mountain.grade.label == "Grade V" {
                            Text(viewModel.mountain.grade.label)
                                .font(.caption).bold()
                                .padding(.horizontal, 10)
                                .padding(.vertical, 4)
                                .background(.red.opacity(0.15))
                                .foregroundStyle(.red)
                                .clipShape(Capsule())
                        }
                    }

                    Divider()

                    if !viewModel.mountain.specificItems.isEmpty {
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Barang Wajib Tambahan")
                                .font(.headline)

                            ForEach(viewModel.mountain.specificItems) { item in
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

                        Stepper("Jumlah Pendaki: \(viewModel.numberOfHikers)",
                                value: $viewModel.numberOfHikers, in: 1...50)

                        DatePicker("Tanggal Mulai",
                                   selection: $viewModel.startDate,
                                   in: Date.now...,
                                   displayedComponents: .date)
                        // Jika startDate berubah, pastikan endDate tidak lebih kecil
                        .onChange(of: viewModel.startDate) {
                            if viewModel.endDate < viewModel.minimumEndDate {
                                viewModel.endDate = viewModel.minimumEndDate
                            }
                        }

                        DatePicker("Tanggal Selesai",
                                   selection: $viewModel.endDate,
                                   in: viewModel.minimumEndDate...,
                                   displayedComponents: .date)
                    }
                    
                    Spacer()
                    
                    Button {
                        do {
                            let newTrip = try viewModel.createTrip()
                            
                           NotificationsManager.shared.schedulePackingReminder(for: newTrip)

                            NotificationsManager.shared.scheduleFinishReminder(for: newTrip)
                            
                            dismiss()
                        } catch {
                            
                        }
                        
                    } label: {
                        Text("Mulai Packing")
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(viewModel.isTripValid ? .green : Color.gray.opacity(0.3))
                            .foregroundStyle(viewModel.isTripValid ? .white : .gray)
                            .clipShape(RoundedRectangle(cornerRadius: 60))
                    }
                    .disabled(!viewModel.isTripValid)
                }
                .padding()
            }
        }
        .ignoresSafeArea(edges: .top)
    }
}


