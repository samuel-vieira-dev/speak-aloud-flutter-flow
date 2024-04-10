import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCeGd8qrzWjyoPDL-r4PPqdPkTdT-8AD-k",
            authDomain: "speak-loud-86udhk.firebaseapp.com",
            projectId: "speak-loud-86udhk",
            storageBucket: "speak-loud-86udhk.appspot.com",
            messagingSenderId: "682576065738",
            appId: "1:682576065738:web:bf964219d723848c2cb033",
            measurementId: "G-7EEQFM2KV5"));
  } else {
    await Firebase.initializeApp();
  }
}
