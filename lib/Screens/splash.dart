import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
// import 'package:page_transition/page_transition.dart';
import 'package:movielab/Screens/login_page.dart';

// ignore: camel_case_types
class splash_screen extends StatelessWidget {
  const splash_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      backgroundColor: Colors.black,
      // splash: 'images/falogo.png',
      splash: Image.asset('images/loading.gif'),
      nextScreen: const LoginPage(),
      splashTransition: SplashTransition.sizeTransition,
      // pageTransitionType: PageTransitionType.scale,
    );
  }
}
