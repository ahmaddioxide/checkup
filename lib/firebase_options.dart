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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyBHrzxGc1CN1Jx0qwJTHju03JuguUCjacs',
    appId: '1:764917558742:web:07868ed470d1113bb54877',
    messagingSenderId: '764917558742',
    projectId: 'checkup-90d85',
    authDomain: 'checkup-90d85.firebaseapp.com',
    storageBucket: 'checkup-90d85.appspot.com',
    measurementId: 'G-11EP21QCKX',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBWlnx2-M4uvAGCVAXtok858pOQfFYzBP8',
    appId: '1:764917558742:android:49ace5562d0d9f38b54877',
    messagingSenderId: '764917558742',
    projectId: 'checkup-90d85',
    storageBucket: 'checkup-90d85.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAsuOcZQ9EekYwoV17c2MKJFnYp91ctRNI',
    appId: '1:764917558742:ios:4d9093009c51c266b54877',
    messagingSenderId: '764917558742',
    projectId: 'checkup-90d85',
    storageBucket: 'checkup-90d85.appspot.com',
    iosBundleId: 'com.ahmaddioxide.checkup',
  );
}
