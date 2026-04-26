import 'package:flutter/material.dart';
import 'package:hair_cut/Utils/nare_shops.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<NareShops> data = [
    NareShops(
      image: "assets/images/sho1.png",
      sname: "Alana Barbershop - Haircut massage & Spa ",
      duration: "Banguntapan (5 km)",
      reating: "4.5",
    ),
    NareShops(
      image: "assets/images/sho2.png",
      sname: "Hercha Barbershop - Haircut & Styling",
      duration: "Jalan Kaliurang (8 km)",
      reating: "5.0",
    ),
    NareShops(
      image: "assets/images/sho3.png",
      sname: "Barberking - Haircut styling  & massage ",
      duration: "Jogja Expo Centre (12 km)",
      reating: "4.5",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.location_on),
                    Text("Yogyakarta"),
                    Spacer(),
                    CircleAvatar(radius: 20),
                  ],
                ),
                Text(
                  "Joe Samanta",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff111827),
                  ),
                ),
                Container(
                  height: 225,
                  width: 359,
                  decoration: BoxDecoration(
                    color: Color(0xffF99417),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        top: 13,
                        left: 13,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          width: 56,
                          decoration: BoxDecoration(color: Colors.blue),
                          child: Column(
                            children: [
                              Image.asset("assets/images/logo.png"),
                              Text(
                                "Hair_Cut",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 7,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 16,
                        left: 16,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xff363062),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadiusGeometry.circular(10),
                            ),
                          ),
                          onPressed: () {},
                          child: Text(
                            "Booking Now",
                            style: TextStyle(color: Color(0xffFFFFFF)),
                          ),
                        ),
                      ),
                      Positioned(
                        right: 0,
                        bottom: -35,
                        child: Image.asset(
                          "assets/images/s2.png",
                          height: 250, // 👈 control this
                          fit: BoxFit.contain,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 44,
                        child: TextFormField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Color(0xffEBF0F5),
                            prefixIcon: Icon(Icons.search),
                            hintText: "Search barber’s, haircut service",
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    SizedBox(
                      height: 44,
                      width: 44,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.zero,
                          backgroundColor: Color(0xff363062),
                          minimumSize: Size(44, 44),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusGeometry.circular(10),
                          ),
                        ),
                        onPressed: () {},
                        child: Icon(
                          Icons.tune_outlined,
                          color: Color(0xffFFFFFF),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Text(
                  "Nearest Babershop ",
                  style: TextStyle(
                    color: Color(0xff111827),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    final shop = data[index];
                    return Column(
                      children: [
                        NareShops(
                          image: shop.image,
                          sname: shop.sname,
                          duration: shop.duration,
                          reating: shop.reating,
                        ),
                        SizedBox(height: 20),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
