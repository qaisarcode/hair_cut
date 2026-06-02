import 'package:flutter/material.dart';
import 'package:hair_cut/Screens/bookappoint.dart';
import 'package:hair_cut/Utils/elevated_bu.dart';
import 'package:hair_cut/Utils/our_tim.dart';
import 'package:hair_cut/Utils/recomanded_shop_co.dart';
import 'package:hair_cut/Utils/review_co.dart';
import 'package:hair_cut/provider/booking_provider.dart';
import 'package:hair_cut/res/app_images.dart';
import 'package:provider/provider.dart';

class BarberDetaills extends StatefulWidget {
  const BarberDetaills({super.key});

  @override
  State<BarberDetaills> createState() => _BarberDetaillsState();
}

class _BarberDetaillsState extends State<BarberDetaills> {
  final List<OurTim> data = [
    OurTim(
      image: "assets/images/e1.png",
      name: "Luther Hammes",
      subtitle: "Specialist Haircut",
      addyou: "5.0",
      icon: Icons.star,
    ),
    OurTim(
      image: "assets/images/e2.png",
      name: "Emanuel Bernier",
      subtitle: "Specialist Coloring",
      addyou: "4.5",
      icon: Icons.star,
    ),
    OurTim(
      image: "assets/images/e3.png",
      name: "Karl Vandervort",
      subtitle: "Specialist Treatment",
      addyou: "4.5",
      icon: Icons.star,
    ),
  ];

  final List<OurTim> ldata = [
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
    OurTim(
      image: "assets/images/c3.png",
      name: "Hair coloring",
      subtitle: "Hair color treatment",
      addyou: "\$30",
      icon: null,
    ),
    OurTim(
      image: "assets/images/c4.png",
      name: "Hair treatment",
      subtitle: "Special full treatment",
      addyou: "\$10",
      icon: null,
    ),
    OurTim(
      image: "assets/images/c5.png",
      name: "Special massage",
      subtitle: "Additional massage",
      addyou: "\$10",
      icon: null,
    ),
  ];

  final List<ReviewCo> rdata = [
    ReviewCo(
      image: "assets/images/r1.png",
      name: "Alan Cartwright",
      addreview: "Good service, recommendation for barber shop seekers",
      reating: 4.0,
    ),
    ReviewCo(
      image: "assets/images/r2.png",
      name: "Robert Gleichner",
      addreview: "Place is not too far and the shaving results are good",
      reating: 5.0,
    ),
    ReviewCo(
      image: "assets/images/r3.png",
      name: "Sergio Wilderman",
      addreview: "Price is quite affordable and the service is good",
      reating: 4.0,
    ),
    ReviewCo(
      image: "assets/images/r4.png",
      name: "Miss Erik VonRueden",
      addreview: "Style of barbering here really follows the times",
      reating: 5.0,
    ),
  ];

  final List<String> _timeSlots = [
    "08.00 am",
    "08.30 am",
    "09.00 am",
    "09.30 am",
    "10.00 am",
    "10.30 am",
    "11.00 am",
    "11.30 am",
    "12.00 pm",
  ];

  final List<Map<String, dynamic>> _appointments = [
    {
      "time": "08.30",
      "name": "Alam Carl",
      "service": "Basic haircut",
      "image": "assets/images/e1.png",
      "color": Color(0xffFFA72A),
    },
    {
      "time": "09.00",
      "name": "Sergio Wirl",
      "service": "Hair coloring",
      "image": "assets/images/e2.png",
      "color": Color(0xff8B5CF6),
    },
    {
      "time": "10.00",
      "name": "Karl Vandervort",
      "service": "Basic haircut",
      "image": "assets/images/e3.png",
      "color": Color(0xff8B5CF6),
    },
  ];

