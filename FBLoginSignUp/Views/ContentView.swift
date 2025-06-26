import SwiftUI

struct ContentView: View {
    @State private var appState = AppStateViewModel()
    
    var body: some View {
        NavigationStack {
            if let user = appState.currentUser {
                HomeView(user: user)
            } else {
                UserAuthView()
            }
        }
        .environment(appState)
    }
}

#Preview {
    ContentView()
}
