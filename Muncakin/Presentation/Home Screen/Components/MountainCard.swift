//
//  MountainCards.swift
//  Challenge2Juan
//
//  Created by Juan Fausta Pringadi on 22/04/26.
//

import Foundation
import SwiftUI

struct MountainCard: View {
    
    let mountain: Mountain
    
    var body: some View {
        ZStack {
            Image(mountain.imageName)
                .resizable()
                .scaledToFill()
                .frame(height: 100)
                .clipped()
            
            LinearGradient(
                colors: [.clear, .black.opacity(0.7)],
                startPoint: .top,
                endPoint: .bottom
            )
            
            VStack (alignment: .leading, spacing: 40){
                Text(mountain.name)
                    .font(.title3.bold())
                    .foregroundStyle(.white)
                    .lineLimit(1) // questionable?? what if nama gunungnya panjang?
                
                HStack() {
                    Label(mountain.location, systemImage: "mappin.circle.fill")
                    Spacer()
                    Label("\(mountain.height) mdpl", systemImage: "mountain.2.fill")
                    Spacer()
                    Label("\(mountain.minimumHikeDuration) hari", systemImage: "figure.hiking.circle.fill")
                }
                .font(.caption)
                .bold()
                .foregroundStyle(.white.opacity(0.85))
            }
            .padding(10)
        }
        .frame(width: 362, height: 100)
        .clipShape(RoundedRectangle(cornerRadius: 14))
    }
}
