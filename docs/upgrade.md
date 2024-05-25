# Upgrade SDK

Check detailed information about upgrading flutter project in the link below:

https://docs.flutter.dev/release


## Flutter

To upgrade flutter run the following commands:

```
flutter upgrade
flutter pub upgrade
```

https://docs.flutter.dev/release/upgrade

## Gradle

To upgrade gradle run the following commands:

```
cd android
./gradlew wrapper --gradle-version=<new version>
```

https://docs.flutter.dev/release/breaking-changes/android-java-gradle-migration-guide

# Java & SDK

Check [JDKs page](https://developer.android.com/build/jdks) to verify compatibility between and Android API and Java version.

Change the `compileSdkVersion` accordingly.

If java version is updated in gradle files it is also necessary to change the value used in the workflows.
