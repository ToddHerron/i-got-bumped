import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyC6IcNXqx_7Tqe-vG3d-L7aJlj7eLSsCF8",
            authDomain: "i-got-bumped.firebaseapp.com",
            projectId: "i-got-bumped",
            storageBucket: "i-got-bumped.appspot.com",
            messagingSenderId: "495114063652",
            appId: "1:495114063652:web:4a6c0b17227bcd5b186db1",
            measurementId: "G-4F7ZRQJB69"));
  } else {
    await Firebase.initializeApp();
  }
}
