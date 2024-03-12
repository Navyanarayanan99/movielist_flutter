import 'dart:async';

import 'package:flutter/material.dart';
import 'signup_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  
    Timer(
      Duration(seconds: 3), 
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => SignUpScreen()),
        );
      },
    );

    return Scaffold(
      body: Center(
        child: Image(image: AssetImage('assets/images/splashh.png')),
      ),
    );
  }
}
