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
    apiKey: 'AIzaSyAAlEtEiVAcg_SOpNvIqhqcxDzytdC_iyk',
    appId: '1:400002344582:web:01388c0cf756dbaa1c9307',
    messagingSenderId: '400002344582',
    projectId: 'plats-app-686f5',
    authDomain: 'plats-app-686f5.firebaseapp.com',
    storageBucket: 'plats-app-686f5.firebasestorage.app',
    measurementId: 'G-XSLJ9YM0CQ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAvEl04_f2LgLJ-nvp--CSYAjnD7b3QJ-M',
    appId: '1:400002344582:android:7e9a39b41b7a34421c9307',
    messagingSenderId: '400002344582',
    projectId: 'plats-app-686f5',
    storageBucket: 'plats-app-686f5.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCYXaj1sZZLgdV_SbOiyX6P-_hWFhHZ9cg',
    appId: '1:400002344582:ios:e341bf4c4cacaa551c9307',
    messagingSenderId: '400002344582',
    projectId: 'plats-app-686f5',
    storageBucket: 'plats-app-686f5.firebasestorage.app',
    iosBundleId: 'com.example.myGarden',
  );
}
