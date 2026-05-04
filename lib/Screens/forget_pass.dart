import 'package:flutter/material.dart';
import 'package:hair_cut/Utils/elevated_bu.dart';
import 'package:hair_cut/Utils/txt_field.dart';
import 'package:hair_cut/auth/athanication_code.dart';

class ForgetPass extends StatefulWidget {
  const ForgetPass({super.key});

  @override
  State<ForgetPass> createState() => _ForgetPassState();
}

class _ForgetPassState extends State<ForgetPass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 125, left: 18, right: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Forgot password? ",
                style: TextStyle(
                  color: Color(0xff363062),
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Please enter your email for the password\n reset process",
                style: TextStyle(color: Color(0xff6B7280)),
              ),
              SizedBox(height: 20),
              Text("Email", style: TextStyle(color: Color(0xff111827))),
              SizedBox(height: 10),
              TxtField(hintText: "Joesamanta@gmail.com", icon: Icons.email),
              SizedBox(height: 30),
              Align(
                alignment: Alignment.bottomCenter,
                child: ElevatedBu(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => AthanicationCode()),
                    );
                  },
                  name: "send",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
