//
//  AuthenticationManager.swift
//  FBLoginSignUp
//
//  Created by richa on 6/19/25.
//

import FirebaseAuth
import Foundation
import AuthenticationServices
import CryptoKit

struct UserInfo {
    let uid: String
    let email: String?
    let displayName: String?
    let photoURL: String?
    
    init(user: User) {
        self.uid = user.uid
        self.email = user.email
        self.displayName = user.displayName
        self.photoURL = user.photoURL?.absoluteString
    }
}

class AuthenticationManager {
    static let shared = AuthenticationManager()
    private var currentNonce: String?
    private init() {}
    
    func getLoggedInUser() -> UserInfo? {
        guard let user = Auth.auth().currentUser else { return nil }
        return UserInfo(user: user)
    }
    
    func createUserAccount(email: String, password: String, name: String) async throws -> UserInfo {
        let authResult = try await Auth.auth().createUser(withEmail: email, password: password)
        let changeRequest = authResult.user.createProfileChangeRequest()
        changeRequest.displayName = name
        try await changeRequest.commitChanges()
        return UserInfo(user: authResult.user)
    }
    
    func loginUser(email: String, password: String) async throws -> UserInfo {
        let authResult = try await Auth.auth().signIn(withEmail: email, password: password)
        return UserInfo(user: authResult.user)
    }
    
    func sendPasswordReset(email: String) async throws {
        try await Auth.auth().sendPasswordReset(withEmail: email)
    }
    
    func signOut() throws {
        try Auth.auth().signOut()
    }
}


// MARK: Signin with SSO
extension AuthenticationManager {
    
    func signInWithGoogle(tokens: GoogleResultToekns) async throws -> UserInfo {
        let credential = GoogleAuthProvider.credential(withIDToken: tokens.idToken,
                                                       accessToken: tokens.accessToken)
        let authResult = try await Auth.auth().signIn(with: credential)
        return UserInfo(user: authResult.user)
    }
    
    func signInWithApple(tokens: AppleAuthResultModel) async throws -> UserInfo {
        let credential = OAuthProvider.credential(
            providerID: AuthProviderID.apple,
            idToken: tokens.idToken,
            rawNonce: tokens.nonce ?? "" 
        )
        let authResult = try await Auth.auth().signIn(with: credential)
        return UserInfo(user: authResult.user)
    }
    
    func signIn(credential : AuthCredential) async throws -> UserInfo {
        let authResult = try await Auth.auth().signIn(with: credential)
        return UserInfo(user: authResult.user)
    }
}
