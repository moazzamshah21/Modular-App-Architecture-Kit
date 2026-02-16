# Example app

The **example app is the project root** of this repository.

- Run it with `flutter run` from the repo root.
- The app demonstrates:
  - Splash → auth check → Login or Home
  - Auth flow (login, sign up) with Firebase
  - Profile feature (non-auth) with clean architecture
  - GetX bindings and named routes
  - Core animations, theme, and API client usage

To try the CLI without changing the main app, generate a new feature from the root:

```bash
dart run modularapparchitecture:modular_app generate feature my_feature
```

Then implement `lib/features/my_feature/` following the same pattern as `auth` and `profile`.
