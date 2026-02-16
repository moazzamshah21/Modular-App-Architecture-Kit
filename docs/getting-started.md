# Getting started

Quick setup to create a new project with the Modular App Architecture Kit 2026.

## Prerequisites

- Flutter SDK (stable)
- Dart 3.x

## Create a new project

### Option 1: With template selection (interactive)

```bash
# Activate CLI (from package directory)
cd /path/to/modularapparchitecture
dart pub global activate --source path .

# Create project (you'll be prompted to choose 1–4)
cd /path/to/your/projects
modular_app create my_app
```

You'll see:

```
=== Choose a template ===
  1) E-Commerce (products, cart, checkout)
  2) Messaging (chat list, chat screen)
  3) Music/Video (library, player, playlists)
  4) Sleep Tracker (logs, analytics)
  Enter number (1-4): 
```

Type 1, 2, 3, or 4 and press Enter.

### Option 2: Specify template directly

```bash
modular_app create my_app --template=ecommerce
modular_app create my_chat --template=messaging
modular_app create my_media --template=media
modular_app create my_sleep --template=sleep_tracker
```

### Option 3: Run CLI directly (no global install)

```bash
cd /path/to/your/projects
dart run /path/to/modularapparchitecture/bin/modular_app.dart create my_app --template=ecommerce
```

## Run the app

```bash
cd my_app
flutter pub get
flutter run
```

## Next steps

1. **Replace dummy Firebase**: Edit `lib/app/services/firebase_service.dart` with real Firebase Auth, Firestore, or REST API calls.
2. **Add Firebase config**: Add `google-services.json` (Android) and `GoogleService-Info.plist` (iOS) for Firebase.
3. **Customize**: Modify views, models, and controllers to fit your app.

## Generate a feature (for feature-first projects)

If your project uses `lib/features/` structure, you can generate new features:

```bash
modular_app generate feature <name>
```

This creates `lib/features/<name>/` with data, domain, presentation, bindings.

## Troubleshooting

**"Injecting modular architecture (core, shared, features)"** — You're running an old CLI. Use:

```bash
dart pub global deactivate modularapparchitecture
dart pub global activate --source path .
```

Or run directly: `dart run modularapparchitecture/bin/modular_app.dart create my_app`

**No template prompt** — Run from a real terminal (Terminal.app, iTerm). Or use `--template=ecommerce` to skip the prompt.
