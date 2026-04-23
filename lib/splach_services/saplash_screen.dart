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
    Timer(Duration(seconds: 3), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => OnbordingScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      decoration: BoxDecoration(color: Color(0xff363062)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/images/logo.png", scale: 3),
          Text(
            "Hair Cut",
            style: TextStyle(
              decoration: TextDecoration.none,
              color: Color(0xffFFFFFF),
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
