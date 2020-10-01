import 'package:flutter/material.dart';
import 'package:quizzer/splash.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // // // title: "Quizzerr",
      // theme: ThemeData.dark(),

      theme: ThemeData(
        primaryColor: Color(0xffBDBDBD),
      ),
      home: splashscreen(),
    );
  }
}
