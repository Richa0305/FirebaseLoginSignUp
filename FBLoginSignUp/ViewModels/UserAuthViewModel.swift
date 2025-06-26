//
//  UserAuthViewModel.swift
//  FBLoginSignUp
//
//  Created by Richa Srivastava on 21/06/2025.
//

import SwiftUI

@MainActor
@Observable
class UserAuthViewModel {
    
    func signInWithApple() async throws -> UserInfo {
        let signInWithAppleHelper = AppleSignInHelper()
        let signInWithAppleResult = try await signInWithAppleHelper.startSignInWithAppleFlow()
        
        let userInfo = try await AuthenticationManager.shared.signInWithApple(tokens: signInWithAppleResult)
        return userInfo
    }
    
    func signInWithGoogle() async throws -> UserInfo {
        let tokens = try await GoogleSignInHelper().signIn()
        let userInfo = try await AuthenticationManager.shared.signInWithGoogle(tokens: tokens)
        return userInfo
    }
    
}
