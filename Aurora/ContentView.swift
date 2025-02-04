//  ContentView.swift
//  Aurora
//
//  Created by Tony Bautista on 11/16/24.
//
//
import SwiftUI

struct ContentView: View {
    @EnvironmentObject var textSizeManager: TextSizeManager // Use global text size manager

    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                        .font(.system(size: 14 * textSizeManager.textSize))
                }
            DevicesView()
                .tabItem {
                    Image(systemName: "antenna.radiowaves.left.and.right")
                    Text("Devices")
                        .font(.system(size: 14 * textSizeManager.textSize))
                }
            CaptionsView()
                .tabItem {
                    Image(systemName: "text.bubble")
                    Text("Captions")
                        .font(.system(size: 14 * textSizeManager.textSize))
                }
            SoundSettingsView()
                .tabItem {
                    Image(systemName: "slider.horizontal.3")
                    Text("Sound")
                        .font(.system(size: 14 * textSizeManager.textSize))
                }
            ProfileView()
                .tabItem {
                    Image(systemName: "person")
                    Text("Profile")
                        .font(.system(size: 14 * textSizeManager.textSize))
                }
        }
        .environmentObject(textSizeManager) // Pass environment object
    }
}


