# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added

- Nothing yet.

### Changed

- Nothing yet.

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

[Unreleased]: https://github.com/your-username/modular-app-architecture/compare/v0.1.0...HEAD
[0.1.0]: https://github.com/your-username/modular-app-architecture/releases/tag/v0.1.0
