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
    apiKey: 'AIzaSyAsrLupEPOED4rmo2uW6NEj4x6nhMmPe2Y',
    appId: '1:670132308261:web:28df77f9e463073cd9f2cc',
    messagingSenderId: '670132308261',
    projectId: 'ninja-brew-crew-654c8',
    authDomain: 'ninja-brew-crew-654c8.firebaseapp.com',
    storageBucket: 'ninja-brew-crew-654c8.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDFYwCBGa8_kuORpA_C-D_sp_H1uhNVKd8',
    appId: '1:670132308261:android:0e9d4ba574da3d16d9f2cc',
    messagingSenderId: '670132308261',
    projectId: 'ninja-brew-crew-654c8',
    storageBucket: 'ninja-brew-crew-654c8.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCs9GiqxATkkfyQs9IymDhxH7BDkRBFqX4',
    appId: '1:670132308261:ios:289dae0bd7c5d784d9f2cc',
    messagingSenderId: '670132308261',
    projectId: 'ninja-brew-crew-654c8',
    storageBucket: 'ninja-brew-crew-654c8.appspot.com',
    iosClientId: '670132308261-bd6coq28es2dejnaj9kapfdknvsfqpgh.apps.googleusercontent.com',
    iosBundleId: 'com.example.newfirebase2Flutter',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCs9GiqxATkkfyQs9IymDhxH7BDkRBFqX4',
    appId: '1:670132308261:ios:289dae0bd7c5d784d9f2cc',
    messagingSenderId: '670132308261',
    projectId: 'ninja-brew-crew-654c8',
    storageBucket: 'ninja-brew-crew-654c8.appspot.com',
    iosClientId: '670132308261-bd6coq28es2dejnaj9kapfdknvsfqpgh.apps.googleusercontent.com',
    iosBundleId: 'com.example.newfirebase2Flutter',
  );
}
