#!/usr/bin/env bash

# Place for user-defined environment variables
FLUTTER_CHANNEL=stable

# Install Flutter SDK
echo "Installing Flutter SDK..."
git clone https://github.com/flutter/flutter.git -b $FLUTTER_CHANNEL
export PATH=`pwd`/flutter/bin:$PATH

echo "Flutter SDK Version:"
flutter --version

# Install dependencies
flutter pub get

# flutter build appbundle
