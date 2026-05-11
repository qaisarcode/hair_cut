import 'package:flutter/material.dart';

class ElevatedBu extends StatelessWidget {
  final String name;
  final VoidCallback onPressed;

  const ElevatedBu({super.key, required this.onPressed, required this.name});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(double.infinity, 54),
        maximumSize: Size(double.infinity, 54),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(10),
        ),
        backgroundColor: Color(0xff363062),
      ),
      onPressed: onPressed,
      child: Text(name, style: TextStyle(color: Color(0xffFFFFFF))),
    );
  }
}
