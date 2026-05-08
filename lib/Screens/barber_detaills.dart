import 'package:flutter/material.dart';
import 'package:hair_cut/Utils/our_tim.dart';
import 'package:hair_cut/Utils/recomanded_shop_co.dart';

class BarberDetaills extends StatefulWidget {
  const BarberDetaills({super.key});

  @override
  State<BarberDetaills> createState() => _BarberDetaillsState();
}

class _BarberDetaillsState extends State<BarberDetaills> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Detail Barber", style: TextStyle(fontSize: 18)),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Column(
                children: [
                  RecomandedShopCo(
                    image1: "assets/images/shop1.png",
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
                    children: [
                      Column(children: [Icon(Icons.location_on), Text("Maps")]),
                      SizedBox(width: 50),
                      Column(children: [Icon(Icons.chat), Text("Chat")]),
                      SizedBox(width: 50),
                      Column(children: [Icon(Icons.share), Text("Share")]),
                      SizedBox(width: 50),
                      Column(
                        children: [Icon(Icons.favorite), Text("Favorite")],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            Container(
              width: double.infinity,
              height: 60,
              decoration: BoxDecoration(color: Color(0xffEDEFFB)),
              child: TabBar(
                isScrollable: true,
                tabs: [
                  Tab(
                    child: Row(
                      children: [Icon(Icons.person_4_outlined), Text("About")],
                    ),
                  ),
                  Tab(
                    child: Row(
                      children: [Icon(Icons.cut_sharp), Text("Service")],
                    ),
                  ),
                  Tab(
                    child: Row(
                      children: [Icon(Icons.calendar_month), Text("Schedule")],
                    ),
                  ),
                  Tab(child: Row(children: [Icon(Icons.star), Text("Review")])),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "At Masterpiece Barbershop, our dedicated team of skilled barbers are true artists in their craft, transforming your hair, ",
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
                            Text("09.00  am - 08.00 pm "),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Saturday - Sunday"),
                            Text("09.00  am - 09.00 pm  "),
                          ],
                        ),
                        Text(
                          "Our Tim",
                          style: TextStyle(
                            color: Color(0xff111827),
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        OurTim(
                          image: "assets/images/e1.png",
                          name: "Luther Hammes",
                          subtitle: "Specialist Haircut",
                          addyou: "5.0",
                        ),
                      ],
                    ),
                  ),
                  Center(child: Text("Services")),

                  Center(child: Text("Shaduled")),
                  Center(child: Text("Review")),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
