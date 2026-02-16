# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added

- **Full project scaffold**: `modular_app create <project_name>` — runs `flutter create`, then injects full architecture (core, shared, features/auth, home, profile), main.dart, routes, bindings, theme, and merges required dependencies into pubspec. Enables one-command bootstrap: `modular_app create my_app` then `cd my_app && flutter pub get && flutter run`.

### Changed

- **README**: Quick start with `create` at top; CLI section documents create / generate / init; new “Publish & use as package” section; roadmap updated for full project scaffold.
- **docs/getting-started.md**: “Option A: Create a new project” and “Option B: Run this repo”; generate feature section clarified for use inside created or cloned projects.

### Fixed

- Nothing yet.

---

## [0.1.0] - 2026-02-16

### Added

- **Feature-first structure**: `lib/core/`, `lib/shared/`, `lib/features/` with clean architecture per feature (data / domain / presentation / bindings).
- **Auth feature**: Login, signup, splash with real `FirebaseAuth.instance.currentUser` check; GetX bindings and named routes.
- **Profile feature**: Non-auth example (entity, repository, use cases, controller, page) to show architecture beyond auth.
- **CLI** (`modular_app`): `generate feature <name>`, `init [--state=getx]`; creates full feature folders and binding stub.
- **Core services**: `FirebaseAuthService`, `FirestoreService`; `ApiClient` (Dio) with interceptors (auth, logging, error) and `ApiException`.
- **Animations**: `FadeIn`, `SlideIn`, `ScaleIn` with delay/duration/curve; `200.ms` extension.
- **Theme**: `AppTheme` (light/dark), `AppColors`, `AppTypography`; `theme_extensions` for spacing.
- **Config**: `Env` (dev/staging/prod) via `--dart-define=ENV=`.
- **Testing**: Mirror layout under `test/features/auth/`, `test/core/`; example UseCase test (mock repository), Repository test (mock datasource), API client test; `mocktail` for mocks.

### Changed

- N/A (initial release).

### Fixed

- N/A.

---

[Unreleased]: https://github.com/moazzamshah21/Modular-App-Architecture-Kit/compare/v0.1.0...HEAD
[0.1.0]: https://github.com/moazzamshah21/Modular-App-Architecture-Kit/releases/tag/v0.1.0
