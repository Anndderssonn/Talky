//
//  SignUpViewModel.swift
//  Talky
//
//  Created by Andersson on 10/05/25.
//

import Foundation
import FirebaseAuth

class SignUpViewModel: ObservableObject {
    @Published var email = "" { didSet {validateFields()}}
    @Published var password = "" { didSet {validateFields()}}
    @Published var confirmPassword = "" { didSet {validateFields()}}
    @Published var nickname = "" { didSet {validateFields()}}
    @Published var errorMessage: String?
    @Published var isFormValid: Bool = false
    
    func validateFields() {
        if email.isEmptyOrWhitespace || password.isEmptyOrWhitespace || nickname.isEmptyOrWhitespace {
            errorMessage = "All fields are required."
            isFormValid = false
            return
        }
        
        if !email.contains("@") {
            errorMessage = "Invalid email format."
            isFormValid = false
            return
        }
        
        if password.count < 8 {
            errorMessage = "Password must be at least 8 characters long."
            isFormValid = false
            return
        }
        
        if password != confirmPassword {
            errorMessage = "Passwords must match."
            isFormValid = false
            return
        }
        
        errorMessage = nil
        isFormValid = true
    }
    
    private func cleanSigUpForm() {
        email = ""
        password = ""
        confirmPassword = ""
        nickname = ""
        errorMessage = nil
        isFormValid = false
    }
    
    @MainActor
    func signUp() async {
        validateFields()
        guard isFormValid else { return }
        do {
            _ = try await Auth.auth().createUser(withEmail: email, password: password)
            cleanSigUpForm()
        } catch {
            errorMessage = error.localizedDescription
        }
    }
}
