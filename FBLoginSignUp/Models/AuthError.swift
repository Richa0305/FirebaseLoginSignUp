//
//  AuthError.swift
//  FBLoginSignUp
//
//  Created by Richa Srivastava on 26/06/2025.
//

import Foundation
import FirebaseAuth

public enum AuthError: LocalizedError {
  case invalidEmail
  case userNotFound
  case wrongPassword
  case emailAlreadyInUse
  case weakPassword
  case networkError
  case custom(message: String)
  case unknown(error: Error)

  // Map underlying errors into our cases:
  init(_ error: Error) {
    if let errCode = AuthErrorCode(rawValue: (error as NSError).code) {
      switch errCode {
      case .invalidEmail:       self = .invalidEmail
      case .userNotFound:       self = .userNotFound
      case .wrongPassword:      self = .wrongPassword
      case .emailAlreadyInUse:  self = .emailAlreadyInUse
      case .weakPassword:       self = .weakPassword
      case .networkError:       self = .networkError
      default:                  self = .unknown(error: error)
      }
    } else {
      self = .unknown(error: error)
    }
  }

  // Provide user-facing descriptions:
  public var errorDescription: String? {
    switch self {
    case .invalidEmail:
      return "Please enter a valid email address."
    case .userNotFound:
      return "No account found for that email."
    case .wrongPassword:
      return "The password you entered is incorrect."
    case .emailAlreadyInUse:
      return "That email is already registered. Try logging in instead."
    case .weakPassword:
      return "Your password must be at least 6 characters."
    case .networkError:
      return "Network error. Check your connection and try again."
    case .custom(let message):
      return message
    case .unknown:
      return "Something went wrong. Please try again."
    }
  }
}
