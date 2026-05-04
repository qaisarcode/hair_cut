import 'package:flutter/material.dart';

class ListButton extends StatelessWidget {
  final IconData icon;
  final String lable;
  final VoidCallback onPressed;
  const ListButton({
    super.key,
    required this.icon,
    required this.lable,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon),
      label: Text(lable),
    );
  }
}
