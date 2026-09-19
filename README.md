[![Build](https://github.com/e-cordel/ecordel-mobile/actions/workflows/build.yml/badge.svg)](https://github.com/e-cordel/ecordel-mobile/actions/workflows/build.yml)

# E-cordel app

Mobile app for reading digital cordels.

## Getting started

This README assumes that you already have the required Flutter development environment configured on your machine.

To set up your environment and run the project locally, follow the official Flutter installation guide: https://flutter.dev/docs/get-started/install

### Running the project

List available emulators:

    flutter emulators

Launch an emulator:

    flutter emulators --launch <emulator-name>

With a device or emulator connected, run:

    flutter run

### Overriding configuration

You can use compile-time variables to override the settings defined in [env_config.dart](lib/configs/env_config.dart).

    flutter run --dart-define=API_URL=http://192.168.1.2:5000/api/v1

Example with a local backend:

    flutter run --dart-define=API_URL=http://localhost:8080/api/v1

### Debug APK build

    flutter build apk --debug

### Before pushing changes

```shell
dart format .
flutter analyze .
```

## Documentation

[Documentation](./docs/).

## How to contribute

For help and information about contributing to the project, visit the official [E-cordel contribution page](http://www.ecordel.com.br/como-contribuir).

## Communication channels

Find us on the following platforms:

<a href="https://ecordel.com.br/"><img align="center" alt="E-cordel website" height="27" width="90" src="https://img.shields.io/badge/website-000000?style=for-the-badge&logo=About.me&logoColor=white"></a>

<a href="https://www.linkedin.com/company/e-cordel/"> <img align="center" alt="LinkedIn" height="27" width="90" src="https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white"> </a>

<a href="https://www.instagram.com/projetoecordel/"><img align="center" alt="Instagram" height="27" width="90" src="https://img.shields.io/badge/Instagram-E4405F?style=for-the-badge&logo=instagram&logoColor=white"></a>