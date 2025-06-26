//
//  EmailLoginViewModel.swift
//  FBLoginSignUp
//
//  Created by richa on 6/19/25.
//

import SwiftUI

@Observable
final class EmailLoginViewModel {
    var email = ""
    var password = ""
    
    func loginWithEmail() async -> UserInfo? {
        guard !email.isEmpty, !password.isEmpty else {
            print("Please enter email and password.")
            return nil
        }
        
        do {
            let user = try await AuthenticationManager.shared.loginUser(email: email, password: password)
            return user
        } catch {
            print("Login error: \(error.localizedDescription)")
            return nil
        }
    }
}
