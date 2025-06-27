//
//  ErrorAlert.swift
//  FBLoginSignUp
//
//  Created by Richa Srivastava on 26/06/2025.
//

import SwiftUI

public struct ErrorAlert: ViewModifier {
  @Binding var errorMessage: String?

  public func body(content: Content) -> some View {
    content
      .alert("Error", isPresented: Binding(
        get: { errorMessage != nil },
        set: { if !$0 { errorMessage = nil } }
      )) {
        Button("OK") { errorMessage = nil }
      } message: {
        Text(errorMessage ?? "")
      }
  }
}

public extension View {
  func errorAlert(errorMessage: Binding<String?>) -> some View {
    modifier(ErrorAlert(errorMessage: errorMessage))
  }
}
