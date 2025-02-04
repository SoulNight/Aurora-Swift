//  DeviceSelectionView.swift
//  Aurora
//
//  Created by Tony Bautista on 11/22/24.

import SwiftUI

struct DeviceSelectionView: View {
    @Binding var devices: [String]
    @Binding var selectedDevices: Set<String>
    @Environment(\.presentationMode) var presentationMode // Environment variable to dismiss the sheet
    @State private var showDisconnectionAlert = false // State for showing alert
    @State private var disconnectedDevices: [String] = [] // Track disconnected devices

    var body: some View {
        VStack {
            Text("Select Devices to Disconnect")
                .font(.headline)
                .padding()

            List(devices, id: \.self) { device in
                HStack {
                    Text(device)
                    Spacer()
                    if selectedDevices.contains(device) {
                        Image(systemName: "checkmark")
                            .foregroundColor(.blue)
                    }
                }
                .contentShape(Rectangle()) // Make the row tappable
                .onTapGesture {
                    if selectedDevices.contains(device) {
                        selectedDevices.remove(device)
                    } else {
                        selectedDevices.insert(device)
                    }
                }
            }

            Button("Disconnect Selected") {
                disconnectSelectedDevices()
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.red)
            .foregroundColor(.white)
            .cornerRadius(10)
            .padding()
        }
        .alert(isPresented: $showDisconnectionAlert) {
            Alert(
                title: Text("Devices Disconnected"),
                message: Text(disconnectedDevices.isEmpty
                                ? "No devices were disconnected."
                                : "Disconnected: \(disconnectedDevices.joined(separator: ", "))"),
                dismissButton: .default(Text("OK")) {
                    presentationMode.wrappedValue.dismiss() // Close the sheet
                }
            )
        }
    }

    // Function to disconnect selected devices
    func disconnectSelectedDevices() {
        disconnectedDevices = Array(selectedDevices)
        selectedDevices.removeAll()
        showDisconnectionAlert = true
    }
}
