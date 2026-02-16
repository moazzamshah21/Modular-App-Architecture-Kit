# Architecture

This document describes the architecture philosophy and folder structure of the Modular App Architecture Kit 2026.

## Philosophy

- **Feature-first**: Code is organized by feature (`auth`, `profile`, …), not by type (screens, widgets, services). Each feature owns its data, domain, and UI.
- **Clean layers**: Within a feature, we keep a clear flow: **Presentation → Domain → Data**. UI talks to controllers; controllers call use cases; use cases use repositories; repositories use datasources (Firebase, API, local).
- **Dependency rule**: Dependencies point inward. Domain does not depend on Flutter or GetX. Data can depend on external SDKs (Firebase, Dio). Presentation depends on GetX and Flutter.
- **Testability**: Use cases and repositories are plain Dart; they can be tested with mocks. Controllers and pages can be tested with GetX and widget tests.

## Folder breakdown

```
lib/
  core/           # Cross-cutting: config, DI, routes, theme, animations, services
  shared/         # Reusable widgets and extensions used by multiple features
  features/
    <feature>/    # One folder per feature
      data/       # Models, repositories (impl), datasources
      domain/     # Entities, repository contracts, use cases
      presentation/  # Controllers, pages, widgets
      bindings/   # GetX bindings for this feature
```

- **core**: Used by the whole app (env, app bindings, routes, theme, animations, Firebase/Dio services).
- **shared**: Extensions (e.g. theme, spacing) and widgets that don’t belong to a single feature.
- **features**: Each subfolder is a feature with the same internal structure so the architecture stays predictable and scalable.

## Data flow

```
Page (UI)
  → Controller (GetX)
    → UseCase (domain)
      → Repository (interface in domain, impl in data)
        → DataSource (Firebase / API / local)
```

For more detail and a diagram, see the [README](../README.md#-clean-architecture-diagram).
