# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added

- **App templates**: Choose from 4 templates when creating a project:
  - E-Commerce (products, cart, checkout)
  - Messaging (chat list, chat screen)
  - Music/Video (library, player, playlists)
  - Sleep Tracker (logs, analytics)
- **Splash screen** with auth check in all templates.
- **Improved UI**: Themed inputs, cards, empty states, error handling for all templates.
- **Template selection**: Interactive prompt (1–4) or `--template=<name>` flag.
- **Relative imports** in templates for portability.

### Changed

- **Removed default template**: Only templates from `templates/` folder (ecommerce, messaging, media, sleep_tracker).
- **Generated structure**: `lib/app/` with bindings, controllers, models, services, views, routes (instead of core/features).
- **README**: Updated with template docs, setup commands, and `dart run` alternative for global cache issues.
- **docs/architecture.md**: Documents template structure.
- **docs/getting-started.md**: Template selection, troubleshooting.

### Fixed

- **CartController not found** in E-Commerce: Added CartBinding to home and product detail routes.
- **Chat screen** in Messaging: Loads messages when opened.
- **Package imports**: Templates use relative imports so generated projects work without package name replacement.

---

## [0.1.0] - 2026-02-16

### Added

- Feature-first structure, auth flow, profile feature, CLI, core services, animations, theme, testing layout.

---

[Unreleased]: https://github.com/moazzamshah21/Modular-App-Architecture-Kit/compare/v0.1.0...HEAD
[0.1.0]: https://github.com/moazzamshah21/Modular-App-Architecture-Kit/releases/tag/v0.1.0
