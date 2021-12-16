// ignore_for_file: prefer_const_constructors

import 'package:cscguru/views/pages/splash/intro_splash.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CSC Guru',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: IntroSplash(),
    );
  }
}
