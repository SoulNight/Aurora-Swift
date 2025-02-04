//  ContentView.swift
//  Aurora
//
//  Created by Tony Bautista on 11/16/24.
//

import SwiftUI

@main
struct AuroraApp: App {
    @StateObject private var textSizeManager = TextSizeManager() // Global state for text size

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(textSizeManager) // Provide the environment object
        }
    }
}

// Global Text Size Manager
class TextSizeManager: ObservableObject {
    @Published var textSize: Double = 1.0
}
