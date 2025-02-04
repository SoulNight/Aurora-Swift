//  SoundSettingsView.swift
//  Aurora
//
//  Created by Tony Bautista on 11/16/24.

import SwiftUI

struct SoundSettingsView: View {
    @EnvironmentObject var textSizeManager: TextSizeManager // Use global text size manager

    @State private var noiseSuppression: Double = 0.5
    @State private var amplification: Double = 0.5
    @State private var isAdvancedSettingsEnabled: Bool = false
    @State private var frequencyAdjustment: Double = 0.5
    @State private var leftRightBalance: Double = 0.5

    var body: some View {
        VStack(spacing: 20) {
            // Title
            Text("Sound Settings")
                .font(.system(size: 24 * textSizeManager.textSize, weight: .bold))
                .padding(.top, 20)

            VStack(spacing: 30) {
                // Noise Suppression Control
                VStack(alignment: .leading, spacing: 10) {
                    Text("Noise Suppression")
                        .font(.system(size: 18 * textSizeManager.textSize, weight: .semibold))
                    Slider(value: $noiseSuppression, in: 0...1)
                        .accentColor(.blue)
                    HStack {
                        Text("Low")
                            .font(.system(size: 14 * textSizeManager.textSize))
                            .foregroundColor(.secondary)
                        Spacer()
                        Text("High")
                            .font(.system(size: 14 * textSizeManager.textSize))
                            .foregroundColor(.secondary)
                    }
                }
                .padding(.horizontal, 20)

                // Sound Amplification Control
                VStack(alignment: .leading, spacing: 10) {
                    Text("Sound Amplification")
                        .font(.system(size: 18 * textSizeManager.textSize, weight: .semibold))
                    Slider(value: $amplification, in: 0...1)
                        .accentColor(.blue)
                    HStack {
                        Text("Low")
                            .font(.system(size: 14 * textSizeManager.textSize))
                            .foregroundColor(.secondary)
                        Spacer()
                        Text("High")
                            .font(.system(size: 14 * textSizeManager.textSize))
                            .foregroundColor(.secondary)
                    }
                }
                .padding(.horizontal, 20)

                // Advanced Settings Toggle
                Toggle(isOn: $isAdvancedSettingsEnabled) {
                    Text("Enable Advanced Settings")
                        .font(.system(size: 16 * textSizeManager.textSize))
                        .foregroundColor(.primary)
                }
                .padding(.horizontal, 20)

                // Advanced Settings (if enabled)
                if isAdvancedSettingsEnabled {
                    VStack(alignment: .leading, spacing: 15) {
                        // Frequency Range Adjustment
                        VStack(alignment: .leading) {
                            Text("Frequency Adjustment")
                                .font(.system(size: 18 * textSizeManager.textSize, weight: .semibold))
                            Slider(value: $frequencyAdjustment, in: 0...1)
                                .accentColor(.blue)
                            HStack {
                                Text("Low Frequency")
                                    .font(.system(size: 14 * textSizeManager.textSize))
                                    .foregroundColor(.secondary)
                                Spacer()
                                Text("High Frequency")
                                    .font(.system(size: 14 * textSizeManager.textSize))
                                    .foregroundColor(.secondary)
                            }
                        }

                        // Balance Control
                        VStack(alignment: .leading) {
                            Text("Left/Right Balance")
                                .font(.system(size: 18 * textSizeManager.textSize, weight: .semibold))
                            Slider(value: $leftRightBalance, in: 0...1)
                                .accentColor(.blue)
                            HStack {
                                Text("Left")
                                    .font(.system(size: 14 * textSizeManager.textSize))
                                    .foregroundColor(.secondary)
                                Spacer()
                                Text("Right")
                                    .font(.system(size: 14 * textSizeManager.textSize))
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                    .padding(.horizontal, 20)
                }
            }

            Spacer()

            // Reset to Default Button
            Button(action: {
                noiseSuppression = 0.5
                amplification = 0.5
                frequencyAdjustment = 0.5
                leftRightBalance = 0.5
                isAdvancedSettingsEnabled = false
            }) {
                Text("Reset to Default")
                    .font(.system(size: 18 * textSizeManager.textSize, weight: .semibold))
                    .foregroundColor(.white) // White text for contrast
                    .frame(maxWidth: .infinity, minHeight: 50)
                    .background(Color.red) // Filled red background
                    .cornerRadius(10)
            }
            .padding(.horizontal, 20) // Keep padding outside the button for alignment
        }
        .padding()
        .background(Color(UIColor.systemGroupedBackground))
        .navigationTitle("Sound")
    }
}

//#Preview {
//    SoundSettingsView()
//        .environmentObject(TextSizeManager()) // Provide environment object for preview
//}
