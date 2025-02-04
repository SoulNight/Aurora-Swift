//  CaptionsView.swift
//  Aurora
//
//  Created by Tony Bautista on 11/16/24.

import SwiftUI

struct CaptionsView: View {
    @EnvironmentObject var textSizeManager: TextSizeManager // Use global text size manager

    @State private var captions: String = "Captions will appear here."
    @State private var isCaptionsRunning: Bool = false
    @State private var isASLEnabled: Bool = false
    @State private var isQuestionAsked: Bool = false
    @State private var questionAcknowledged: Bool = false

    var body: some View {
        VStack(spacing: 20) {
            // Title
            Text("Live Captions")
                .font(.system(size: 24 * textSizeManager.textSize, weight: .bold))
                .padding(.top, 20)

            // Caption Display Box
            ScrollView {
                Text(captions)
                    .foregroundColor(captions == "Captions will appear here." ? .gray : .primary)
                    .font(.system(size: 20 * textSizeManager.textSize)) // Larger font size for better readability
                    .padding()
                    .multilineTextAlignment(.center)
            }
            .frame(maxHeight: .infinity) // Make the captions box take up most of the screen
            .border(Color.gray, width: 1)
            .cornerRadius(12)
            .shadow(radius: 2)
            .padding(.horizontal, 20)

            // Divider for Buttons
            Divider().padding(.horizontal, 20)

            // Action Buttons
            VStack(spacing: 12) {
                // "Ask a Question" Button
                Button(action: {
                    isQuestionAsked = true
                    questionAcknowledged = false
                    // Simulate teacher acknowledgment
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                        if !questionAcknowledged {
                            // Placeholder for unanswered question logic
                        }
                    }
                }) {
                    Label(isQuestionAsked ? (questionAcknowledged ? "Question Answered!" : "Question Sent!") : "Ask a Question",
                          systemImage: isQuestionAsked ? (questionAcknowledged ? "checkmark.circle.fill" : "hand.raised.fill") : "hand.raised")
                        .font(.system(size: 18 * textSizeManager.textSize, weight: .bold))
                        .frame(maxWidth: .infinity, minHeight: 50)
                        .background(isQuestionAsked ? (questionAcknowledged ? Color.green : Color.blue) : Color.yellow)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .shadow(radius: 3)
                }

                // Start/Stop Captions Button
                Button(action: {
                    isCaptionsRunning.toggle()
                    if isCaptionsRunning {
                        captions = "Listening for captions..."
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                            captions = "This is an example of live captions in progress."
                        }
                    } else {
                        captions = "Captions will appear here."
                    }
                }) {
                    Label(isCaptionsRunning ? "Stop Captions" : "Start Captions", systemImage: "mic.fill")
                        .font(.system(size: 18 * textSizeManager.textSize, weight: .bold))
                        .frame(maxWidth: .infinity, minHeight: 50)
                        .background(isCaptionsRunning ? Color.red : Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            .padding(.horizontal, 20)

            // Divider for ASL Section
            Divider().padding(.horizontal, 20)

            // ASL Captions Section
            VStack(alignment: .leading, spacing: 10) {
                Toggle(isOn: $isASLEnabled) {
                    Text("Enable ASL-American Sign Language Captions")
                        .font(.system(size: 16 * textSizeManager.textSize))
                }
                if isASLEnabled {
                    VStack(alignment: .center, spacing: 10) {
                        Text("ASL captions are enabled. These will translate spoken words into ASL visuals.")
                            .font(.system(size: 14 * textSizeManager.textSize))
                            .foregroundColor(.secondary)
                            .multilineTextAlignment(.center)
                        
                        // Neutral Button for ASL Converter
                        Link(destination: URL(string: "https://wecapable.com/tools/text-to-sign-language-converter/")!) {
                            Text("Use ASL Text-to-Sign Language Converter")
                                .font(.system(size: 16 * textSizeManager.textSize, weight: .bold))
                                .foregroundColor(.black)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color(UIColor.systemGray5))
                                .cornerRadius(10)
                                .shadow(radius: 3)
                        }
                        .padding(.horizontal, 20)
                    }
                }
            }
            .padding(.horizontal, 20)

            Spacer()

            // Development Only: Teacher Acknowledgment Button
            Button(action: {
                if isQuestionAsked {
                    questionAcknowledged = true
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        isQuestionAsked = false // Reset question state
                    }
                }
            }) {
                Text("Simulate Teacher's Acknowledgment")
                    .font(.system(size: 14 * textSizeManager.textSize, weight: .bold))
                    .frame(maxWidth: .infinity, minHeight: 30)
                    .foregroundColor(.white)
                    .background(Color.gray)
                    .cornerRadius(8)
            }
            .padding(.horizontal, 20)
        }
        .padding()
        .background(Color(UIColor.systemGroupedBackground))
        .navigationTitle("Captions")
    }
}

