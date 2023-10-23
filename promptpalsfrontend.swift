import SwiftUI

struct Message: Identifiable {
    var id = UUID()
    var text: String
    var isSentByUser: Bool
}

struct ChatView: View {
    @State private var newMessage = ""
    @State private var messages: [Message] = [
        Message(text: "Hello! How can I assist you today?", isSentByUser: false),
    ]
    
    var body: some View {
        VStack {
            List(messages) { message in
                MessageView(message: message)
            }
            HStack {
                TextField("Type a message...", text: $newMessage)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button(action: sendMessage) {
                    Text("Send")
                        .padding(10)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            .padding()
        }
        .navigationBarTitle("PromptPals")
    }
    
    func sendMessage() {
        guard !newMessage.isEmpty else { return }
        let message = Message(text: newMessage, isSentByUser: true)
        messages.append(message)
        newMessage = ""
        
        // Simulate a response from ChatGPT (you might replace this with actual API calls to a conversational AI).
        let response = Message(text: "You said: \(message.text)", isSentByUser: false)
        messages.append(response)
    }
}

struct MessageView: View {
    let message: Message
    
    var body: some View {
        HStack {
            if message.isSentByUser {
                Spacer()
                Text(message.text)
                    .padding(10)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            } else {
                Text(message.text)
                    .padding(10)
                    .background(Color.gray)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                Spacer()
            }
        }
    }
}

@main
struct ChatGPTApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ChatView()
            }
        }
    }
}

