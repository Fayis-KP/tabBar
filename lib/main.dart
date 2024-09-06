import 'package:flutter/material.dart';
import 'package:tabbar/screens/home.dart';
import 'package:tabbar/screens/spalshPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashPage(),debugShowCheckedModeBanner: false,
    );
  }
}
