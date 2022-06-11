# Release

Based on https://docs.flutter.dev/deployment/android

## Environment variables

Set the following environment variables:

```
KEYSTORE_PASS=<password>
PLAY_STORE_CONFIG_JSON=<json configuration>
API_URL=<production environment>
```

## Build

Build the app for release:

```
flutter build appbundle --dart-define=API_URL=https://url
```

## Local testing

Before you start, download [bundletool](https://github.com/google/bundletool/releases/latest).

```
java -jar .\bundletool-all-1.10.0.jar build-apks --bundle=build/app/outputs/bundle/release/app-release.aab --output=build/outputs/app.apks --ks=android/app/upload-keystore.jks --ks-pass=pass:<pass> --ks-key-alias=upload

java -jar .\bundletool-all-1.10.0.jar install-apks --apks=build/outputs/app.apks --adb=<adb path>
```

## Fastlane

[Fastlane](https://docs.fastlane.tools/) is used to publish the app bundle to the playstore.

### Lanes

Currently the github actions will publish app blundles to `beta` late (open test).
The production release will be done manualy after the volunteer tester approve the version.
The following command should be run after `flutter build appbundle`.
The Google API Key is availabe as a environment variable into the github action.

```
cd android
fastlane beta
```

