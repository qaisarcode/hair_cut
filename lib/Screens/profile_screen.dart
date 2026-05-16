import 'package:flutter/material.dart';
import 'package:hair_cut/Screens/about.dart';
import 'package:hair_cut/Screens/account.dart';
import 'package:hair_cut/Screens/help.dart';
import 'package:hair_cut/Screens/login_screen.dart';
import 'package:hair_cut/Screens/security.dart';
import 'package:hair_cut/Utils/elevated_bu.dart';
import 'package:hair_cut/Utils/profile_card.dart';
import 'package:hair_cut/res/app_color.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool notification = false;

  // ✅ List mein screen bhi hai
  final List<Map<String, dynamic>> data = [
    {"name": "Account", "screen": Account()},
    {"name": "Security", "screen": Security()},
    {"name": "Help", "screen": Help()},
    {"name": "About", "screen": About()},
  ];

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.blue,
        title: Row(
          children: [
            Text("Profile", style: TextStyle(color: AppColor.white)),
            Spacer(),
            Container(
              width: 25,
              height: 25,
              child: Image.asset("assets/images/logo.png"),
            ),
            SizedBox(width: 10),
            Text("Hair cut", style: TextStyle(color: AppColor.white)),
          ],
        ),
      ),
      body: Stack(
        children: [
          // ✅ Blue top
          Container(
            padding: EdgeInsets.symmetric(horizontal: 18),
            height: screenHeight * 0.40,
            decoration: BoxDecoration(color: AppColor.blue),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(),
                    SizedBox(width: 5),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 3,
                            vertical: 5,
                          ),
                          width: 70,
                          decoration: BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.timer, size: 10),
                              Text("Platinum", style: TextStyle(fontSize: 10)),
                            ],
                          ),
                        ),
                        Text(
                          "Joe Samanta",
                          style: TextStyle(color: AppColor.white),
                        ),
                      ],
                    ),
                    Spacer(),
                    Icon(Icons.edit_note, color: AppColor.white),
                  ],
                ),
                SizedBox(height: 30),
                Row(
                  children: [
                    Icon(Icons.email, color: AppColor.white),
                    Text(
                      "Joesamanta@gmail.com",
                      style: TextStyle(color: AppColor.white),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    Icon(Icons.location_on, color: AppColor.white),
                    Text(
                      "Daerah Istimewa Yogyakarta",
                      style: TextStyle(color: AppColor.white),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // ✅ White bottom sheet
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.only(left: 18, right: 18, top: 18),
              width: double.infinity,
              height: screenHeight * 0.60,
              decoration: BoxDecoration(
                color: AppColor.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Setting", style: TextStyle(color: AppColor.gray)),

                  // ✅ Notification switch — alag rakha
                  ProfileCard(
                    name: "Notification",
                    showSwitch: true,
                    switchValue: notification,
                    onSwitchChanged: (value) {
                      setState(() => notification = value);
                    },
                  ),

                  // ✅ Baaki cards — ontap ke saath
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      return ProfileCard(
                        name: data[index]["name"],
                        ontap: () {
                          // ✅ Yahan navigate hoga
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => data[index]["screen"],
                            ),
                          );
                        },
                      );
                    },
                  ),

                  SizedBox(height: 20),
                  ElevatedBu(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => LoginScreen()),
                      );
                    },
                    name: "Log out",
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
