//  HomeView.swift
//  Aurora
//
//  Created by Tony Bautista on 11/16/24.

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var textSizeManager: TextSizeManager // Use global text size manager
    @State private var leftVolume: Double = 0.5
    @State private var rightVolume: Double = 0.5
    @State private var isMuted: Bool = false
    @State private var selectedPreset: String = "Automatic"
    @State private var favoritePresets: [String: Bool] = [
        "Automatic": false,
        "Restaurant": false,
        "Music": false,
        "TV": false,
        "Calm Situation": false
    ]

    @State private var showSoundSettings = false
    @State private var showDisconnectDialog = false // State for showing alert
    @State private var showDeviceSelectionSheet = false // State for showing custom sheet
    @State private var devices = ["Hearing Aid Left", "Hearing Aid Right", "Bluetooth Pencil"]
    @State private var selectedDevices = Set<String>() // Track selected devices

    let presets = ["Automatic", "Restaurant", "Music", "TV", "Calm Situation"]
    let presetDescriptions: [String: String] = [
        "Automatic": "Adaptive settings for all environments.",
        "Restaurant": "Filters background noise for conversations.",
        "Music": "Optimized for clear music tones.",
        "TV": "Enhanced dialogue clarity for watching TV.",
        "Calm Situation": "Balanced audio for quiet environments."
    ]

    var body: some View {
        VStack(spacing: 20) {
            // Presets Row with Highlight for Selected Box
            VStack(spacing: 10) { // Add spacing for the description
                HStack(spacing: 12) {
                    ForEach(presets, id: \.self) { preset in
                        VStack(spacing: 4) { // Ensure spacing between icon and text
                            Button(action: {
                                favoritePresets[preset]?.toggle()
                            }) {
                                Image(systemName: "star.fill")
                                    .foregroundColor(favoritePresets[preset] == true ? .yellow : .white)
                                    .font(.system(size: 18 * textSizeManager.textSize))
                            }
                            Button(action: {
                                selectedPreset = preset
                            }) {
                                Text(preset)
                                    .font(.system(size: 14 * textSizeManager.textSize, weight: .bold))
                                    .foregroundColor(selectedPreset == preset ? .white : .gray)
                            }
                        }
                        .padding(.horizontal, 16)
                        .padding(.vertical, 12)
                        .background(
                            selectedPreset == preset
                                ? Color.black
                                : Color.black.opacity(0.2)
                        )
                        .cornerRadius(16)
                        .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(selectedPreset == preset ? Color.white : Color.clear, lineWidth: 2)
                        )
                    }
                }
                .padding(.horizontal)

                // Add description below the preset row
                if let description = presetDescriptions[selectedPreset] {
                    Text(description)
                        .font(.system(size: 14 * textSizeManager.textSize))
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)
                        .padding(.top, 4)
                }
            }

            Spacer()

            // Hearing Aid Volume Sliders with Dynamic Markers
            HStack(spacing: 40) {
                // Left Volume Slider
                VStack {
                    Text("Hearing Aid Volume (Left)")
                        .font(.system(size: 16 * textSizeManager.textSize))
                        .foregroundColor(.gray)
                        .padding(.bottom, 70) // Space below the label

                    ZStack {
                        // Slider labels and slider
                        VStack {
                            // Top label (100)
                            Text("100")
                                .font(.system(size: 12 * textSizeManager.textSize))
                                .foregroundColor(.gray)
                                .offset(y: -65) // Fine-tune upward
                                .padding(.bottom, 16) // Push higher for alignment

                            // Slider
                            Slider(value: $leftVolume, in: 0...1)
                                .rotationEffect(.degrees(-90)) // Vertical slider
                                .frame(height: 200) // Slider height
                                .accentColor(.green)

                            // Bottom label (0)
                            Text("0")
                                .font(.system(size: 12 * textSizeManager.textSize))
                                .foregroundColor(.gray)
                                .offset(y: 65) // Fine-tune downward
                                .padding(.top, 16) // Push lower for alignment
                        }
                    }

                    // Volume and Battery Indicators Below Slider
                    VStack(spacing: 5) {
                        Text("Volume: \(Int(leftVolume * 100))%")
                            .foregroundColor(.green)
                            .font(.system(size: 12 * textSizeManager.textSize))
                        HStack(spacing: 5) {
                            Image(systemName: "battery.100")
                                .font(.system(size: 14 * textSizeManager.textSize))
                                .foregroundColor(.green)
                            Text("85%")
                                .font(.system(size: 12 * textSizeManager.textSize))
                                .foregroundColor(.gray)
                        }
                    }
                    .padding(.top, 60) // Space between slider and indicators
                }

                // Right Volume Slider
                VStack {
                    Text("Hearing Aid Volume (Right)")
                        .font(.system(size: 16 * textSizeManager.textSize))
                        .foregroundColor(.gray)
                        .padding(.bottom, 80) // Space below the label

                    ZStack {
                        // Slider labels and slider
                        VStack {
                            // Top label (100)
                            Text("100")
                                .font(.system(size: 12 * textSizeManager.textSize))
                                .foregroundColor(.gray)
                                .offset(y: -65) // Fine-tune upward
                                .padding(.bottom, 16) // Push higher for alignment

                            // Slider
                            Slider(value: $rightVolume, in: 0...1)
                                .rotationEffect(.degrees(-90)) // Vertical slider
                                .frame(height: 200) // Slider height
                                .accentColor(.green)

                            // Bottom label (0)
                            Text("0")
                                .font(.system(size: 12 * textSizeManager.textSize))
                                .foregroundColor(.gray)
                                .offset(y: 65) // Fine-tune downward
                                .padding(.top, 16) // Push lower for alignment
                        }
                    }

                    // Volume and Battery Indicators Below Slider
                    VStack(spacing: 5) {
                        Text("Volume: \(Int(rightVolume * 100))%")
                            .foregroundColor(.green)
                            .font(.system(size: 12 * textSizeManager.textSize))
                        HStack(spacing: 5) {
                            Image(systemName: "battery.75")
                                .font(.system(size: 14 * textSizeManager.textSize))
                                .foregroundColor(.yellow)
                            Text("75%")
                                .font(.system(size: 12 * textSizeManager.textSize))
                                .foregroundColor(.gray)
                        }
                    }
                    .padding(.top, 60) // Space between slider and indicators
                }
            }
            .padding(.bottom, 100)

            Spacer()

            // Mute, Adjust Program, and Disconnect Buttons
            HStack(spacing: 20) {
                Button(action: {
                    isMuted.toggle()
                }) {
                    VStack {
                        Image(systemName: isMuted ? "speaker.slash.fill" : "speaker.wave.2.fill")
                            .font(.system(size: 24 * textSizeManager.textSize))
                            .foregroundColor(.white)
                        Text("Mute")
                            .font(.system(size: 12 * textSizeManager.textSize))
                            .foregroundColor(.white)
                    }
                    .padding()
                    .frame(width: 70, height: 70)
                    .background(isMuted ? Color.green : Color.red) // Toggle between green and red
                    .cornerRadius(35)
                    .shadow(radius: 3)
                }

                Button(action: {
                    showSoundSettings = true
                }) {
                    Text("Adjust Program")
                        .font(.system(size: 16 * textSizeManager.textSize))
                        .frame(maxWidth: .infinity, minHeight: 60)
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(30)
                        .shadow(radius: 3)
                }
                .sheet(isPresented: $showSoundSettings) {
                    SoundSettingsView()
                        .environmentObject(textSizeManager)
                }

                Button(action: {
                    showDisconnectDialog = true // Show the dialog
                }) {
                    VStack {
                        Image(systemName: "power")
                            .font(.system(size: 24 * textSizeManager.textSize))
                            .foregroundColor(.white)
                        Text("Disconnect All")
                            .font(.system(size: 12 * textSizeManager.textSize))
                            .foregroundColor(.white)
                    }
                    .padding()
                    .frame(width: 70, height: 70)
                    .background(Color.gray)
                    .cornerRadius(35)
                    .shadow(radius: 3)
                }
                .alert(isPresented: $showDisconnectDialog) {
                    Alert(
                        title: Text("Disconnect Devices"),
                        message: Text("Would you like to disconnect all devices or choose specific devices?"),
                        primaryButton: .destructive(Text("Disconnect All"), action: {
                            disconnectAllDevices()
                        }),
                        secondaryButton: .default(Text("Choose Devices"), action: {
                            showDeviceSelectionSheet = true
                        })
                    )
                }
            }
            .padding(.horizontal, 16)
            .padding(.bottom, 16)
        }
        .sheet(isPresented: $showDeviceSelectionSheet) {
            DeviceSelectionView(devices: $devices, selectedDevices: $selectedDevices)
        }
        .padding()
        .navigationTitle("Home")
    }

    // Function to disconnect all devices
    func disconnectAllDevices() {
        print("All devices have been disconnected.")
        // Add actual logic to disconnect all devices
    }
}

