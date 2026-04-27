//
//  Splash Screen.swift
//  Challenge2Juan
//
//  Created by Juan Fausta Pringadi on 13/04/26.
//

import SwiftUI

struct SplashScreen: View {
    @Environment(\.colorScheme) var colorScheme
    @State private var scale = 0.8
    @State private var opacity = 0.0
    
    var body: some View {
        VStack {
            Image(colorScheme == .dark ? "app_logo_dark" : "app_logo_light")
                .resizable()
                .frame(width: 250, height: 250)
        }
        .scaleEffect(scale)
        .opacity(opacity)
        .onAppear {
            withAnimation(.easeInOut(duration: 0.6)) {
                scale = 1.0
                opacity = 1.0
            }
        }
    }
}

#Preview {
    SplashScreen()
}
