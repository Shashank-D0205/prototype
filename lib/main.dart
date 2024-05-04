import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:prototype/Login%20Screen.dart';
import 'package:prototype/splash_main.dart';
// import 'package:prototype/home.dart';
import 'chat.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/GetStartedPage',
      routes: {
        '/GetStartedPage': (context) => GetStartedPage(),
        // '/home': (context) => HomePage(),
        '/LoginPage': (context) => const LoginApp(),
        '/Chat' : (context) => ChatWidget()
      },
    ),
  );
}
