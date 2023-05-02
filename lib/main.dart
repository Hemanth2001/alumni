import 'package:alumni/splashscreen.dart';
import 'package:flutter/material.dart';
void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      primarySwatch: Colors.blueGrey,
    ),
    debugShowCheckedModeBanner: false,
    home: SplashScreen(),
  ));
}