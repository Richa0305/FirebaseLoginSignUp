//
//  LoadingOverlay.swift
//  FBLoginSignUp
//
//  Created by Richa Srivastava on 26/06/2025.
//

import SwiftUI

public struct LoadingOverlay: View {
  @Binding public var isLoading: Bool

  public init(isLoading: Binding<Bool>) {
    self._isLoading = isLoading
  }

  public var body: some View {
    if isLoading {
      ZStack {
        Color.black.opacity(0.4)
          .ignoresSafeArea()
        ProgressView()
          .scaleEffect(1.5)
      }
      .transition(.opacity)
      .animation(.easeInOut, value: isLoading)
    }
  }
}
