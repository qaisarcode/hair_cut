import 'package:flutter/material.dart';
import 'package:hair_cut/Screens/forget_pass.dart';

import 'package:hair_cut/Screens/registreation_f.dart';
import 'package:hair_cut/Utils/elevated_bu.dart';
import 'package:hair_cut/Utils/passtxt_field.dart';
import 'package:hair_cut/Utils/txt_field.dart';
import 'package:hair_cut/botom_br.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              width: double.infinity,
              height: screenHeight * 0.49,
              decoration: BoxDecoration(color: Color(0xffF99417)),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: Image.asset("assets/images/l1.png"),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                height: screenHeight * 0.6,
                decoration: BoxDecoration(
                  color: Color(0xffFFFFFF),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 25,
                    vertical: 24,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Welcome back 👋 ",
                          style: TextStyle(
                            color: Color(0xff363062),
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Please enter your login information below to access your account",
                          style: TextStyle(color: Color(0xff6B7280)),
                        ),
                        SizedBox(height: 20),
                        Text(
                          "Username",
                          style: TextStyle(color: Color(0xff363062)),
                        ),
                        SizedBox(height: 10),
                        TxtField(
                          hintText: "Joesamanta@gmail.com",
                          icon: Icons.email,
                        ),
                        SizedBox(height: 20),
                        Text(
                          "Password",
                          style: TextStyle(color: Color(0xff363062)),
                        ),
                        SizedBox(height: 10),
                        PasstxtField(
                          prefixIcon: Icons.key,
                          hintText: "password",
                          ispassword: true,
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (_) => ForgetPass()),
                              );
                            },
                            child: Text("Forgot Password?"),
                          ),
                        ),
                        ElevatedBu(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (_) => BotomBr()),
                            );
                          },
                          name: "Login",
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Don't have an account?"),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => RegistreationF(),
                                  ),
                                );
                              },
                              child: Text("Register"),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
