import 'package:flutter/material.dart';
import 'package:hair_cut/Utils/elevated_bu.dart';
import 'package:hair_cut/Utils/txt_field.dart';
import 'package:hair_cut/res/app_color.dart';

class Help extends StatefulWidget {
  const Help({super.key});

  @override
  State<Help> createState() => _HelpState();
}

class _HelpState extends State<Help> {
  @override
  Widget build(BuildContext context) {
    double screenhight = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },

      child: Scaffold(
        appBar: AppBar(title: Text("Help")),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 24),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Image.asset("assets/images/Icon.png"),
                  SizedBox(height: 20),
                  Text(
                    "How we can help \n you today ?",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      color: AppColor.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Please enter your personal data and\n describe your care needs or something\n we can help you with",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: AppColor.gray),
                  ),
                  SizedBox(height: 10),
                  Align(alignment: Alignment.bottomLeft, child: Text("Name")),
                  SizedBox(height: 10),
                  TxtField(
                    hintText: "Joe Samanta",
                    icon: Icons.person,
                    onchangeed: (p0) {},
                  ),
                  SizedBox(height: 10),
                  Align(alignment: Alignment.bottomLeft, child: Text("Email")),
                  SizedBox(height: 10),
                  TxtField(
                    hintText: "Joesamanta@gmail.com",
                    icon: Icons.email,
                    onchangeed: (p0) {},
                  ),
                  SizedBox(height: 10),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Text("Describe"),
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: screenhight * 0.17,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: AppColor.gray),
                    ),
                    child: TextField(
                      maxLines: 5,
                      decoration: InputDecoration(
                        hintText: "Enter a description here",
                        hintStyle: TextStyle(color: AppColor.gray),
                        border: OutlineInputBorder(borderSide: BorderSide.none),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  ElevatedBu(onPressed: () {}, name: "Send"),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
