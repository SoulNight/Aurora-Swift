//  DevicesView.swift
//  Aurora
//
//  Created by Tony Bautista on 11/16/24.

import SwiftUI

struct DevicesView: View {
    @EnvironmentObject var textSizeManager: TextSizeManager // Use global text size manager

    var body: some View {
        VStack(spacing: 20) {
            // Title
            Text("Connected Devices")
                .font(.system(size: 24 * textSizeManager.textSize, weight: .bold)) // Adjusted font size
                .padding(.top, 20)

            // Devices List with visual icons and status indicators
            List {
                Section(header: Text("Connected")
                            .font(.system(size: 18 * textSizeManager.textSize, weight: .bold))) {
                    HStack {
                        Image(systemName: "ear.badge.checkmark")
                            .foregroundColor(.green)
                            .imageScale(.large)
                        Text("Phonak Hearing Aid")
                            .font(.system(size: 16 * textSizeManager.textSize))
                        Spacer()
                        Text("Connected")
                            .font(.system(size: 14 * textSizeManager.textSize))
                            .foregroundColor(.green)
                    }
                }

                Section(header: Text("Not Connected")
                            .font(.system(size: 18 * textSizeManager.textSize, weight: .bold))) {
                    HStack {
                        Image(systemName: "antenna.radiowaves.left.and.right")
                            .foregroundColor(.gray)
                            .imageScale(.large)
                        Text("FM System")
                            .font(.system(size: 16 * textSizeManager.textSize))
                        Spacer()
                        Text("Not Connected")
                            .font(.system(size: 14 * textSizeManager.textSize))
                            .foregroundColor(.gray)
                    }

                    HStack {
                        Image(systemName: "pencil.tip")
                            .foregroundColor(.gray)
                            .imageScale(.large)
                        Text("Bluetooth Pencil")
                            .font(.system(size: 16 * textSizeManager.textSize))
                        Spacer()
                        Text("Not Connected")
                            .font(.system(size: 14 * textSizeManager.textSize))
                            .foregroundColor(.gray)
                    }
                }
            }
            .listStyle(InsetGroupedListStyle())
            .padding(.horizontal, 10)

            // Info message for Abby
            Text("Ensure your FM System is properly connected for optimal classroom support.")
                .font(.system(size: 14 * textSizeManager.textSize))
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 16)

            // Scan for Devices Button
            Button(action: {
                // Start Bluetooth scan action
            }) {
                Label("Scan for Devices", systemImage: "magnifyingglass.circle")
                    .font(.system(size: 18 * textSizeManager.textSize, weight: .bold))
                    .frame(maxWidth: .infinity, minHeight: 50)
            }
            .buttonStyle(.borderedProminent)
            .tint(.blue)
            .padding([.horizontal, .bottom], 16)
        }
        .background(Color(UIColor.systemGroupedBackground))
    }
}

//#Preview {
//    DevicesView()
//        .environmentObject(TextSizeManager()) // Provide environment object for preview
//}
