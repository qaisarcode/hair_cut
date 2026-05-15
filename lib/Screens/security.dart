import 'package:flutter/material.dart';
import 'package:hair_cut/Utils/elevated_bu.dart';
import 'package:hair_cut/Utils/passtxt_field.dart';

class Security extends StatefulWidget {
  const Security({super.key});

  @override
  State<Security> createState() => _SecurityState();
}

class _SecurityState extends State<Security> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Security")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Password"),
            SizedBox(height: 10),
            PasstxtField(
              prefixIcon: Icons.key,
              hintText: "********",
              suffixIcon: Icons.remove_red_eye,
            ),
            SizedBox(height: 10),
            Text("New Password"),
            SizedBox(height: 10),
            PasstxtField(
              prefixIcon: Icons.key,
              hintText: "********",
              suffixIcon: Icons.remove_red_eye,
            ),
            Spacer(),
            ElevatedBu(onPressed: () {}, name: "Save"),
          ],
        ),
      ),
    );
  }
}
