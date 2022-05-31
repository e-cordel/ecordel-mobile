# Release

Baseado em https://docs.flutter.dev/deployment/android

## Testar em devices locais

Antes de inciar faça o download do [bundletool](https://github.com/google/bundletool/releases/latest).

```
flutter build appbundle --dart-define=API_URL=https://url

java -jar .\bundletool-all-1.10.0.jar build-apks --bundle=build/app/outputs/bundle/release/app-release.aab --output=build/outputs/app.apks --ks=android/app/upload-keystore.jks --ks-pass=pass:<pass> --ks-key-alias=upload

java -jar .\bundletool-all-1.10.0.jar install-apks --apks=build/outputs/app.apks --adb=<adb path>
```
