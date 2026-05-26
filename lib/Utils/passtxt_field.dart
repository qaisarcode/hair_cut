import 'package:flutter/material.dart';
import 'package:hair_cut/provider/passobscure_pprovier.dart';
import 'package:provider/provider.dart';

class PasstxtField extends StatelessWidget {
  final String hintText;
  final IconData prefixIcon;
  IconData? suffixIcon;
  final bool ispassword;
  PasstxtField({
    super.key,
    required this.prefixIcon,
    required this.hintText,
    this.suffixIcon,
    this.ispassword = false,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<PassobscurePprovier>(
      builder: (context, value, child) {
        return TextFormField(
          obscureText: ispassword ? value.obscurepass : false,
          decoration: InputDecoration(
            border: InputBorder.none,
            suffixIcon: ispassword
                ? IconButton(
                    onPressed: () {
                      value.toggle();
                    },
                    icon: Icon(
                      value.obscurepass
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                  )
                : suffixIcon != null
                ? Icon(suffixIcon)
                : null,
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
      },
    );
  }
}
