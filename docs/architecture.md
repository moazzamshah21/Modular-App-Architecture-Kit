# Architecture

This document describes the architecture of the Modular App Architecture Kit 2026 and the structure of generated projects.

## Generated app structure (templates)

When you run `modular_app create my_app`, you choose a template. Each template produces:

```
lib/
  main.dart
  app/
    bindings/       # GetX bindings (AuthBinding, CartBinding, etc.)
    controllers/    # GetX controllers
    models/         # Data models (User, Product, etc.)
    services/       # firebase_service.dart (dummy — replace with real Firebase/API)
    views/          # Pages organized by feature (auth/, home/, cart/, etc.)
    routes/         # app_pages.dart with named routes
```

- **bindings**: Register controllers and services with GetX.
- **controllers**: GetX controllers with reactive state (`Obx`).
- **models**: Plain Dart models for data.
- **services**: Dummy Firebase/API — replace with real implementations.
- **views**: Flutter pages (login, home, cart, etc.).
- **routes**: Named routes and `GetPage` definitions.

## Data flow

```
Page (UI)
  → Controller (GetX)
    → Service (Firebase / API)
```

Replace the dummy `firebase_service.dart` with real Firebase Auth, Firestore, or REST API calls.

## Splash & auth

- **Splash**: Shows for ~1.5s, checks auth state, then navigates to Login or main screen.
- **Login / Sign up**: Wired to `AuthController`; errors and loading handled.
- **Routes**: Named routes with GetX; bindings attached per route.

## Philosophy

- **Template-first**: Start with a working app (E-Commerce, Messaging, etc.) and customize.
- **GetX**: State management, routing, dependency injection.
- **Dummy services**: Replace `firebase_service.dart` with real backend logic.
