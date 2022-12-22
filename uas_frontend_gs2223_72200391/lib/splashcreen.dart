import 'package:flutter/material.dart';
import 'dart:async';

import 'package:uas_frontend_gs2223_72200391/home.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key, required this.title});

  final String title;

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  startSplashScreen() async {
    var duration = const Duration(seconds: 2);
    return Timer(duration, () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const Home()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Center(
          child: Image.asset(
        'images/logo.png',
        width: 200.0,
        height: 200.0,
      )),
    );
  }

  @override
  void initState() {
    startSplashScreen();
  }
}
