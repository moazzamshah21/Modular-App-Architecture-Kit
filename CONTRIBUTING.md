# Contributing to Modular App Architecture Kit 2026

Thanks for considering contributing. This document explains how to propose changes and keep the project consistent.

## Code of conduct

Be respectful and constructive. This project aims to help teams ship maintainable Flutter apps.

## How to contribute

### Reporting bugs

- Use the issue tracker and choose the “Bug” template if available.
- Describe what you did, what you expected, and what happened (Flutter/Dart version, OS).
- If possible, add a minimal sample that reproduces the issue.

### Suggesting features or docs

- Open an issue with a clear title and description.
- Explain the problem you’re trying to solve and how your idea fits the architecture (feature-first, clean layers, CLI, etc.).

### Pull requests

1. **Fork** the repo and create a branch from `main` (e.g. `feature/your-feature` or `fix/issue-123`).
2. **Follow the existing style**
   - Feature code lives under `lib/features/<name>/` with `data/`, `domain/`, `presentation/`, `bindings/`.
   - Shared code goes in `lib/core/` or `lib/shared/`.
   - Run `flutter analyze` and fix any issues.
3. **Tests**
   - New logic should have tests where it makes sense (e.g. use cases, repositories, API client).
   - Mirror test layout: `test/features/<name>/`, `test/core/`.
   - Run `flutter test` and ensure it passes.
4. **Docs**
   - Update `README.md` or `docs/` if you change behavior or add features.
   - For user-facing changes, add a short entry to `CHANGELOG.md` under `[Unreleased]`.
5. **Commit**
   - Use clear commit messages (e.g. “Add pagination to ApiClient”, “Fix splash redirect when user is null”).
6. **Open a PR**
   - Describe what changed and why; link any related issues.
   - Keep the PR focused (one feature or fix per PR when possible).

### Project conventions

- **State**: GetX (bindings, controllers, reactive state).
- **Architecture**: Clean layers per feature (UI → Controller → UseCase → Repository → DataSource).
- **Naming**: `snake_case` for files/folders; `PascalCase` for classes; feature names singular (e.g. `auth`, `profile`).
- **CLI**: New commands or flags should be documented in the README and, if user-facing, in the CLI help and `CHANGELOG.md`.

## Questions

Open a discussion or an issue with the “Question” label. We’re happy to clarify the architecture or contribution process.

Thank you for contributing.
