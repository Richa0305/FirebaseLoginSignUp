//
//  Untitled.swift
//  FBLoginSignUp
//
//  Created by richa on 6/19/25.
//
import SwiftUI
import AuthenticationServices


struct UserAuthView: View {
    @Environment(AppStateViewModel.self) private var appState
    
    @Environment(\ .dismiss) private var dismiss
    @State private var viewModel = UserAuthViewModel()
    
    var body: some View {
        VStack(spacing: 20) {
            Image("logo")
                .resizable()
                .scaledToFit()
                .frame(width: 250, height: 250)
            
            Text("Welcome To Fitness")
                .font(.title)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            
            VStack(spacing: 16) {
                Button {
                    Task {
                        do {
                            let user = try await viewModel.signInWithApple()
                            appState.currentUser = user
                            dismiss()
                        } catch {
                            print(error)
                        }
                    }
                } label: {
                    SocialLoginButton(socialLoginType: .apple)
                }
                
                Button {
                    Task {
                        do {
                            let user = try await viewModel.signInWithGoogle()
                            appState.currentUser = user
                            dismiss()
                        } catch {
                            print(error)
                        }
                    }
                } label: {
                    SocialLoginButton(socialLoginType: .google)
                }

                ORSeparator()
                
                NavigationLink(destination: EmailLoginView()) {
                        HStack {
                            Image(systemName: "envelope.fill")
                            Spacer()
                            Text(LoginType.email.title())
                                .fontWeight(.semibold)
                            Spacer()
                        }
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(.red)
                        .cornerRadius(10)
                        .padding(.horizontal)
                    }
            }
            
           
            
            HStack {
                Text("Don't have an account?")
                NavigationLink("Create An Account", destination: SignUpView())
            }
            .font(.footnote)
            Spacer()
        }
        .padding()
        .background(Color(.systemBackground))
    }
}

struct UserAuthView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            UserAuthView()
        }
        .environment(AppStateViewModel())  // 👈 inject environment manually for preview
    }
}
