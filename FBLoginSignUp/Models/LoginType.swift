//
//  LoginType.swift
//  FBLoginSignUp
//
//  Created by richa on 6/19/25.
//


enum LoginType : String {
    case google
    case apple
    case email
    
    func title() -> String {
        switch self {
        case .apple:
            return "Login with Apple"
        case .google:
            return "Login with Google"
        case .email:
            return "Login with Email"
        }
    }
}
