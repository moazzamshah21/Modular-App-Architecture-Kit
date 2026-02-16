# Modular App Architecture Kit 2026

**Feature-first Flutter starter.** GetX · Clean architecture · Firebase · REST · CLI.  
Ship maintainable apps instead of untangled `lib/` folders.

---

## 🚀 What problem it solves

- **Scattered structure** — No more “where does this screen live?” or “is this a widget or a service?”. Every feature has one place: `features/<name>/`.
- **No clear data flow** — UI, business logic, and data are mixed. Here: **Page → Controller → UseCase → Repository → DataSource**. One direction, testable at every layer.
- **Auth and backend from zero** — Splash with a real auth check, login/signup, Firebase + optional REST client, and a CLI so you spend time on product, not boilerplate.
- **Starter that doesn’t scale** — This layout scales. Add features with the same pattern; the CLI generates the skeleton so the architecture stays consistent.

---

## 🧱 Architecture philosophy

- **Feature-first** — Code is organized by **feature** (auth, profile, settings), not by type (screens/, services/). Each feature owns its data, domain, and UI.
- **Clean layers** — Inside each feature: **data** (models, repos, datasources) → **domain** (entities, use cases, repo contracts) → **presentation** (controllers, pages, widgets). Dependencies point inward; domain stays framework-agnostic.
- **One flow everywhere** — Same pipeline for auth, profile, or any new feature: UI calls controller, controller calls use case, use case calls repository, repository uses datasource (Firebase, API, local). Easy to reason about and to test.

---

## 📦 Folder breakdown

```
modular_app_architecture/
  lib/
    core/              # App-wide: config, DI, routes, theme, animations, services
    shared/            # Reusable widgets & extensions (theme, spacing)
    features/
      auth/            # data → domain → presentation → bindings
      profile/         # Example non-auth feature (same structure)
      home/
  bin/                 # CLI: modular_app (generate feature, init)
  example/             # This repo root is the example app — run from root
  docs/                # architecture.md, getting-started.md
  test/                # Mirrors lib: test/features/auth/, test/core/
  CHANGELOG.md
  CONTRIBUTING.md
  LICENSE
  README.md
```

- **core** — Config (env), app bindings, routes, theme, animations, Firebase/Dio services.
- **shared** — Things used by many features (e.g. theme extensions, spacing).
- **features** — One folder per feature; each has `data/`, `domain/`, `presentation/`, `bindings/`.

---

## 📐 Clean architecture diagram

```
┌─────────────────────────────────────────────────────────────────┐
│  PRESENTATION (Flutter + GetX)                                    │
│  Page → Controller (GetxController)                              │
└────────────────────────────┬────────────────────────────────────┘
                             │ calls
                             ▼
┌─────────────────────────────────────────────────────────────────┐
│  DOMAIN (pure Dart)                                               │
│  UseCase → Repository (abstract)                                  │
└────────────────────────────┬────────────────────────────────────┘
                             │ implemented by
                             ▼
┌─────────────────────────────────────────────────────────────────┐
│  DATA                                                             │
│  RepositoryImpl → DataSource (Firebase / ApiClient / local)       │
└─────────────────────────────────────────────────────────────────┘
```

**Example flow:**  
`LoginPage` → `AuthController.login()` → `LoginUseCase()` → `AuthRepository.login()` → `AuthDatasourceImpl` (Firebase).

---

## 🔥 CLI commands

From the **project root**:

```bash
# Generate a full feature (data, domain, presentation, bindings)
dart run modularapparchitecture:modular_app generate feature <name>

# Examples
dart run modularapparchitecture:modular_app generate feature settings
dart run modularapparchitecture:modular_app generate feature orders
```

```bash
# Init / state management (GetX is the default)
dart run modularapparchitecture:modular_app init --state=getx
```

The generator creates the folder tree and a GetX binding stub so you stay consistent with the rest of the app.

---

## 🎬 Animations

Pre-built widgets with delay, duration, and curve:

```dart
import 'package:modularapparchitecture/core/animations/animations.dart';

FadeIn(delay: 200.ms, child: MyCard())
SlideIn(offset: const Offset(0, 0.1), child: MyList())
ScaleIn(begin: 0.8, child: MyDialog())
```

`200.ms` is an extension on `int` for `Duration(milliseconds: 200)`.

---

## 🔐 Auth flow

- **Splash** — Waits briefly, then checks `FirebaseAuth.instance.currentUser`. If logged in → Home; else → Login. Production-valid, no fake flags.
- **Login / Sign up** — Wired to `AuthController` and use cases; errors and loading state handled.
- **Routes** — Named routes (splash, login, signup, home, profile) with GetX; auth and profile use route-level bindings so dependencies are scoped.

Firebase config: add `google-services.json` and `GoogleService-Info.plist`. Core auth/Firestore helpers live in `core/services/`. Use them from **datasources** only, not from UI.

---

## 🌐 REST (API client)

For hybrid apps (Firebase + your API), use the shared **Dio** client:

- **Interceptors**: Auth (e.g. token), logging, and error mapping to `ApiException`.
- **Methods**: `get`, `post`, `put`, `delete`.
- **ApiException**: `message`, `statusCode`, `code`; built from `DioException` for consistent handling in repositories.

Lives in `core/services/api_client.dart`. Inject it in datasources the same way you inject Firebase services.

---

## 🛣 Roadmap

- [x] Feature-first structure and CLI (`generate feature`)
- [x] Auth flow with real Firebase auth check
- [x] Example non-auth feature (profile)
- [x] API client (Dio + interceptors + ApiException)
- [x] Testing layout and example UseCase/Repository tests
- [ ] Riverpod option for `init` (alongside GetX)
- [ ] CLI: `add firebase` (auth + Firestore) and `add api` scaffolding
- [ ] Optional VSCode snippet / extension for new feature files
- [ ] Backend starter alignment (e.g. API contract templates)

---

## Quick start

1. **Clone** and open the repo root.
2. **Install**: `flutter pub get`
3. **(Optional)** Add Firebase config files for auth/Firestore.
4. **Run**: `flutter run`
5. **Generate a feature**: `dart run modularapparchitecture:modular_app generate feature <name>`

More detail: [docs/getting-started.md](docs/getting-started.md).  
Architecture deep-dive: [docs/architecture.md](docs/architecture.md).

---

## License

MIT — see [LICENSE](LICENSE).  
Contributions welcome — see [CONTRIBUTING.md](CONTRIBUTING.md).
