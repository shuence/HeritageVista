// main.dart

import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:heritage_vista/firebase_options.dart';
import 'package:heritage_vista/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart'; 
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Heritage Vista!',
      theme: ThemeData(
        primaryColor: Colors.deepPurple, // Set the primary color
        scaffoldBackgroundColor: Colors.white, // Set the background color
      ),
      home: const SplashScreen(), // Show the SplashScreen first
    );
  }
}

void setCookie(HttpResponse response, String name, String value) {
  response.headers.add(
    'Set-Cookie',
    '$name=$value; SameSite=None; Secure',
  );
}

  Future<void> initializeApp() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    await SharedPreferences.getInstance();
  }
