import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hair_cut/splach_services/onbording_screen.dart';

class SaplashScreen extends StatefulWidget {
  const SaplashScreen({super.key});
  @override
  State<SaplashScreen> createState() => _SaplashScreenState();
}

class _SaplashScreenState extends State<SaplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        // ← push se pushReplacement
        context,
        MaterialPageRoute(builder: (_) => const OnbordingScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ← Container ki jagah Scaffold
      body: Container(
        width: double.infinity, // ← maxFinite ki jagah infinity
        decoration: const BoxDecoration(color: Color(0xff363062)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/logo.png", scale: 3),
            const Text(
              "Hair Cut",
              style: TextStyle(
                decoration: TextDecoration.none,
                color: Color(0xffFFFFFF),
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
