import 'package:flutter/material.dart';

class NameCon extends StatelessWidget {
  final String name;
  bool iselectd = false;
  final VoidCallback ontap;

  NameCon({
    super.key,
    required this.name,
    this.iselectd = false,
    required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),

        decoration: BoxDecoration(
          color: iselectd ? Color(0xffEDEFFB) : Color(0xffFFFFFF),
          border: Border.all(
            color: iselectd ? Color(0xff363062) : Color(0xffFFFFFF),
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(name),
      ),
    );
  }
}
