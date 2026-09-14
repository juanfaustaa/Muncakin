//
//  HomeScreen.swift
//  Challenge2Juan
//
//  Created by Juan Fausta Pringadi on 13/04/26.
//

import SwiftUI

struct HomeView: View {

    @State var viewModel: HomeViewModel
    let dependencies: AppDependencies
    
    var body: some View {
        @Bindable var viewmodel = viewModel
        NavigationStack {
            Group {
                if viewmodel.isLoading {
                    ProgressView()
                } else if let errorMessage = viewmodel.errorMessage {
                    Text(errorMessage)
                } else {
                    homeContent
                }
            }
            .navigationTitle("Pendakian")
            .searchable(
                text: $viewmodel.searchQuery,
                prompt: "Mau naik gunung apa?"
            )
            .task {
                viewmodel.loadData()
            }
        }
    }

    private var homeContent: some View {
        ScrollView {
            upcomingTripsSection
            mountainsSection
        }
    }

    @ViewBuilder
    private var upcomingTripsSection: some View {
        if !viewModel.trips.isEmpty {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    ForEach(viewModel.trips) { trip in
                        NavigationLink {
                            CarrierChecklistView(
                                viewModel: dependencies.makeCarrierChecklistViewModel(trip: trip),
                                dependencies: dependencies,
                                onDelete: { deletedTrip in
                                    viewModel.removeDeletedTrip(trip: deletedTrip)
                                }
                            )
                        } label: {
                            TripCard(trip: trip)
                        }
                    }
                }
                .padding(.horizontal)
            }
        }
    }

    private var mountainsSection: some View {
        ForEach(MountainGrades.allCases, id: \.self) { (grade: MountainGrades) in

            let mountains = viewModel.searchedMountains.filter { mountain in
                mountain.grade == grade
            }

            if !mountains.isEmpty {
                VStack(alignment: .leading, spacing: 8) {

                    gradeHeader(for: grade)

                    ForEach(mountains) { mountain in
                        NavigationLink {
                            MountainDetailView(viewModel: dependencies.makeMountainDetailViewModel(mountain: mountain))
                        } label: {
                            MountainCard(mountain: mountain)
                                .padding(.vertical, 4)
                        }
                    }
                }
                .padding(.bottom, 12)
                .padding(.horizontal)
            }
        }
    }

    private func gradeHeader(for grade: MountainGrades) -> some View {
        HStack {
            Text(grade.label)
                .font(.title2)
                .bold()

            Spacer()

            gradeBadge(for: grade)
        }
    }

    @ViewBuilder
    private func gradeBadge(for grade: MountainGrades) -> some View {
        switch grade {
        case .gradeI:
            badge("Sangat Mudah", color: .green)

        case .gradeII:
            badge("Mudah", color: .blue)

        case .gradeIII:
            badge("Menengah", color: .yellow)

        case .gradeIV:
            badge("Berat", color: .orange)

        case .gradeV:
            badge("Sangat Berat", color: .red)
        }
    }

    private func badge(
        _ title: String,
        color: Color
    ) -> some View {
        Text(title)
            .font(.caption)
            .bold()
            .padding(.horizontal, 10)
            .padding(.vertical, 4)
            .background(color.opacity(0.15))
            .foregroundStyle(color)
            .clipShape(Capsule())
    }
}

//#Preview {
//    let mockMountainRepository = MockMountainRepository()
//    let mockTripRepository = MockTripRepository()
//    let mockPackItemRepository = MockPackItemRepository()
//    
//    let mountainUseCase = MountainUseCase(mountainRepository: mockMountainRepository)
//    
//    let packingListUseCase = GeneratePackingListUseCase(packItemRepository: mockPackItemRepository, mountainRepository: mockMountainRepository)
//    
//    let tripUseCase = TripUseCase(tripRepository: mockTripRepository, packingListUseCase: packingListUseCase)
//    
//    let dependencies = AppDependencies.preview
//    
//    HomeView(viewModel: HomeViewModel(mountainUseCase: mountainUseCase, tripUseCase: tripUseCase), dependencies: dependencies)
//}
