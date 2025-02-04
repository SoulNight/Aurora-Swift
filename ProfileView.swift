//  ProfileView.swift
//  Aurora
//
//  Created by Tony Bautista on 11/16/24.

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var textSizeManager: TextSizeManager // Use global text size manager
    @State private var profileName: String = "Abby Smith"
    @State private var email: String = "abby.smith@example.com"
    @State private var isASLEnabled: Bool = true

    var body: some View {
        VStack(spacing: 20) {
            // Profile Header
            HStack {
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 80)
                    .foregroundColor(.blue)
                VStack(alignment: .leading) {
                    Text(profileName)
                        .font(.system(size: 20 * textSizeManager.textSize)) // Adjust font size
                        .bold()
                    Text(email)
                        .font(.system(size: 14 * textSizeManager.textSize))
                        .foregroundColor(.gray)
                }
                Spacer()
            }
            .padding(.horizontal)
            .padding(.top, 20)

            Divider()

            // Device Information
            VStack(alignment: .leading, spacing: 10) {
                Text("Devices")
                    .font(.system(size: 18 * textSizeManager.textSize))
                    .bold()
                HStack {
                    Text("Phonak Hearing Aid")
                        .font(.system(size: 16 * textSizeManager.textSize))
                        .foregroundColor(.primary)
                    Spacer()
                    Text("Connected")
                        .font(.system(size: 16 * textSizeManager.textSize))
                        .foregroundColor(.green)
                }
                HStack {
                    Text("FM System")
                        .font(.system(size: 16 * textSizeManager.textSize))
                        .foregroundColor(.primary)
                    Spacer()
                    Text("Not Connected")
                        .font(.system(size: 16 * textSizeManager.textSize))
                        .foregroundColor(.gray)
                }
                HStack {
                    Text("Bluetooth Pencil")
                        .font(.system(size: 16 * textSizeManager.textSize))
                        .foregroundColor(.primary)
                    Spacer()
                    Text("Not Connected")
                        .font(.system(size: 16 * textSizeManager.textSize))
                        .foregroundColor(.gray)
                }
            }
            .padding(.horizontal)

            Divider()

            // Accessibility Settings
            VStack(alignment: .leading, spacing: 10) {
                Text("Accessibility Settings")
                    .font(.system(size: 18 * textSizeManager.textSize))
                    .bold()

                Toggle("Enable ASL Captions", isOn: $isASLEnabled)

                VStack(alignment: .leading) {
                    Text("Text Size")
                        .font(.system(size: 16 * textSizeManager.textSize))
                    Slider(value: $textSizeManager.textSize, in: 0.8...1.5, step: 0.1)
                    HStack {
                        Text("Small")
                            .font(.system(size: 12 * textSizeManager.textSize))
                            .foregroundColor(.secondary)
                        Spacer()
                        Text("Large")
                            .font(.system(size: 12 * textSizeManager.textSize))
                            .foregroundColor(.secondary)
                    }
                }
            }
            .padding(.horizontal)

            Divider()

            // Help and Support
            VStack(alignment: .leading, spacing: 10) {
                Text("Help and Support")
                    .font(.system(size: 18 * textSizeManager.textSize))
                    .bold()

                HStack(spacing: 20) {
                    // FAQs
                    Button(action: {
                        // Open FAQ
                    }) {
                        VStack {
                            Image(systemName: "questionmark.circle")
                                .font(.system(size: 24 * textSizeManager.textSize))
                                .foregroundColor(.blue)
                            Text("FAQs")
                                .font(.system(size: 12 * textSizeManager.textSize))
                                .foregroundColor(.primary)
                        }
                    }

                    // Contact Support
                    Button(action: {
                        // Open Contact Support
                    }) {
                        VStack {
                            Image(systemName: "envelope")
                                .font(.system(size: 24 * textSizeManager.textSize))
                                .foregroundColor(.blue)
                            Text("Contact Support")
                                .font(.system(size: 12 * textSizeManager.textSize))
                                .foregroundColor(.primary)
                        }
                    }

                    // View Tutorials
                    Button(action: {
                        // Open Tutorials
                    }) {
                        VStack {
                            Image(systemName: "play.circle")
                                .font(.system(size: 24 * textSizeManager.textSize))
                                .foregroundColor(.blue)
                            Text("Tutorials")
                                .font(.system(size: 12 * textSizeManager.textSize))
                                .foregroundColor(.primary)
                        }
                    }

                    // Live Chat
                    Button(action: {
                        // Start Live Chat
                    }) {
                        VStack {
                            Image(systemName: "message.circle")
                                .font(.system(size: 24 * textSizeManager.textSize))
                                .foregroundColor(.blue)
                            Text("Live Chat")
                                .font(.system(size: 12 * textSizeManager.textSize))
                                .foregroundColor(.primary)
                        }
                    }
                }
                .padding(.top, 5)
            }
            .padding(.horizontal)

            Divider()

            // Recent Activity
            VStack(alignment: .leading, spacing: 5) {
                Text("Recent Activity")
                    .font(.system(size: 18 * textSizeManager.textSize))
                    .bold()
                Text("Last used preset: Music")
                    .font(.system(size: 12 * textSizeManager.textSize))
                    .foregroundColor(.gray)
                Text("Devices connected: Phonak Hearing Aid (Today, 8:30 AM)")
                    .font(.system(size: 12 * textSizeManager.textSize))
                    .foregroundColor(.gray)
            }
            .padding(.horizontal)

            Spacer()

            // Sign Out Button
            Button(action: {
                // Sign out action
            }) {
                Text("Sign Out")
                    .font(.system(size: 18 * textSizeManager.textSize))
                    .frame(maxWidth: .infinity, minHeight: 50)
                    .background(Color.red.opacity(0.8))
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .padding(.horizontal)
            }
        }
        .padding(.bottom, 20)
        .background(Color(UIColor.systemGroupedBackground))
        .navigationTitle("Profile")
    }
}

//#Preview {
//    ProfileView()
//        .environmentObject(TextSizeManager()) // Inject environment object for preview
//}
