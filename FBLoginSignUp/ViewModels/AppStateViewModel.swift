//
//  AppStateViewModel.swift
//  FBLoginSignUp
//
//  Created by richa on 6/19/25.
//

import Foundation
import SwiftUI

@Observable
final class AppStateViewModel: ObservableObject {
    var currentUser: UserInfo? = nil
    
    init() {
        self.currentUser = AuthenticationManager.shared.getLoggedInUser()
    }
    
    func signOut() throws {
        try AuthenticationManager.shared.signOut()
    }
}
