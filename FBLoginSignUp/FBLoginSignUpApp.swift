//
//  FBLoginSignUpApp.swift
//  FBLoginSignUp
//
//  Created by richa on 6/18/25.
//

import SwiftUI
import FirebaseCore


class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}

@main
struct FBLoginSignUpApp: App {
  // register app delegate for Firebase setup
  @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
  @State private var theme = Theme()


  var body: some Scene {
    WindowGroup {
      NavigationView {
        ContentView()
      }
      .environment(theme)
    }
  }
}
