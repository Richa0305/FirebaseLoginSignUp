//
//  HomeView.swift
//  FBLoginSignUp
//
//  Created by richa on 6/19/25.
//

import SwiftUI

struct HomeView: View {
    let user: UserInfo
    @Environment(AppStateViewModel.self) private var appState
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Welcome \(user.displayName ?? "User")!")
                .font(.title)
                .fontWeight(.bold)
            
            Button(action: {
                do {
                    try appState.signOut()
                    appState.currentUser = nil
                } catch {
                    print("Sign out error: \(error.localizedDescription)")
                }
            }) {
                Text("Logout")
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
    }
}
