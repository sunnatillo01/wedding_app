import 'dart:async';
import 'package:flutter/material.dart';
import 'package:wedding_app_flutter/screens/home_page.dart';
import 'package:wedding_app_flutter/screens/register_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 3),
        () => Navigator.push(context,
            MaterialPageRoute(builder: (context) => const RegisterPAge())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          "images/6.png",
          height: 300,
          width: double.infinity,
        ),
      ),
    );
  }
}
