//
//  ContentViewModel.swift
//  PromptPals
//
//  Created by Camilo Carmona on 10/17/23.
//

import SwiftUI
import ChatGPTSwift

class ContentViewModel: Observable {
    
    let api = ChatGPTAPI(apikey: API.key)
    
    @Published var message = ""
    @Published var chatMessages = [ChatMessage]()
    @Published var isWaitingForResponse = false
    
    func sendMessage() async throws {
        
    }
}
