import 'package:flutter/material.dart';
import 'package:hair_cut/Screens/login_screen.dart';
import 'package:hair_cut/Utils/elevated_bu.dart';
import 'package:hair_cut/Utils/passtxt_field.dart';
import 'package:hair_cut/Utils/txt_field.dart';
import 'package:hair_cut/auth/athanication_code.dart';

class RegistreationF extends StatefulWidget {
  const RegistreationF({super.key});

  @override
  State<RegistreationF> createState() => _RegistreationFState();
}

class _RegistreationFState extends State<RegistreationF> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 36, left: 18, right: 18),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Register here ",
                  style: TextStyle(
                    color: Color(0xff363062),
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Please enter your data to complete your\n account registration process",
                ),
                SizedBox(height: 30),
                Text("Name", style: TextStyle(color: Color(0xff111827))),

                TxtField(hintText: "Joe Samanta", icon: Icons.person),
                SizedBox(height: 20),
                Text("Email", style: TextStyle(color: Color(0xff363062))),
                TxtField(hintText: "Joesamanta@gmail.com", icon: Icons.email),
                SizedBox(height: 20),
                Text(
                  "Create Password",
                  style: TextStyle(color: Color(0xff111827)),
                ),
                PasstxtField(
                  prefixIcon: Icons.key,
                  hintText: "password",
                  suffixIcon: Icons.remove_red_eye,
                ),
                SizedBox(height: 20),
                Text(
                  "Confirm Password",
                  style: TextStyle(color: Color(0xff111827)),
                ),
                PasstxtField(
                  prefixIcon: Icons.key,
                  hintText: "password",
                  suffixIcon: Icons.remove_red_eye,
                ),
                SizedBox(height: 20),
                ElevatedBu(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => AthanicationCode()),
                    );
                  },
                  name: "Register",
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style: TextStyle(color: Color(0xff6B7280)),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => LoginScreen()),
                        );
                      },
                      child: Text("Login"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
