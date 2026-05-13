import 'package:flutter/material.dart';
import 'package:hair_cut/Screens/invoice.dart';
import 'package:hair_cut/Utils/elevated_bu.dart';
import 'package:hair_cut/Utils/nare_shops.dart';
import 'package:hair_cut/Utils/our_tim.dart';

import 'package:hair_cut/res/app_color.dart';

class AppointYou extends StatefulWidget {
  const AppointYou({super.key});

  @override
  State<AppointYou> createState() => _AppointYouState();
}

class _AppointYouState extends State<AppointYou> {
  final List<OurTim> data = [
    OurTim(
      image: "assets/images/c1.png",
      name: "Basic haircut",
      subtitle: "Basic haircut & vitamint",
      addyou: "\$20",
      icon: null,
    ),
    OurTim(
      image: "assets/images/c2.png",
      name: "Kids haircut",
      subtitle: "Special kids haircut",
      addyou: "\$15",
      icon: null,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color(0xffFFFFFF)),
        title: Text(
          "Your Appointment",
          style: TextStyle(color: Color(0xffFFFFFF)),
        ),
        backgroundColor: Color(0xff363062),
      ),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: screenHeight * 0.35,
            decoration: BoxDecoration(color: AppColor.blue),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Column(
                children: [
                  NareShops(
                    image: "assets/images/sho1.png",
                    sname: "Master piece Barbershop - Haircut styling",
                    duration: "Jogja Expo Centre  (2 km)",
                    reating: "5.0",
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: AlignmentGeometry.bottomEnd,
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.65,
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
                  vertical: 18,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.calendar_month),
                              Text("Date & time"),
                            ],
                          ),

                          Text("Sun, 15 Jan  - 08:00 AM"),
                          SizedBox(height: 20),
                          Row(
                            children: [Icon(Icons.cut), Text("Service lits")],
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: data.length,
                            itemBuilder: (context, index) {
                              final d = data[index];
                              return OurTim(
                                image: d.image,
                                name: d.name,
                                subtitle: d.subtitle,
                                addyou: d.addyou,
                              );
                            },
                          ),
                          Text("Apply Coupon"),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.discount_rounded),
                                    hintText: "DISC20PERCEN",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        bottomLeft: Radius.circular(10),
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(),
                                  ),
                                ),
                              ),

                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadiusGeometry.only(
                                      topRight: Radius.circular(10),
                                      bottomRight: Radius.circular(10),
                                    ),
                                  ),
                                  minimumSize: Size(72, 56),
                                  backgroundColor: AppColor.blue,
                                ),

                                onPressed: () {},
                                child: Text(
                                  "Apply",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: 10),
                          Text(
                            "Coupon is active",
                            style: TextStyle(color: AppColor.gray),
                          ),
                          SizedBox(height: 30),
                          Text(
                            "Payment summary",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Basic haircut",
                                style: TextStyle(fontSize: 16),
                              ),
                              Text("\$20", style: TextStyle(fontSize: 16)),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Extra massage",
                                style: TextStyle(fontSize: 16),
                              ),
                              Text("\$10", style: TextStyle(fontSize: 16)),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Coupon discount",
                                style: TextStyle(fontSize: 16),
                              ),
                              Text("-\$5", style: TextStyle(fontSize: 16)),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Total price",
                                style: TextStyle(fontSize: 16),
                              ),
                              Text("\$25", style: TextStyle(fontSize: 16)),
                            ],
                          ),
                          SizedBox(height: 20),
                          ElevatedBu(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (_) => Invoice()),
                              );
                            },
                            name: "Pay now",
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
    );
  }
}
