import 'package:flutter/material.dart';
import 'package:hair_cut/Screens/add_review.dart';
import 'package:hair_cut/Screens/profile_screen.dart';
import 'package:hair_cut/Utils/elevated_bu.dart';
import 'package:hair_cut/Utils/profile_card.dart';
import 'package:hair_cut/res/app_color.dart';

class About extends StatefulWidget {
  const About({super.key});

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    double screenhight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColor.white),
        backgroundColor: AppColor.blue,
        title: Text("About", style: TextStyle(color: AppColor.white)),
      ),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: screenhight * 0.52,
            decoration: BoxDecoration(color: AppColor.blue),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/logo1.png"),
                SizedBox(height: 10),
                Text(
                  "Hair Cut",
                  style: TextStyle(
                    fontSize: 20,
                    color: AppColor.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              height: screenhight * 0.45,
              decoration: BoxDecoration(
                color: AppColor.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("About Gobar"),
                    SizedBox(height: 10),
                    Text(
                      ' "The Best Solution for Online Barber Bookings" Want a more practical and efficient hair shaving experience? Gobar is the best solution for you! Gobar is an online barber booking application that makes it easy for you to search, select and order haircut services easily and quickly.',
                      style: TextStyle(color: AppColor.gray),
                    ),
                    SizedBox(height: 10),
                    Text("Rating App", style: TextStyle(color: AppColor.gray)),
                    ProfileCard(
                      name: "Let’s rating this App",
                      ontap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => AddReview()),
                        );
                      },
                    ),
                    ElevatedBu(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => ProfileScreen()),
                        );
                      },
                      name: "Back",
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
