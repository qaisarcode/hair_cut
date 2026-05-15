import 'package:flutter/material.dart';
import 'package:hair_cut/res/app_color.dart';

class ProfileCard extends StatelessWidget {
  final String name;
  final IconData? icon;
  final bool showSwitch;
  final bool switchValue; // ✅ Bahar se value aayegi
  final ValueChanged<bool>? onSwitchChanged;

  final VoidCallback? ontap; // ✅ Bahar se function aayega

  const ProfileCard({
    super.key,
    required this.name,
    this.icon,
    this.showSwitch = false,
    this.switchValue = false,
    this.onSwitchChanged,
    this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 6, vertical: 20),
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColor.white,
          border: Border(bottom: BorderSide(color: Colors.grey.shade200)),
        ),
        child: Row(
          children: [
            // ✅ Icon
            if (icon != null) ...[
              Icon(icon, color: AppColor.blue, size: 22),
              SizedBox(width: 12),
            ],

            // ✅ Name
            Expanded(
              child: Text(
                name,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: AppColor.blue,
                ),
              ),
            ),

            // ✅ Switch ya Arrow
            if (showSwitch)
              Switch(
                value: switchValue,
                onChanged: onSwitchChanged,
                activeColor: AppColor.blue,
              )
            else
              Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
