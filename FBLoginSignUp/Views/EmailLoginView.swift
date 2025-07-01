//
//  EmailLoginView.swift
//  FirebaseAuth
//
//  Created by richa on 6/18/25.
//

import SwiftUI

struct EmailLoginView: View {
    @Environment(AppStateViewModel.self) private var appState
    @Environment(Theme.self) private var theme
    @Environment(\ .dismiss) private var dismiss
    @State private var viewModel = EmailLoginViewModel()
    
    var body: some View {
        ZStack {
            VStack(spacing: 20) {
                Text("Login with Email")
                    .font(.title)
                    .fontWeight(.bold)
                
                Group {
                    TextField("Email", text: $viewModel.email)
                        .textFieldStyle()
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle()
                }
                
                Button(action: {
                    Task {
                        if let user = await viewModel.loginWithEmail() {
                            appState.currentUser = user
                            dismiss()
                        }
                    }
                }) {
                    Text("Login")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.red)
                        .cornerRadius(10)
                }
                .padding(.horizontal)
                Button("Forgot Password?") {
                    Task { await viewModel.sendPasswordReset() }
                }
                .font(.footnote)
                .foregroundColor(.blue)
                Spacer()
            }
            .padding()
            LoadingOverlay(isLoading: $viewModel.isLoading)
        }
        .errorAlert(errorMessage: $viewModel.errorMessage)
        .alert(
            "Password Reset Sent",
            isPresented: $viewModel.resetEmailSent,
            actions: {
                Button("OK", role: .cancel) { viewModel.resetEmailSent = false }
            },
            message: {
                Text("A link to reset your password has been sent to \(viewModel.email).")
            }
        )
        .background(theme.loginGradient)
    }
}
#Preview {
    EmailLoginView()
        .environment(AppStateViewModel())
        .environment(Theme())
}
