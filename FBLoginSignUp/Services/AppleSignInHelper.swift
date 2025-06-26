//
//  AppleSignInHelper.swift
//  FBLoginSignUp
//
//  Created by Richa Srivastava on 21/06/2025.
//

import Foundation
import SwiftUI
import CryptoKit
import AuthenticationServices


struct AppleAuthResultModel {
    var idToken: String
    var nonce: String?
    var fullName: PersonNameComponents?
}

@MainActor
final class AppleSignInHelper: NSObject, ASAuthorizationControllerDelegate, ASAuthorizationControllerPresentationContextProviding {
    
    private var continuation: CheckedContinuation<AppleAuthResultModel, Error>?
    fileprivate var currentNonce: String?
    
    func startSignInWithAppleFlow() async throws -> AppleAuthResultModel {
        return try await withCheckedThrowingContinuation { continuation in
            self.continuation = continuation

            let nonce = randomNonceString()
            self.currentNonce = nonce
            let provider = ASAuthorizationAppleIDProvider()
            let request = provider.createRequest()
            request.requestedScopes = [.fullName, .email]
            request.nonce = sha256(nonce)
            
            let controller = ASAuthorizationController(authorizationRequests: [request])
            controller.delegate = self
            controller.presentationContextProvider = self
            controller.performRequests()
        }
    }
    
    private func randomNonceString(length: Int = 32) -> String {
        precondition(length > 0)
        var randomBytes = [UInt8](repeating: 0, count: length)
        let errorCode = SecRandomCopyBytes(kSecRandomDefault, randomBytes.count, &randomBytes)
        if errorCode != errSecSuccess {
            fatalError(
                "Unable to generate nonce. SecRandomCopyBytes failed with OSStatus \(errorCode)"
            )
        }
        
        let charset: [Character] =
        Array("0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._")
        
        let nonce = randomBytes.map { byte in
            // Pick a random character from the set, wrapping around if needed.
            charset[Int(byte) % charset.count]
        }
        
        return String(nonce)
    }
    
    @available(iOS 13, *)
    private func sha256(_ input: String) -> String {
        let inputData = Data(input.utf8)
        let hashedData = SHA256.hash(data: inputData)
        let hashString = hashedData.compactMap {
            String(format: "%02x", $0)
        }.joined()
        
        return hashString
    }
    
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        if let credential = authorization.credential as? ASAuthorizationAppleIDCredential,
           let appleIDToken = credential.identityToken,
           let idTokenString = String(data: appleIDToken, encoding: .utf8) {
            
            let result = AppleAuthResultModel(idToken: idTokenString, nonce: currentNonce, fullName: credential.fullName)
            continuation?.resume(returning: result)
        } else {
            continuation?.resume(throwing: URLError(.badServerResponse))
        }
    }
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        continuation?.resume(throwing: error)
    }
    
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        Utils.shared.getTopViewController()?.view.window ?? ASPresentationAnchor()
    }
}
//
//// MARK: Signin with Apple
//extension AppleSignInHelper {
//    
//    static private var currentNonce: String?
//
//    
//    func generateNonce() -> String {
//        let nonce = AppleSignInHelper.randomNonceString()
//        AppleSignInHelper.currentNonce = nonce
//        return nonce
//    }
//    
//    static func randomNonceString(length: Int = 32) -> String {
//        let charset: [Character] =
//            Array("0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._")
//        var result = ""
//        var remainingLength = length
//
//        while remainingLength > 0 {
//            let randoms: [UInt8] = (0..<16).map { _ in UInt8.random(in: 0...255) }
//            randoms.forEach { random in
//                if remainingLength == 0 { return }
//                if random < charset.count {
//                    result.append(charset[Int(random)])
//                    remainingLength -= 1
//                }
//            }
//        }
//        return result
//    }
//
//    static func sha256(_ input: String) -> String {
//        let inputData = Data(input.utf8)
//        let hashed = SHA256.hash(data: inputData)
//        return hashed.map { String(format: "%02x", $0) }.joined()
//    }
//}
