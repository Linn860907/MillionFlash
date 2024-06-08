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
    apiKey: 'AIzaSyBC_lJrBxmHZIVq0ZSt8ZoznMS0fhlwABE',
    appId: '1:528911137933:web:bb3f547b6d9074be3176c4',
    messagingSenderId: '528911137933',
    projectId: 'millionflashshop',
    authDomain: 'millionflashshop.firebaseapp.com',
    databaseURL: 'https://millionflashshop-default-rtdb.firebaseio.com',
    storageBucket: 'millionflashshop.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCGoFUY4pJPSTgA9l_oIgwL620JV7s_Oks',
    appId: '1:528911137933:android:adf7bb73733e0eb23176c4',
    messagingSenderId: '528911137933',
    projectId: 'millionflashshop',
    databaseURL: 'https://millionflashshop-default-rtdb.firebaseio.com',
    storageBucket: 'millionflashshop.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBp-v26sAdZdwloDv-ekZMLUD152DIp8TQ',
    appId: '1:528911137933:ios:433cc1a49992835b3176c4',
    messagingSenderId: '528911137933',
    projectId: 'millionflashshop',
    databaseURL: 'https://millionflashshop-default-rtdb.firebaseio.com',
    storageBucket: 'millionflashshop.appspot.com',
    androidClientId: '528911137933-dmmmg3vn3t9btblru2hcuifpbnt9dloe.apps.googleusercontent.com',
    iosClientId: '528911137933-gaeng8h7360qovv9n96rua84g4rj9hv8.apps.googleusercontent.com',
    iosBundleId: 'com.example.millionflashapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBp-v26sAdZdwloDv-ekZMLUD152DIp8TQ',
    appId: '1:528911137933:ios:433cc1a49992835b3176c4',
    messagingSenderId: '528911137933',
    projectId: 'millionflashshop',
    databaseURL: 'https://millionflashshop-default-rtdb.firebaseio.com',
    storageBucket: 'millionflashshop.appspot.com',
    androidClientId: '528911137933-dmmmg3vn3t9btblru2hcuifpbnt9dloe.apps.googleusercontent.com',
    iosClientId: '528911137933-gaeng8h7360qovv9n96rua84g4rj9hv8.apps.googleusercontent.com',
    iosBundleId: 'com.example.millionflashapp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBC_lJrBxmHZIVq0ZSt8ZoznMS0fhlwABE',
    appId: '1:528911137933:web:3e2e6103c6e001273176c4',
    messagingSenderId: '528911137933',
    projectId: 'millionflashshop',
    authDomain: 'millionflashshop.firebaseapp.com',
    databaseURL: 'https://millionflashshop-default-rtdb.firebaseio.com',
    storageBucket: 'millionflashshop.appspot.com',
  );

}