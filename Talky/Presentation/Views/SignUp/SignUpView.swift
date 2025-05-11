//
//  SignUpView.swift
//  Talky
//
//  Created by Andersson on 10/05/25.
//

import SwiftUI

struct SignUpView: View {
    @State private var isPasswordVisible: Bool = false
    @State private var isPasswordConfirmVisible: Bool = false
    @StateObject private var signUpViewModel = SignUpViewModel()
    
    var body: some View {
        ZStack {
            Color("Background").ignoresSafeArea()
            VStack(spacing: 20) {
                Image(systemName: "bubble.left.and.bubble.right.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 80)
                    .foregroundStyle(Color.accentColor)
                Text("Join Takly")
                    .font(.title.bold())
                    .foregroundStyle(Color.primary)
                VStack(spacing: 16) {
                    ChatInputField(icon: "person", placeholder: "Nickname", text: $signUpViewModel.nickname)
                    ChatInputField(icon: "envelope", placeholder: "E-mail", keyboardType: .emailAddress, text: $signUpViewModel.email)
                    ZStack(alignment: .trailing) {
                        ChatSecureField(icon: "lock", placeholder: "Password", isSecure: !isPasswordVisible, text: $signUpViewModel.password)
                        Button {
                            isPasswordVisible.toggle()
                        } label: {
                            Image(systemName: isPasswordVisible ? "eye.slash" : "eye")
                                .foregroundStyle(.gray)
                                .padding(.trailing, 20)
                        }
                        
                    }
                    ZStack(alignment: .trailing) {
                        ChatSecureField(icon: "lock", placeholder: "Confirm Password", isSecure: !isPasswordConfirmVisible, text: $signUpViewModel.confirmPassword)
                        Button {
                            isPasswordConfirmVisible.toggle()
                        } label: {
                            Image(systemName: isPasswordConfirmVisible ? "eye.slash" : "eye")
                                .foregroundStyle(.gray)
                                .padding(.trailing, 20)
                        }
                        
                    }
                }
                if let errorMessage = signUpViewModel.errorMessage {
                    ErrorsForm(errorMessage: errorMessage)
                }
                Button {
                    Task {
                        await signUpViewModel.signUp()
                    }
                } label: {
                    Text("Sign Up")
                        .font(.headline)
                        .foregroundStyle(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(12)
                }
                .padding(.top, 20)
                .disabled(!signUpViewModel.isFormValid)
                Spacer()
                HStack(spacing: 4) {
                    Text("Do you already have an account?")
                        .foregroundStyle(.secondary)
                    Button {
                        // TODO: Go to login
                    } label: {
                        Text("Login")
                            .bold()
                            .foregroundStyle(.blue)
                    }
                    
                }
                .font(.footnote)
                .padding(.top, 20)
                .padding(.bottom, 40)
            }
            .padding(.horizontal, 30)
            .padding(.top, 60)
        }
    }
}

#Preview {
    SignUpView()
}
