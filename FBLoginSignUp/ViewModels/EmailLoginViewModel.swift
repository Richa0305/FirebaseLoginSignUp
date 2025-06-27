//
//  EmailLoginViewModel.swift
//  FBLoginSignUp
//
//  Created by richa on 6/19/25.
//

import SwiftUI

@MainActor
@Observable
final class EmailLoginViewModel {
    // MARK: – Inputs
    public var email: String = ""
    public var password: String = ""
    
    // MARK: – UI State
    public var isLoading: Bool = false
    public var errorMessage: String? = nil
    
    // MARK: – Password-reset state
    public var resetEmailSent: Bool = false
    
    /// Attempts to log in. Returns the user on success, or `nil` on failure.
    func loginWithEmail() async -> UserInfo? {
        guard !email.isEmpty else {
            errorMessage = "Please enter your email address."
            return nil
        }
        guard !password.isEmpty else {
            errorMessage = "Please enter your password."
            return nil
        }
        isLoading = true
        defer { isLoading = false }
        
        do {
            let user = try await AuthenticationManager.shared
                .loginUser(email: email, password: password)
            return user
        } catch let authError as AuthError {
            errorMessage = authError.localizedDescription
        } catch {
            errorMessage = AuthError.unknown(error: error).localizedDescription
        }
        return nil
    }
    
    /// Sends a Firebase password-reset email to `email`.
    public func sendPasswordReset() async {
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "Please enter your email address."
            return
        }
        
        isLoading = true
        defer { isLoading = false }
        
        do {
            try await AuthenticationManager.shared.sendPasswordReset(email: email)
            resetEmailSent = true
        } catch let authError as AuthError {
            errorMessage = authError.localizedDescription
        } catch {
            errorMessage = AuthError.unknown(error: error).localizedDescription
        }
    }
    
}
