import 'dart:async';
import 'package:flutter/material.dart';
import 'package:heritage_vista/home_page.dart'; // Import the HomePage file

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
            builder: (context) =>
                const HeritageVistaHomePage(title: 'Heritage Vista')),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/splash.gif', width: 150, height: 150),
            const SizedBox(height: 20),
            const Text(
              'Random Fact: India is known for its diverse cultures and languages.',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
