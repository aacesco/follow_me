import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.

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
    apiKey: 'AIzaSyBwdDyMRmfcgn9usufvwpqVZMXuyiGpIIY',
    appId: '1:577079160647:web:a2edcd6c1b4620efa6a662',
    messagingSenderId: '577079160647',
    projectId: 'follow-me-36e44',
    authDomain: 'follow-me-36e44.firebaseapp.com',
    storageBucket: 'follow-me-36e44.appspot.com',
    measurementId: 'G-S4WQBJHFRJ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDYVvL50JUjsHKcThDEM5Qts9thBlVhaP0',
    appId: '1:577079160647:android:7a6f0360a48e6838a6a662',
    messagingSenderId: '577079160647',
    projectId: 'follow-me-36e44',
    storageBucket: 'follow-me-36e44.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCqxZYWaxikFaOZ0uv7muD5WTtim8v85o8',
    appId: '1:577079160647:ios:ba0615ad0ae4fb56a6a662',
    messagingSenderId: '577079160647',
    projectId: 'follow-me-36e44',
    storageBucket: 'follow-me-36e44.appspot.com',
    iosBundleId: 'com.example.followMe',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCqxZYWaxikFaOZ0uv7muD5WTtim8v85o8',
    appId: '1:577079160647:ios:ba0615ad0ae4fb56a6a662',
    messagingSenderId: '577079160647',
    projectId: 'follow-me-36e44',
    storageBucket: 'follow-me-36e44.appspot.com',
    iosBundleId: 'com.example.followMe',
  );
}
