# Firebase Login & Sign-Up Template

A SwiftUI starter project demonstrating Firebase Authentication with:

- **Email / Password**  
- **Google Sign-In**  
- **Sign in with Apple**  

---

## 🚀 Getting Started

1. **Clone** this repo and open `FBLoginSignUp.xcodeproj` (or `.xcworkspace` if using CocoaPods).  
2. **Bundle Identifier**  
   - This template ships with `com.yourcompany.FBLoginSignUp`.  
   - Replace it in Xcode with your own app’s bundle ID (must match Firebase).  
3. **Initial Firebase config**  
   - In the Firebase console, under your iOS app, **download** the `GoogleService-Info.plist`.  
   - Drag it into your Xcode project (target: `FBLoginSignUp`).  
4. **Enable Authentication Providers**
In Firebase Console → **Authentication** → **Sign-in method** enable:

   * **Email/Password**
   * **Google**
   * **Apple** (*requires paid Apple Developer account*)

5. **Re-download the Firebase config**  
   - After you enable Google & Apple sign-in in the Firebase console, download a fresh `GoogleService-Info.plist`.  
   - Overwrite the existing plist in your Xcode project with this new file—this is critical for Google Sign-In to work correctly, as the initial download won’t include the updated OAuth credentials.
  
6. **Fill Info.plist placeholders**  
   ```
   xml
   <key>CLIENT_ID</key>
   <string>__YOUR_GOOGLE_CLIENT_ID__</string>
   <key>REVERSED_CLIENT_ID</key>
   <string>__YOUR_REVERSED_CLIENT_ID__</string>
   ```
   
Copy those values from the downloaded plist.
7. **Signing & Capabilities**  
   - Under **Signing & Capabilities**, select your **Team** and enable **Automatic signing**.  
   - To use **Sign in with Apple**, you **must** have a **paid Apple Developer Program** membership. 
8. **Build & Run** on device (recommended) or simulator.

---

## 🧰 Customization

* **Assets**: swap images in `Assets.xcassets`.
* **Branding**: if restyling Apple/Google buttons, follow their [HIG](https://developer.apple.com/design/human-interface-guidelines/) and [Brand Guidelines](https://developers.google.com/identity/branding-guidelines).
* **Styling**: tweak gradients, fonts, corner radii in SwiftUI views.

---

## 🏃‍♀️ Testing

* **Email/Password** → sign up, sign out, sign back in.
* **Google** → tap “Continue with Google” and choose an account.
* **Apple** → tap “Continue with Apple” (use a sandbox tester on simulator or a real Apple ID on device).

---

## 📜 License

This template is MIT-licensed. See [LICENSE](LICENSE).
*The Google “G” logo is demo-only—replace with your own asset before shipping.*


