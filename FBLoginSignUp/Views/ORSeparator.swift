//
//  ORSeparator.swift
//  FBLoginSignUp
//
//  Created by richa on 6/19/25.
//

import SwiftUI
struct ORSeparator: View {
    var body: some View {
        HStack {
            Rectangle()
                .frame(height: 1)
                .foregroundColor(Color(.separator))
            Text("or")
                .foregroundColor(.secondary)
                .font(.subheadline)
                .padding(.horizontal)
            Rectangle()
                .frame(height: 1)
                .foregroundColor(Color(.separator))
        }
        .padding(.horizontal)
    }
}
