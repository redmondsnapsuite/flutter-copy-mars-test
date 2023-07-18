// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyC5ICJ_svqgUeUIbTBh6R_l77Uw9nZ2glQ',
    appId: '1:142151271468:web:852d5ee8c2132bd8133d89',
    messagingSenderId: '142151271468',
    projectId: 'mars-flutter-test',
    authDomain: 'mars-flutter-test.firebaseapp.com',
    storageBucket: 'mars-flutter-test.appspot.com',
    measurementId: 'G-M2L53DKXSL',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCx0JXq2ZofEvPMydi03BGvCTtoOdSAJv0',
    appId: '1:142151271468:android:7b017ed790046dce133d89',
    messagingSenderId: '142151271468',
    projectId: 'mars-flutter-test',
    storageBucket: 'mars-flutter-test.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBwP8bPmKyyoL-cp8YIcVS6_4eaInsl-dc',
    appId: '1:142151271468:ios:929d861068000ed8133d89',
    messagingSenderId: '142151271468',
    projectId: 'mars-flutter-test',
    storageBucket: 'mars-flutter-test.appspot.com',
    iosClientId: '142151271468-hd4hhdort1r0v3go816gtlf6d5t1sgoc.apps.googleusercontent.com',
    iosBundleId: 'com.example.marsTest',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBwP8bPmKyyoL-cp8YIcVS6_4eaInsl-dc',
    appId: '1:142151271468:ios:929d861068000ed8133d89',
    messagingSenderId: '142151271468',
    projectId: 'mars-flutter-test',
    storageBucket: 'mars-flutter-test.appspot.com',
    iosClientId: '142151271468-hd4hhdort1r0v3go816gtlf6d5t1sgoc.apps.googleusercontent.com',
    iosBundleId: 'com.example.marsTest',
  );
}