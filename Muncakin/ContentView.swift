//
//  Challenge2JuanApp.swift
//  Challenge2Juan
//
//  Created by Juan Fausta Pringadi on 10/04/26.
//

import SwiftUI
import SwiftData

@main
struct ContentView: App {
    @AppStorage("hasSeenOnboarding") private var hasSeenOnboarding: Bool = false
    
    let container: ModelContainer = {
        let schema = Schema([
            Mountain.self,
            PackItem.self,
            Trip.self,
            TripItem.self
        ])
        
        let config = ModelConfiguration(
            schema: schema,
            isStoredInMemoryOnly: false
        )
        
        do {
            let container = try ModelContainer(for: schema, configurations: [config])
            
            let hasSeeded = UserDefaults.standard.bool(forKey: "hasSeededData")
            
            if !hasSeeded {
                let context = ModelContext(container)
                SeedData.seed(context: context)
                UserDefaults.standard.set(true, forKey: "hasSeededData")
            }
            
            return container
            
        } catch {
            fatalError("Failed to create ModelContainer: \(error)")
        }
        
    }()
    
    @State private var showSplash: Bool = true
    
    var body: some Scene {
        WindowGroup {
            ZStack {
                if showSplash {
                    SplashScreen()
                        .transition(.opacity)
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                                showSplash = false
                            }
                        }
                } else {
                    HomeView()
                        .transition(.opacity)  // fade in saat muncul
                        .onAppear {
                            NotificationsManager.shared.requestPermission()
                        }
                        .sheet(isPresented: .constant(!hasSeenOnboarding)) {
                            OnboardingSheet(hasSeenOnboarding: $hasSeenOnboarding)
                        }
                }
            }
            .animation(.easeInOut(duration: 0.6), value: showSplash)
        }
        .modelContainer(container)
    }
}
