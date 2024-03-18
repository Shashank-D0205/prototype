import 'package:flutter/material.dart';
import 'package:prototype/Login%20Screen.dart';
import 'home.dart';
import 'splash_main.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/GetStartedPage', // Set the initial route to GetStartedPage
      routes: {
        '/GetStartedPage': (context) => GetStartedPage(), // Add GetStartedPage route
        '/home': (context) => HomePage(),
        '/LoginPage': (context) => const LoginApp(),
      },
    ),
  );
}
