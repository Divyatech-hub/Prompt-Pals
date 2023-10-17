//
//  ChatMessage.swift
//  PromptPals
//
//  Created by Camilo Carmona on 10/17/23.
//

import SwiftUI

struct ChatMessage: Identifiable{
    var id = UUID().uuidString
    
    var owner: MessageOwner
    var text: String
    
    init(id: String = UUID().uuidString, owner: MessageOwner = .user, _ text: String) {
        self.owner = owner
        self.text = text
    }
}
j
