//
//  SignUpViewModel.swift
//  FBLoginSignUp
//
//  Created by richa on 6/19/25.
//

import SwiftUI

@Observable
final class SignUpViewModel {
    var name = ""
    var email = ""
    var password = ""
    var confirmPassword = ""
    
    func signUpWithEmail() async -> UserInfo? {
        guard !email.isEmpty, !password.isEmpty else {
            print("Please enter email and password.")
            return nil
        }
        
        guard password == confirmPassword else {
            print("Passwords do not match.")
            return nil
        }
        
        do {
            let user = try await AuthenticationManager.shared.createUserAccount(email: email, password: password, name: name)
            print("Signed Up Successfully")
            return user
        } catch {
            print("Signup error: \(error.localizedDescription)")
            return nil
        }
    }
}
