import 'package:crypto_buddy/packages/introductionScreen.dart';

import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';


void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {


  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          primaryColor: Colors.white,
        ),
        home: AnimatedSplashScreen(
          backgroundColor: Colors.white,
          splash: 'assets/b1.png',
          nextScreen: OnBoardingPage(),
          splashTransition: SplashTransition.fadeTransition,
          splashIconSize: 320,
        )
    );
  }


}