🚀 Setup & Installation
1. Clone the repository
git clone <your-repo-url>
cd the_wallpaper_company

2. Install dependencies
flutter pub get

3. Run the app
flutter run

🔥 Firebase Setup
1. Install the FlutterFire CLI
dart pub global activate flutterfire_cli

2. Login to Firebase
flutterfire login

3. Initialize Firebase
flutterfire configure


Select your Firebase project and supported platforms (Android/iOS).

This automatically generates lib/firebase_options.dart.

4. Add platform-specific configuration files

google-services.json → android/app/

GoogleService-Info.plist → ios/Runner/

5. Enable required Firebase services

Cloud Messaging

Remote Config

📘 Reference: FlutterFire CLI Documentation

⚙️ Remote Config Keys
Key	Type	Description
dark_mode_enabled	bool	Toggles dark mode in the app.

Usage Example:

remoteConfig.getBool('dark_mode_enabled')

🌐 JSON Endpoint

Wallpapers are fetched from the endpoint below:

https://jsonkeeper.com/b/ORGZR


Each wallpaper object includes:

{
  "id": "1",
  "title": "Abstract Sky",
  "imageUrl": "https://example.com/image.jpg",
  "category": "Nature"
}

✨ Features

✅ Home screen with category carousel
✅ Staggered grid layout (Pinterest-style)
✅ Shimmer loading effect
✅ Fullscreen preview and favorites
✅ Pull-to-refresh and double-tap like animation
✅ Firebase Remote Config for dark mode
✅ Firebase Cloud Messaging notifications
✅ Provider for state management
✅ Persistent image caching
✅ Modern, responsive UI

💡 Suggested Feature Updates (For Open Source Contributors)
🧩 Beginner-Friendly Tasks

Fix small UI bugs or alignment issues.

Clean up redundant code or inconsistent formatting.

🌙 New Features

Dark Mode Toggle: Add a manual dark mode switch.

Search Wallpapers: Implement a search bar by title or category.

Share Wallpaper: Enable sharing via social media or chat apps.

🎨 UI/UX Enhancements

Onboarding Screens: Introduce an onboarding experience for new users.

Animations: Add smooth transitions and micro-interactions.

🌍 Localization

Add multi-language support (e.g., Hindi, Spanish).

🧪 Testing

Write unit tests for existing logic.

Add integration tests to ensure platform consistency.

📚 Documentation

Improve the README with contributor guidelines.

Add inline comments for complex sections of the codebase.

🐞 Open Issues

Create GitHub issues for the above enhancements with labels like:
good first issue, help wanted, enhancement.

🪪 License

This project is licensed under the MIT License.