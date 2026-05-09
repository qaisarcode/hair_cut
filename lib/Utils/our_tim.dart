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
    return ListTile(
      leading: CircleAvatar(radius: 30, backgroundImage: AssetImage(image)),
      title: Text(
        name,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(subtitle),
      trailing: SizedBox(
        width: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(child: Icon(Icons.star)),
            Expanded(child: Text(addyou, style: TextStyle(fontSize: 16))),
          ],
        ),
      ),
    );
  }
}
