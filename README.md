# Modular App Architecture Kit 2026

**What it is:** A CLI that generates full Flutter apps from templates. You choose an app type (E-Commerce, Messaging, Music/Video, Sleep Tracker), run one command, and get a ready-to-run project with auth, navigation, and a clean structure.

**Why use it:** Skip the boilerplate. Instead of wiring up GetX, routes, bindings, and auth screens from scratch, you get a working app in seconds. Replace the dummy Firebase service with your real API and ship.

---

## How to use

### Install the CLI

```bash
dart pub global activate modularapparchitecture
```

### Create a project

```bash
modular_app create my_app
```

You’ll be prompted to pick a template (1–4). Or skip the prompt:

```bash
modular_app create my_app --template=ecommerce
modular_app create my_chat --template=messaging
modular_app create my_media --template=media
modular_app create my_sleep --template=sleep_tracker
```

### Run the app

```bash
cd my_app
flutter pub get
flutter run
```

---

## Templates

| Template | Key | What you get |
|----------|-----|---------------|
| **E-Commerce** | `ecommerce` | Login, signup, product list, cart, checkout |
| **Messaging** | `messaging` | Auth, chat list, chat screen, profile |
| **Music/Video** | `media` | Auth, media library, player |
| **Sleep Tracker** | `sleep_tracker` | Auth, sleep log, analytics |

Each template includes a splash screen with auth check, GetX bindings and controllers, and a dummy Firebase service you can swap for your own backend.

---

## Generated structure

```
my_app/
├── lib/
│   ├── main.dart
│   └── app/
│       ├── bindings/
│       ├── controllers/
│       ├── models/
│       ├── services/
│       ├── views/
│       └── routes/
└── pubspec.yaml
```

---

## License

MIT — see [LICENSE](LICENSE).
