#!/bin/bash

VERSION=$(yq .version pubspec.yaml)
BUILD_NAME=$(echo $VERSION | cut -d+ -f1)
BUILD_NUMBER=$(echo $VERSION | cut -d+ -f2)
NEW_VERSION=$BUILD_NAME+$(( $BUILD_NUMBER + 1))

echo $NEW_VERSION

env="$NEW_VERSION" yq e '.version = strenv(env)' pubspec.yaml > pubspec.yaml.new

diff -U0 -w -b --ignore-blank-lines pubspec.yaml pubspec.yaml.new > a.diff

patch pubspec.yaml < a.diff

exit 0;
