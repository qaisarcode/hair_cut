import 'package:flutter/material.dart';

class AppointYou extends StatefulWidget {
  const AppointYou({super.key});

  @override
  State<AppointYou> createState() => _AppointYouState();
}

class _AppointYouState extends State<AppointYou> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color(0xffFFFFFF)),
        title: Text(
          "Your Appointment",
          style: TextStyle(color: Color(0xffFFFFFF)),
        ),
        backgroundColor: Color(0xff363062),
      ),
      backgroundColor: Color(0xff363062),
    );
  }
}
