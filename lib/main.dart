import 'package:flutter/material.dart';
import 'package:movielab/Screens/home_screen.dart';
import 'package:movielab/Screens/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:movielab/Screens/splash.dart';
import 'package:firebase_core/firebase_core.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
        apiKey: 'AIzaSyBtAO7PuuHtnucPPkiQ2rnMLiFsgvHY5QQ',
        appId: 'com.android.application',
        messagingSenderId: 'null',
        projectId: 'movielab-f453c'),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MOVIELAB',
      home: splash_screen(),
    );
  }
}

