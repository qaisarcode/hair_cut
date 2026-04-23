import 'package:flutter/material.dart';

class PasstxtField extends StatelessWidget {
  final String hintText;
  final IconData prefixIcon;
  final IconData suffixIcon;
  const PasstxtField({
    super.key,
    required this.prefixIcon,
    required this.hintText,
    required this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        suffixIcon: Icon(suffixIcon, color: Color(0xff363062)),
        prefixIcon: Icon(prefixIcon, color: Color(0xff363062)),
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
