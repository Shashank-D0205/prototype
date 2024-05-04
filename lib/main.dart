import 'package:flutter/material.dart';
import 'package:prototype/Login%20Screen.dart';
import 'package:prototype/splash_main.dart';
import 'chat.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/GetStartedPage',
      routes: {
        '/GetStartedPage': (context) => const GetStartedPage(),
        // '/home': (context) => HomePage(),
        '/LoginPage': (context) => const LoginApp(),
        '/Chat' : (context) => const ChatWidget()
      },
    ),
  );
}
