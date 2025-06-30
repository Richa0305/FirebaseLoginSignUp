# Firebase Login & Sign-Up Template

A SwiftUI starter project demonstrating Firebase Authentication with:

- **Email / Password**  
- **Google Sign-In**  
- **Sign in with Apple**  

---

## 🚀 Getting Started

1. **Clone** this repo and open `FBLoginSignUp.xcodeproj` (or `.xcworkspace` if using CocoaPods).  
2. **Obtain** a `GoogleService-Info.plist` from your Firebase project, and place it xcode project
3. In **Info.plist**, replace these placeholders:
   ```xml
   <key>CLIENT_ID</key>
   <string>__YOUR_GOOGLE_CLIENT_ID__</string>
   <key>REVERSED_CLIENT_ID</key>
   <string>__YOUR_REVERSED_CLIENT_ID__</string>```

4. **Set** your Xcode target’s **Bundle Identifier** (must match Firebase) and select your **Signing Team**.
5. **Build & run** on device. Its recommended to run on device for Apple Sign In to work properly.

---

## 🔧 Firebase Project Setup

1. **Create / Select** a project in the [Firebase Console](https://console.firebase.google.com/).
2. **Add iOS app**:

   * **Bundle ID**: must exactly match step 4 above.
   * Register and click **Download GoogleService-Info.plist**.
3. **Add** that downloaded plist to your Xcode project (target: `FBLoginSignUp`).
4. **Copy** the `CLIENT_ID` & one `REVERSED_CLIENT_ID` from the plist into your **Info.plist** placeholders.
5. **Enable** sign-in methods (Console → Authentication → Sign-in method):

   * **Email/Password**
   * **Google**
   * **Apple**
6. **Download GoogleService-Info.plist** after enabling the signin methods and replace existing GoogleService-Info.plist with this new one
7. In **Info.plist**, replace these placeholders:
   ```xml
   <key>CLIENT_ID</key>
   <string>__YOUR_GOOGLE_CLIENT_ID__</string>
   <key>REVERSED_CLIENT_ID</key>
   <string>__YOUR_REVERSED_CLIENT_ID__</string>```


* **Apple** (*requires a paid Apple Developer account*):
     1. In Apple Developer Portal, add “Sign in with Apple” to your App ID.
     2. Create a Services ID, configure return URLs, generate a key and upload it in Firebase.

---

## 🧰 Customization

* **Assets**: swap out images in `Assets.xcassets`.
* **Branding**: if you restyle Apple/Google buttons, follow their [HIG](https://developer.apple.com/design/human-interface-guidelines/) and [Brand Guidelines](https://developers.google.com/identity/branding-guidelines).
* **Styling**: adjust gradients, corner radii, fonts, colors in the SwiftUI views to match your app.

---

## 🏃‍♀️ Testing

* **Email/Password** → Create account, sign out, sign back in.
* **Google** → Tap “Continue with Google” and choose an account.
* **Apple** → Tap “Continue with Apple” (Sandbox tester on simulator; real Apple ID on device).

---

## 📜 License

This template is MIT-licensed. See LICENSE for details.
*The Google “G” logo is for demo only—replace with your own asset before shipping.*
