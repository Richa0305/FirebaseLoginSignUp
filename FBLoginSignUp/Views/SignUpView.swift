//
//  SignUpView.swift
//  FirebaseAuth
//
//  Created by richa on 6/18/25.
//

import SwiftUI


struct SignUpView: View {
    @Environment(AppStateViewModel.self) private var appState
    @Environment(\ .dismiss) private var dismiss
    @State var viewModel = SignUpViewModel()
    
    var body: some View {
        ZStack {
            VStack(spacing: 20) {
                Text("Create An Account")
                    .font(.title)
                    .fontWeight(.bold)
                
                Group {
                    TextField("Name", text: $viewModel.name)
                        .textFieldStyle()
                    TextField("Email", text: $viewModel.email)
                        .textFieldStyle()
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle()
                    SecureField("Confirm Password", text: $viewModel.confirmPassword)
                        .textFieldStyle()
                }
                
                Button(action: {
                    Task {
                        if let user = await viewModel.signUpWithEmail() {
                            appState.currentUser = user
                            dismiss()
                        }
                    }
                }) {
                    Text("Create an Account")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.red)
                        .cornerRadius(10)
                }
                .padding(.horizontal)
                
                Spacer()
            }
            .padding()
            LoadingOverlay(isLoading: $viewModel.isLoading)
        }
        .errorAlert(errorMessage: $viewModel.errorMessage)
    }
}
#Preview {
    SignUpView()
}
