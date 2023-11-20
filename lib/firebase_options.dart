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
    apiKey: 'AIzaSyANhYB5R8rDh_APcYc0CwiEU16SJDHiTmM',
    appId: '1:886234199216:web:d94b061ba446c806793775',
    messagingSenderId: '886234199216',
    projectId: 'utopia-notepad',
    authDomain: 'utopia-notepad.firebaseapp.com',
    databaseURL: 'https://utopia-notepad-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'utopia-notepad.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDsj9DzgU36GxJ8VcE-qIqERH4gK0XCeTA',
    appId: '1:886234199216:android:8f1b2a9470fe5cd5793775',
    messagingSenderId: '886234199216',
    projectId: 'utopia-notepad',
    databaseURL: 'https://utopia-notepad-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'utopia-notepad.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBmRWqAtEPtD1v4Efgyqg5Iq546_NDK2r8',
    appId: '1:886234199216:ios:593109f34a408ea2793775',
    messagingSenderId: '886234199216',
    projectId: 'utopia-notepad',
    databaseURL: 'https://utopia-notepad-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'utopia-notepad.appspot.com',
    iosBundleId: 'com.example.utopiaRecruitmentTaskNotepad',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBmRWqAtEPtD1v4Efgyqg5Iq546_NDK2r8',
    appId: '1:886234199216:ios:ae2ea45f62f41ecd793775',
    messagingSenderId: '886234199216',
    projectId: 'utopia-notepad',
    databaseURL: 'https://utopia-notepad-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'utopia-notepad.appspot.com',
    iosBundleId: 'com.example.utopiaRecruitmentTaskNotepad.RunnerTests',
  );
}
