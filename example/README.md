# Example app

The **example app is the project root** of this repository.

- Run it with `flutter run` from the repo root.
- The app demonstrates the package's built-in structure: `lib/core/`, `lib/features/`, `lib/shared/`.

## Create a new app from templates

To create a new app with one of the 4 templates (E-Commerce, Messaging, Music/Video, Sleep Tracker):

```bash
# From the parent of this repo
cd ..
dart run modularapparchitecture/bin/modular_app.dart create my_app --template=ecommerce
cd my_app && flutter pub get && flutter run
```

Or with template selection prompt:

```bash
dart run modularapparchitecture/bin/modular_app.dart create my_app
# Then choose 1–4 when prompted
```

## Generate a feature

To add a new feature to a project with `lib/features/` structure:

```bash
dart run modularapparchitecture:modular_app generate feature my_feature
```
