//
//  SignUpViewModel.swift
//  FBLoginSignUp
//
//  Created by richa on 6/19/25.
//

import SwiftUI

@MainActor
@Observable
public final class SignUpViewModel {
    // MARK: – Inputs
    public var name: String           = ""
    public var email: String          = ""
    public var password: String       = ""
    public var confirmPassword: String = ""

    // MARK: – UI State
    public var isLoading: Bool        = false
    public var errorMessage: String?  = nil

    /// Attempts to sign up. Returns the user on success, or `nil` on failure.
    func signUpWithEmail() async -> UserInfo? {
        // 1) Validate inputs
        guard !name.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "Please enter your name."
            return nil
        }
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "Please enter your email address."
            return nil
        }
        guard !password.isEmpty else {
            errorMessage = "Please enter a password."
            return nil
        }
        guard password == confirmPassword else {
            errorMessage = "Passwords do not match."
            return nil
        }

        // 2) Perform signup
        isLoading = true
        defer { isLoading = false }

        do {
            let user = try await AuthenticationManager.shared
                .createUserAccount(email: email,
                                   password: password,
                                   name: name)
            return user
        } catch let authError as AuthError {
            errorMessage = authError.localizedDescription
        } catch {
            errorMessage = AuthError.unknown(error: error).localizedDescription
        }
        return nil
    }
}