  Widget _buildTimeRow(String time, Map<String, dynamic> appointment) {
    return SizedBox(
      height: 70,
      child: Row(
        children: [
          SizedBox(
            width: 75,
            child: Text(
              time,
              style: TextStyle(fontSize: 12, color: Color(0xff6B7280)),
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                Positioned(
                  top: 12,
                  left: 0,
                  right: 0,
                  child: Divider(color: Color(0xffE5E7EB)),
                ),
                if (appointment.isNotEmpty)
                  Positioned(
                    top: 0,
                    left: 10,
                    child: _buildAppointmentCard(appointment),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAppointmentCard(Map<String, dynamic> data) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: data["color"],
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(radius: 16, backgroundImage: AssetImage(data["image"])),
          SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                data["name"],
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
              ),
              Text(
                data["service"],
                style: TextStyle(color: Colors.white70, fontSize: 11),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // ✅ Screen ki poori height lo
    final screenHeight = MediaQuery.of(context).size.height;

    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Detail Barber", style: TextStyle(fontSize: 18)),
        ),

        // ✅ Poori body SingleChildScrollView mein
        body: SingleChildScrollView(
          child: Column(
            children: [
              // Upar wala content
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Column(
                  children: [
                    RecomandedShopCo(
                      image1: AppImages.shop1,
                      name: "Master piece Barbershop - Haircut styling",
                      location: 'Joga Expo Centre  (2 km)',
                      reating: "5.0",
                      buttonname: "open",
                      icon: null,
                      licon: Icons.location_on,
                      ricon: Icons.star,
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [Icon(Icons.location_on), Text("Maps")],
                        ),
                        Column(children: [Icon(Icons.chat), Text("Chat")]),
                        Column(children: [Icon(Icons.share), Text("Share")]),
                        Column(
                          children: [Icon(Icons.favorite), Text("Favorite")],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),

              // TabBar
              Container(
                width: double.infinity,
                height: 60,
                decoration: BoxDecoration(color: Color(0xffEDEFFB)),
                child: TabBar(
                  isScrollable: true,
                  tabs: [
                    Tab(
                      child: Row(
                        children: [
                          Icon(Icons.person_4_outlined),
                          SizedBox(width: 4),
                          Text("About"),
                        ],
                      ),
                    ),
                    Tab(
                      child: Row(
                        children: [
                          Icon(Icons.cut_sharp),
                          SizedBox(width: 4),
                          Text("Service"),
                        ],
                      ),
                    ),
                    Tab(
                      child: Row(
                        children: [
                          Icon(Icons.calendar_month),
                          SizedBox(width: 4),
                          Text("Schedule"),
                        ],
                      ),
                    ),
                    Tab(
                      child: Row(
                        children: [
                          Icon(Icons.star),
                          SizedBox(width: 4),
                          Text("Review"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // ✅ TabBarView — SizedBox se height fix karo
              SizedBox(
                height: screenHeight * 0.6, // ✅ screen ka 60% height
                child: TabBarView(
                  children: [
                    // Tab 1 — About
                    SingleChildScrollView(
                      padding: EdgeInsets.symmetric(horizontal: 18),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 12),
                          Text(
                            "At Masterpiece Barbershop, our dedicated team of skilled barbers are true artists in their craft, transforming your hair,",
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Opening Hours",
                            style: TextStyle(
                              color: Color(0xff111827),
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Monday - friday"),
                              Text("09.00 am - 08.00 pm"),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Saturday - Sunday"),
                              Text("09.00 am - 09.00 pm"),
                            ],
                          ),
                          SizedBox(height: 20),
                          Text(
                            "Our Team",
                            style: TextStyle(
                              color: Color(0xff111827),
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: data.length,
                            itemBuilder: (context, index) {
                              final tim = data[index];
                              return OurTim(
                                image: tim.image,
                                name: tim.name,
                                subtitle: tim.subtitle,
                                addyou: tim.addyou,
                                icon: tim.icon,
                              );
                            },
                          ),
                          SizedBox(height: 20),
                        ],
                      ),
                    ),

                    // Tab 2 — Service
                    SingleChildScrollView(
                      padding: EdgeInsets.symmetric(
                        horizontal: 18,
                        vertical: 12,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Our Service",
                            style: TextStyle(
                              color: Color(0xff111827),
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: ldata.length,
                            itemBuilder: (context, index) {
                              final t = ldata[index];
                              return OurTim(
                                image: t.image,
                                name: t.name,
                                subtitle: t.subtitle,
                                addyou: t.addyou,
                                icon: t.icon,
                              );
                            },
                          ),
                          SizedBox(height: 20),
                        ],
                      ),
                    ),

                    // Tab 3 — Schedule
                    SingleChildScrollView(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 12),
                          Row(
                            children: [
                              Icon(
                                Icons.calendar_month,
                                color: Color(0xff363062),
                              ),
                              SizedBox(width: 8),
                              Text(
                                "28 Aug 2023",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              Icon(Icons.arrow_drop_down),
                            ],
                          ),
                          SizedBox(height: 8),
                          Text(
                            "Timeline",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff111827),
                            ),
                          ),
                          SizedBox(height: 8),

                          // ✅ Expanded hata diya — shrinkWrap use kiya
                          ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: _timeSlots.length,
                            itemBuilder: (context, index) {
                              final time = _timeSlots[index];
                              final appointment = _appointments.firstWhere(
                                (a) => time.startsWith(a["time"]),
                                orElse: () => {},
                              );
                              return _buildTimeRow(time, appointment);
                            },
                          ),
                          SizedBox(height: 20),
                        ],
                      ),
                    ),

                    // Tab 4 — Review
                    SingleChildScrollView(
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: rdata.length,
                        itemBuilder: (context, index) {
                          final r = rdata[index];
                          return ReviewCo(
                            image: r.image,
                            name: r.name,
                            addreview: r.addreview,
                            reating: r.reating,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),

              // ✅ Book Now Button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: ElevatedBu(
                  onPressed: () {
                    context.read<BookingProvider>().updateshop(
                      "assets/images/shop1.png",
                      "Master piece Barbershop - Haircut styling", // shop naam
                      "Jogja Expo Centre (2 km)", // location
                      "5.0",
                    );

                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Bookappoint()),
                    );
                  },
                  name: "Booking Now",
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
