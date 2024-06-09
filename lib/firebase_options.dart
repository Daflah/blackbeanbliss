// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyB6S9XHrKGBgh4LaFs2SXAVGjczbweuKCo',
    appId: '1:567117493827:web:af3857dfaffbff3534c6f6',
    messagingSenderId: '567117493827',
    projectId: 'blackbeanbliss-3e2e4',
    authDomain: 'blackbeanbliss-3e2e4.firebaseapp.com',
    storageBucket: 'blackbeanbliss-3e2e4.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDVUvFDJVR0rdFK6dwUxSqU6-QxnYIhBMI',
    appId: '1:567117493827:android:0cf5fe5d50aaeeb034c6f6',
    messagingSenderId: '567117493827',
    projectId: 'blackbeanbliss-3e2e4',
    storageBucket: 'blackbeanbliss-3e2e4.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDWyICYb_u863dOp0zKQUfhIKq8q-4kkbM',
    appId: '1:567117493827:ios:685312acb67c983d34c6f6',
    messagingSenderId: '567117493827',
    projectId: 'blackbeanbliss-3e2e4',
    storageBucket: 'blackbeanbliss-3e2e4.appspot.com',
    iosBundleId: 'com.example.blackbeanbliss',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDWyICYb_u863dOp0zKQUfhIKq8q-4kkbM',
    appId: '1:567117493827:ios:685312acb67c983d34c6f6',
    messagingSenderId: '567117493827',
    projectId: 'blackbeanbliss-3e2e4',
    storageBucket: 'blackbeanbliss-3e2e4.appspot.com',
    iosBundleId: 'com.example.blackbeanbliss',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyB6S9XHrKGBgh4LaFs2SXAVGjczbweuKCo',
    appId: '1:567117493827:web:4db6a2f5a1cce71934c6f6',
    messagingSenderId: '567117493827',
    projectId: 'blackbeanbliss-3e2e4',
    authDomain: 'blackbeanbliss-3e2e4.firebaseapp.com',
    storageBucket: 'blackbeanbliss-3e2e4.appspot.com',
  );
}
