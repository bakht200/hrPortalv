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
    apiKey: 'AIzaSyBuIpiOYuskY_auFT4uZLykE6Nd_8yJ36c',
    appId: '1:530854665001:web:5cd7a16ee76566debdb538',
    messagingSenderId: '530854665001',
    projectId: 'hrsystem-bfd42',
    authDomain: 'hrsystem-bfd42.firebaseapp.com',
    databaseURL: 'https://hrsystem-bfd42-default-rtdb.firebaseio.com',
    storageBucket: 'hrsystem-bfd42.appspot.com',
    measurementId: 'G-6HCNQ2MNBJ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBegksCJ5v4lOI3Zz0nnl1xkA71AOZHiNE',
    appId: '1:530854665001:android:5b51549be4a28ddabdb538',
    messagingSenderId: '530854665001',
    projectId: 'hrsystem-bfd42',
    databaseURL: 'https://hrsystem-bfd42-default-rtdb.firebaseio.com',
    storageBucket: 'hrsystem-bfd42.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCT8ucZrZu19LDKG_b6mRRVMNSoP2YHiT4',
    appId: '1:530854665001:ios:0085ac2cf5726af4bdb538',
    messagingSenderId: '530854665001',
    projectId: 'hrsystem-bfd42',
    databaseURL: 'https://hrsystem-bfd42-default-rtdb.firebaseio.com',
    storageBucket: 'hrsystem-bfd42.appspot.com',
    iosClientId: '530854665001-bac3t2jjpsufjqt85gaqnqvfoss1l4dn.apps.googleusercontent.com',
    iosBundleId: 'com.example.hrportalv2',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCT8ucZrZu19LDKG_b6mRRVMNSoP2YHiT4',
    appId: '1:530854665001:ios:befa8f413c793cf8bdb538',
    messagingSenderId: '530854665001',
    projectId: 'hrsystem-bfd42',
    databaseURL: 'https://hrsystem-bfd42-default-rtdb.firebaseio.com',
    storageBucket: 'hrsystem-bfd42.appspot.com',
    iosClientId: '530854665001-um3rbetkmnos8ah02olfsi306btevpug.apps.googleusercontent.com',
    iosBundleId: 'com.example.hrportalv2.RunnerTests',
  );
}
