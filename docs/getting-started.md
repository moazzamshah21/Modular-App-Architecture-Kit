# Getting started

Quick setup to run the Modular App Architecture Kit 2026, create a new project, or generate your first feature.

## Prerequisites

- Flutter SDK (stable)
- Dart 3.x

## Option A: Create a new project (recommended)

Use the CLI to create a full Flutter app with the architecture already in place:

```bash
# Install the CLI (from pub.dev after publishing, or from this repo)
dart pub global activate modularapparchitecture

# Create the project
modular_app create my_app
cd my_app
flutter pub get
flutter run
```

Without global install (e.g. from this repo):

```bash
dart run modularapparchitecture:modular_app create my_app
cd my_app
flutter pub get
flutter run
```

This gives you `core/`, `shared/`, `features/auth`, `features/home`, `features/profile`, routes, bindings, and theme. Optionally add Firebase config files for auth/Firestore.

## Option B: Run this repo as the app

1. Clone the repo and open the project root.
2. Install dependencies:
   ```bash
   flutter pub get
   ```
3. (Optional) Firebase: add `google-services.json` (Android) and `GoogleService-Info.plist` (iOS) so auth and Firestore work. The app still runs without them (splash will redirect to login).
4. Run:
   ```bash
   flutter run
   ```

## Generate a new feature

From the **project root** (an app created with `modular_app create` or this repo):

```bash
dart run modularapparchitecture:modular_app generate feature <name>
```

Example:

```bash
dart run modularapparchitecture:modular_app generate feature settings
```

This creates `lib/features/settings/` with `data/`, `domain/`, `presentation/`, and `bindings/`. Next steps:

1. Add your entity, repository, use cases, and datasource.
2. Register the feature in `core/routes/app_routes.dart` and in `GetMaterialApp`’s `getPages`.
3. Attach the feature’s binding to its route.

Use the existing `auth` and `profile` features as references.

## Tests

```bash
flutter test
```

Tests live under `test/features/` and `test/core/`, mirroring `lib/`. See example UseCase and Repository tests there.

## Environment

Build for a specific environment:

```bash
flutter run --dart-define=ENV=dev
flutter run --dart-define=ENV=staging
flutter run --dart-define=ENV=prod
```

Use `Env.current` from `lib/core/config/env.dart` in your code.

For more (CLI, auth flow, animations, API client), see the [README](../README.md).
