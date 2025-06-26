//
//  GoogleSignInHelper.swift
//  FBLoginSignUp
//
//  Created by Richa Srivastava on 20/06/2025.
//

import Foundation
import GoogleSignIn
import GoogleSignInSwift

struct GoogleResultToekns {
    let accessToken: String
    let idToken: String
}

final class GoogleSignInHelper {
    
    @MainActor
    func signIn() async throws -> GoogleResultToekns {
        guard let topViewController = Utils.shared.getTopViewController() else {
            throw URLError(.cannotFindHost)
        }
        let signInResult = try await GIDSignIn.sharedInstance.signIn(withPresenting: topViewController)
        guard let idToken = signInResult.user.idToken?.tokenString else {
            throw URLError(.badServerResponse)
        }
        let accessToken = signInResult.user.accessToken.tokenString
        return GoogleResultToekns(accessToken: accessToken, idToken: idToken)
    }
}
