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
    apiKey: 'AIzaSyBv2wB433EEUJl11yJpr1gOEPAxXTMj9w4',
    appId: '1:249034562984:web:529a494d8e2e3ca5c2519d',
    messagingSenderId: '249034562984',
    projectId: 'udgku-1a49d',
    authDomain: 'udgku-1a49d.firebaseapp.com',
    storageBucket: 'udgku-1a49d.appspot.com',
    measurementId: 'G-1290XVNXHG',
    // realime database
    // authDomain: 'project-id.firebaseapp.com',
    databaseURL:
        'https://udgku-1a49d-default-rtdb.asia-southeast1.firebasedatabase.app/',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBvbpFB1bMWUalP3R62-7pPQuaYpEj6RTg',
    appId: '1:249034562984:android:47fe61586b2b2c79c2519d',
    messagingSenderId: '249034562984',
    projectId: 'udgku-1a49d',
    storageBucket: 'udgku-1a49d.appspot.com',
    // realime database
    // authDomain: 'project-id.firebaseapp.com',
    databaseURL:
        'https://udgku-1a49d-default-rtdb.asia-southeast1.firebasedatabase.app/', // IMPORTANT!
    measurementId: '...',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCXWhpKr-Q6-TegbBHKdFPuyAuZS1gKyRY',
    appId: '1:249034562984:ios:e7f7313c625c0d3bc2519d',
    messagingSenderId: '249034562984',
    projectId: 'udgku-1a49d',
    storageBucket: 'udgku-1a49d.appspot.com',
    iosClientId:
        '249034562984-vgo6uem5qjsejb7boa81r983m1pobtkq.apps.googleusercontent.com',
    iosBundleId: 'com.example.udg',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCXWhpKr-Q6-TegbBHKdFPuyAuZS1gKyRY',
    appId: '1:249034562984:ios:e7f7313c625c0d3bc2519d',
    messagingSenderId: '249034562984',
    projectId: 'udgku-1a49d',
    storageBucket: 'udgku-1a49d.appspot.com',
    iosClientId:
        '249034562984-vgo6uem5qjsejb7boa81r983m1pobtkq.apps.googleusercontent.com',
    iosBundleId: 'com.example.udg',
  );
}
