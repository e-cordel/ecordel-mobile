# Release

Based on https://docs.flutter.dev/deployment/android

## Build variable

Set the following environment variables:

```
KEYSTORE_PASS=<password>
KEYSTORE_PASS=<password>
```

then build the app for release:

```
flutter build appbundle --dart-define=API_URL=https://url
```

## Local testing

Before you start, download [bundletool](https://github.com/google/bundletool/releases/latest).

```
java -jar .\bundletool-all-1.10.0.jar build-apks --bundle=build/app/outputs/bundle/release/app-release.aab --output=build/outputs/app.apks --ks=android/app/upload-keystore.jks --ks-pass=pass:<pass> --ks-key-alias=upload

java -jar .\bundletool-all-1.10.0.jar install-apks --apks=build/outputs/app.apks --adb=<adb path>
```
