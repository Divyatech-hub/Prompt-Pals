//
//  ContentView.swift
//  PromptPals
//
//  Created by Camilo Carmona on 10/17/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var viewModel = ContentViewModel()
    
    var body: some View {
        VStack {
            ScrollViewReader { proxy in
                ScrollView {
                    LazyVStack(spacing: 16) {
                        ForEach(viewModel.chatMessages) { message in
                            messageView(message)
                        }
                        
                        Color.clear
                            .frame(height: 1)
                            .id("bottom")
                    }
                }
                .onReceive(viewModel.$chatMessages.throttle(for: 0.5, scheduler:
                                                                RunLoop.main, latest: true)) { chatMessages in
                    guard !chatMessages.isEmpty else { return }
                    withAnimation {
                        proxy.scrollTo("bottom")
                    }
                }
            }
            HStack {
                TextField("Message...", text: $viewModel.message, axis: .vertical)
                    .textFieldStyle(.roundedBorder)
                if viewModel.isWaitingForResponse {
                    ProgressView()
                        .padding()
                } else {
                    Button("Send") {
                        sendMessage()
                    }
                    .buttonStyle(.borderedProminent)
                }
            }
            .padding()
        }
            
    }

    func messageView(_ message: String) -> some View {
        HStack {
            if message.owner == .user {
                Spacer(minLength: 60)
            }
            
            if !message.text.isEmpty {
                VStack {
                    Text(message.text)
                        .foregroundColor(message.owner == .user ? .white : .black)
                        .padding(12)
                        .backgroundColor(message.owner == .user ? .blue : .green.opacity(0.1))
                        .cornerRadius(16)
                        .overlay(alignment: message.owner == .user ? .topTrailing :
                                .topLeading) {
                                    Text(message.owner.rawValue.capitalized)
                                        .foregroundColor(.gray)
                                        .font(.caption)
                                        .offset(y: -16)
                                }
                }
            }
            
            if message.owner == .assistant {
                Spacer(minLength: 60)
            }
        }
        .padding(.horizontal)
    }

    func sendMessage() {
        
    }
}



#Preview {
    ContentView()
}



