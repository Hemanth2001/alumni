import 'package:alumni/splashscreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    theme: ThemeData(
      primarySwatch: Colors.blueGrey,
    ),
    debugShowCheckedModeBanner: false,
    home: SplashScreen(),
  ));
}