//
//  Untitled.swift
//  FBLoginSignUp
//
//  Created by richa on 6/19/25.
//

import SwiftUI
struct SocialLoginButton: View {
    let socialLoginType: LoginType

    var body: some View {
        HStack {
            if socialLoginType == .apple {
                Image(systemName: "applelogo")
                    .foregroundColor(Color.primary)
            } else {
                Image(socialLoginType.rawValue)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 18, height: 18)
            }
            
            Spacer()
            Text(socialLoginType.title())
                .foregroundColor(Color.primary)
                .fontWeight(.medium)
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color(.secondarySystemBackground))
        .cornerRadius(10)
        .padding(.horizontal)
    }
}
