//
//  HomeScreen.swift
//  Challenge2Juan
//
//  Created by Juan Fausta Pringadi on 13/04/26.
//

import SwiftUI
import SwiftData

struct HomeView: View {
    @Query private var mountains: [Mountain]
    @Query private var trips: [Trip]
    @State private var searchQuery = ""
    
    // upcoming trip
    var upcomingTrip: [Trip] {
        trips.filter {
            $0.endDate >= Date.now
        }
        .sorted {
            $0.startDate < $1.startDate
        }
    }
    
    var filteredMountains: [Mountain] {
        guard !searchQuery.isEmpty else {
            return mountains
        }
        return mountains.filter {
            $0.name.localizedCaseInsensitiveContains(searchQuery)
        }
    }
    
    // Screen
    var body: some View {
        NavigationStack {
            ScrollView {
                if !upcomingTrip.isEmpty {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 12) {
                            ForEach(upcomingTrip) { trip in
                                NavigationLink {
                                    CarrierChecklistView(trip: trip)
                                } label: {
                                    TripCard(trip: trip)
                                }
                            }
                        }
                        .padding(.horizontal)
                    }
                }
                
                ForEach(MountainGrades.allCases, id: \.self) { grade in
                    
                    let items = filteredMountains.filter {
                        $0.grade == grade
                    }
                    
                    if !items.isEmpty {
                        VStack(alignment: .leading, spacing: 8) {
                            HStack {
                                Text(grade.label)
                                    .font(.title2)
                                    .bold()
                                Spacer()
                                if grade.label == "Grade I" {
                                    Text("Sangat Mudah")
                                        .font(.caption).bold()
                                        .padding(.horizontal, 10)
                                        .padding(.vertical, 4)
                                        .background(.green.opacity(0.15))
                                        .foregroundStyle(.green)
                                        .clipShape(Capsule())
                                }
                                else if grade.label == "Grade II" {
                                    Text("Mudah")
                                        .font(.caption).bold()
                                        .padding(.horizontal, 10)
                                        .padding(.vertical, 4)
                                        .background(.blue.opacity(0.15))
                                        .foregroundStyle(.blue)
                                        .clipShape(Capsule())
                                }
                                else if grade.label == "Grade III" {
                                    Text("Menengah")
                                        .font(.caption).bold()
                                        .padding(.horizontal, 10)
                                        .padding(.vertical, 4)
                                        .background(.yellow.opacity(0.15))
                                        .foregroundStyle(.yellow)
                                        .clipShape(Capsule())
                                }
                                else if grade.label == "Grade IV" {
                                    Text("Berat")
                                        .font(.caption).bold()
                                        .padding(.horizontal, 10)
                                        .padding(.vertical, 4)
                                        .background(.orange.opacity(0.15))
                                        .foregroundStyle(.orange)
                                        .clipShape(Capsule())
                                }
                                else if grade.label == "Grade V" {
                                    Text("Sangat Berat")
                                        .font(.caption).bold()
                                        .padding(.horizontal, 10)
                                        .padding(.vertical, 4)
                                        .background(.red.opacity(0.15))
                                        .foregroundStyle(.red)
                                        .clipShape(Capsule())
                                }
                            }
                            
                            ForEach(items) { mountain in
                                NavigationLink {
                                    MountainDetailView(mountain: mountain)
                                } label: {
                                    MountainCard(mountain: mountain)
                                        .padding(.vertical, 4)
                                }
                            }
                        }.padding(.bottom, 12)
                            .padding(.horizontal)
                    }
                }
            }
            .navigationTitle("Pendakian")
            .searchable(text: $searchQuery, prompt: "Mau naik gunung apa?")
        }
    }
}
