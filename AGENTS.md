# ecordel-mobile - AGENTS Guide

## Project Purpose
Flutter application for reading digital cordels on mobile devices.

## Tech Stack
- Flutter
- Dart (SDK >=3.1.0 <4.0.0)
- Provider (state management)
- Dio (HTTP client)

## Key Commands
- Install deps: `flutter pub get`
- Run app: `flutter run`
- Run with custom API URL:
  - `flutter run --dart-define=API_URL=http://<host>:<port>/api/v1`
- Build debug APK: `flutter build apk --debug`

## Quality Commands
- Format: `dart format .`
- Static analysis: `flutter analyze .`
- Tests: `flutter test`

## API Integration
- Consumes endpoints from `../ecordel-restapi`.
- API base URL can be overridden via `--dart-define`.
- Keep app models and repository layer aligned with backend OpenAPI changes.

## Important Paths
- App entrypoint: `lib/main.dart`
- Runtime config: `lib/configs/env_config.dart`
- Assets: `assets/images`, `assets/fonts`

## Development Notes
- Ensure emulator/device is available before `flutter run`.
- Use `flutter emulators` and `flutter emulators --launch <emulator-name>` when needed.
- Confirm connectivity to local API from emulator/device network.
