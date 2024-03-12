import 'package:flutter/material.dart';
import 'package:fluttertask/screens/signup_screen.dart';
import 'package:fluttertask/screens/splash_screen.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pizza delivery app',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFF522921)
      ),
      home: SplashScreen(),
    );
  }
}