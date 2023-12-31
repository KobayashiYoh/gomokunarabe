// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;
import 'package:flutter_dotenv/flutter_dotenv.dart';

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

  static final String _apiKeyWeb = dotenv.get('API_KEY_WEB');
  static final String _apiKeyAndroid = dotenv.get('API_KEY_ANDROID');
  static final String _apiKeyIOS = dotenv.get('API_KEY_IOS');
  static final String _appIdWeb = dotenv.get('APP_ID_WEB');
  static final String _appIdAndroid = dotenv.get('APP_ID_ANDROID');
  static final String _appIdIOS = dotenv.get('APP_ID_IOS');
  static final String _messagingSenderId = dotenv.get('MESSAGING_SENDER_ID');

  static final FirebaseOptions web = FirebaseOptions(
    apiKey: _apiKeyWeb,
    appId: _appIdWeb,
    messagingSenderId: _messagingSenderId,
    projectId: 'gomokunarabe-app',
    authDomain: 'gomokunarabe-app.firebaseapp.com',
    storageBucket: 'gomokunarabe-app.appspot.com',
    measurementId: 'G-RKPLTEQ5K6',
  );

  static final FirebaseOptions android = FirebaseOptions(
    apiKey: _apiKeyAndroid,
    appId: _appIdAndroid,
    messagingSenderId: _messagingSenderId,
    projectId: 'gomokunarabe-app',
    storageBucket: 'gomokunarabe-app.appspot.com',
  );

  static final FirebaseOptions ios = FirebaseOptions(
    apiKey: _apiKeyIOS,
    appId: _appIdIOS,
    messagingSenderId: _messagingSenderId,
    projectId: 'gomokunarabe-app',
    storageBucket: 'gomokunarabe-app.appspot.com',
    iosClientId:
        '1044563900963-jln4s7jutc681dhv3us8fjpd7a665ls4.apps.googleusercontent.com',
    iosBundleId: 'com.example.gomokunarabe',
  );
}
