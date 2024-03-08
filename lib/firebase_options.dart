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
    apiKey: 'AIzaSyA1tqatdRJ6E2KssCDgMO6bpFxk2KIwj48',
    appId: '1:244150481692:web:b7e409ac75dcc6d69d80d9',
    messagingSenderId: '244150481692',
    projectId: 'currency-e266f',
    authDomain: 'currency-e266f.firebaseapp.com',
    storageBucket: 'currency-e266f.appspot.com',
    measurementId: 'G-JZG0437MR7',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBnbfq0fpsURO8t-y_qSHe_nzDhJRmB9fM',
    appId: '1:244150481692:android:f063c7691555a1c09d80d9',
    messagingSenderId: '244150481692',
    projectId: 'currency-e266f',
    storageBucket: 'currency-e266f.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD4dop-XbJw2EszB77Cv80iREhnJbBiNyw',
    appId: '1:244150481692:ios:d7f4155c2f10ab009d80d9',
    messagingSenderId: '244150481692',
    projectId: 'currency-e266f',
    storageBucket: 'currency-e266f.appspot.com',
    iosBundleId: 'com.example.currencyexchange1',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD4dop-XbJw2EszB77Cv80iREhnJbBiNyw',
    appId: '1:244150481692:ios:e32ad5073c042bcf9d80d9',
    messagingSenderId: '244150481692',
    projectId: 'currency-e266f',
    storageBucket: 'currency-e266f.appspot.com',
    iosBundleId: 'com.example.currencyexchange1.RunnerTests',
  );
}