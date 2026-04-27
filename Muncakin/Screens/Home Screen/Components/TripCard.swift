//
//  TripCard.swift
//  Challenge2Juan
//
//  Created by Juan Fausta Pringadi on 23/04/26.
//

import SwiftUI
import Foundation
import SwiftData

struct TripCard: View {
    
    let trip: Trip
    
    private var dateRange: String {
        let fmt = DateFormatter()
        fmt.locale = Locale(identifier: "id_ID")
        fmt.dateFormat = "dd MMMM yyyy"
        return "\(fmt.string(from: trip.startDate)) - \(fmt.string(from: trip.endDate))"
    }
    
    var body: some View {
        ZStack (alignment: .topLeading){
            Image(trip.mountain?.imageName ?? "mountain_placeholder")
                .resizable()
                .scaledToFill()
                .frame(width: 362, height: 160)
                .clipped()
            
            LinearGradient (
                colors: [.clear, .black.opacity(0.75)],
                startPoint: .top,
                endPoint: .bottom
            )
            
            VStack (alignment: .leading, spacing: 4){
                if trip.startDate <= Date.now && trip.endDate >= Date.now {
                    Text("Sedang Berlangsung")
                        .font(.title2)
                        .bold()
                        .foregroundStyle(.white)
                        .kerning(0.5)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 4)
                        .background(.orange.opacity(0.75))
                        .clipShape(Capsule())
                }
                else {
                    Text("Pendakian Selanjutnya")
                        .font(.title2)
                        .bold()
                        .foregroundStyle(.white)
                        .kerning(0.5)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 4)
                        .background(.green.opacity(0.5))
                        .clipShape(Capsule())
                }
                
                Spacer()
                
                Text(trip.mountain?.name ?? "nama gunung")
                    .font(.title3)
                    .bold()
                    .foregroundStyle(.white)
                
                Text(dateRange)
                    .font(.caption)
                    .foregroundStyle(.white.opacity(0.85))
            }
            .padding(12)
        }
        .frame(width: 362, height: 160)
        .clipShape(RoundedRectangle(cornerRadius: 14))
    }
}
