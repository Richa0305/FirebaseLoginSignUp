import SwiftUI

@Observable
final class Theme: ObservableObject {
    var loginGradient: LinearGradient
    var primaryColor: Color
    var textFieldBackground: Color

    init(
        loginGradient: LinearGradient = LinearGradient(
            colors: [Color.red, Color.orange],
            startPoint: .top,
            endPoint: .bottom
        ),
        primaryColor: Color = .red,
        textFieldBackground: Color = Color(.secondarySystemBackground)
    ) {
        self.loginGradient = loginGradient
        self.primaryColor = primaryColor
        self.textFieldBackground = textFieldBackground
    }
}
