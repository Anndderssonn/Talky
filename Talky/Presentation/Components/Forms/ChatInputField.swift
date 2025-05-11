//
//  ChatInputField.swift
//  Talky
//
//  Created by Andersson on 10/05/25.
//

import SwiftUI

struct ChatInputField: View {
    var icon: String
    var placeholder: String
    var keyboardType: UIKeyboardType = .default
    @Binding var text: String
    
    var body: some View {
        HStack {
            Image(systemName: icon).foregroundStyle(.gray)
            TextField(placeholder, text: $text)
                .keyboardType(keyboardType)
                .autocapitalization(.none)
                .disableAutocorrection(true)
        }
        .padding()
        .background(Color(.secondarySystemBackground))
        .cornerRadius(10)
    }
}

#Preview {
    @Previewable @State var mockText = ""
    ChatInputField(icon: "person", placeholder: "Nickname", text: $mockText)
}
