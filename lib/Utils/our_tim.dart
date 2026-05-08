import 'package:flutter/material.dart';

class OurTim extends StatelessWidget {
  final String image;
  final String name;
  final String subtitle;
  final IconData? icon;
  final String addyou;

  const OurTim({
    super.key,
    required this.image,
    required this.name,
    this.icon,
    required this.subtitle,
    required this.addyou,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(leading: CircleAvatar(backgroundImage: AssetImage(image)));
  }
}
