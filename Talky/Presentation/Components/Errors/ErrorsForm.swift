//
//  ErrorsForm.swift
//  Talky
//
//  Created by Andersson on 10/05/25.
//

import SwiftUI

struct ErrorsForm: View {
    var errorMessage: String
    
    var body: some View {
        HStack {
            Image(systemName: "exclamationmark.circle.fill")
                .foregroundStyle(.red)
            Text(errorMessage)
                .font(.subheadline)
                .foregroundStyle(.red)
            Spacer()
        }
        .padding(.horizontal)
        .padding(.top, 2)
    }
}

#Preview {
    ErrorsForm(errorMessage: "Unknown error.")
}
