import 'package:flutter/material.dart';

class TxtField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  const TxtField({super.key, required this.hintText, required this.icon});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: Color(0xff363062)),
        hintText: hintText,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
