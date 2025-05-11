//
//  ChatSecureField.swift
//  Talky
//
//  Created by Andersson on 10/05/25.
//

import SwiftUI

struct ChatSecureField: View {
    var icon: String
    var placeholder: String
    var isSecure: Bool
    @Binding var text: String
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundStyle(.gray)
            if isSecure {
                SecureField(placeholder, text: $text)
            } else {
                TextField(placeholder, text: $text)
            }
        }
        .padding()
        .background(Color(.secondarySystemBackground))
        .cornerRadius(10)
    }
}

#Preview {
    @Previewable @State var text = ""
    ChatSecureField(icon: "lock", placeholder: "Password", isSecure: true, text: $text)
}
