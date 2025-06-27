# Firebase Login SignUp Template

This repository provides a basic SwiftUI project that demonstrates Firebase authentication with Email, Google, and Apple sign-in flows. It is intended as a starting point that you can integrate into your own iOS apps.

## Getting Started

1. **Clone the repository** and open `FBLoginSignUp.xcodeproj` in Xcode.
2. **Add your Firebase configuration:**
   - Obtain a `GoogleService-Info.plist` from your Firebase project.
   - Place it in `FBLoginSignUp/` (the app target).
   - Update `Info.plist` with your reversed client ID and client ID.
3. **Set your bundle identifier and signing team** in Xcode.
4. **Build and run** on your device or simulator.

## Customization

- Update the assets in `Assets.xcassets` with your own images or colors.
- The project uses official Apple and Google sign-in buttons. Follow their branding guidelines if you customize them.
- You can replace the gradient or other theme values in the Swift code to match your app.

## License

This template is released under the MIT License. See [LICENSE](LICENSE) for details.

The included Google logo is for demonstration purposes. Replace it with your own asset if needed.

