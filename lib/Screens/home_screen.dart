import 'package:flutter/material.dart';
import 'package:hair_cut/Screens/explor_barabers.dart';
import 'package:hair_cut/Utils/list_button.dart';
import 'package:hair_cut/Utils/nare_shops.dart';
import 'package:hair_cut/Utils/recomanded_shop_co.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
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

  final List<NareShops> dlist = [
    NareShops(
      image: "assets/images/sho4.png",
      sname: "Varcity Barbershop Jogja ex The Varcher ",
      duration: "Condongcatur (10 km)",
      reating: "4.5",
    ),
    NareShops(
      image: "assets/images/sho5.png",
      sname: "Twinsky Monkey Barber & Men Stuff",
      duration: "Jl Taman Siswa (8 km)",
      reating: "5.0",
    ),
    NareShops(
      image: "assets/images/sho6.png",
      sname: "Barberman - Haircut styling & massage ",
      duration: "J-Walk Centre  (17 km)",
      reating: "4.5",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.location_on),
                    const Text("Yogyakarta"),
                    const Spacer(),
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: Color(0xffEBF0F5),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                const Text(
                  "Joe Samanta",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff111827),
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  height: 225,
                  width: double.infinity,
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
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset("assets/images/logo.png", height: 24),
                              SizedBox(height: 4),
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
                            padding: EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 10,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onPressed: () {},
                          child: Text(
                            "Booking Now",
                            style: TextStyle(
                              color: Color(0xffFFFFFF),
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        right: -20,
                        bottom: -20,
                        child: Image.asset(
                          "assets/images/s2.png",
                          height: 200,
                          width: 180,
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
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return Container(
                                decoration: BoxDecoration(
                                  color: Color(0xffFFFFFF),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 18,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 18,
                                          vertical: 16,
                                        ),
                                        width: double.infinity,
                                        height: 80,
                                        decoration: BoxDecoration(
                                          color: Color(0xffEDEFFB),
                                        ),
                                        child: Row(
                                          children: [
                                            Container(
                                              padding: EdgeInsets.all(12),
                                              width: 48,

                                              decoration: BoxDecoration(
                                                color: Color(0xffFFFFFF),
                                              ),
                                              child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  minimumSize: Size(24, 24),
                                                  padding: EdgeInsets.zero,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadiusGeometry.circular(
                                                          5,
                                                        ),
                                                  ),
                                                  backgroundColor: Color(
                                                    0xffFFA72A,
                                                  ),
                                                ),
                                                onPressed: () {},
                                                child: Icon(
                                                  Icons.question_mark_sharp,
                                                  color: Color(0xffFFFFFF),
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 20),
                                            Text(
                                              "Filter",
                                              style: TextStyle(
                                                color: Color(0xff111827),
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Spacer(),
                                            ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                minimumSize: Size(24, 24),
                                                padding: EdgeInsets.zero,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadiusGeometry.circular(
                                                        5,
                                                      ),
                                                ),
                                                backgroundColor: Color(
                                                  0xffFFA72A,
                                                ),
                                              ),
                                              onPressed: () {},
                                              child: Icon(
                                                Icons.question_mark_sharp,
                                                color: Color(0xffFFFFFF),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Text("General Category"),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
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
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    final shop = data[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: NareShops(
                        image: shop.image,
                        sname: shop.sname,
                        duration: shop.duration,
                        reating: shop.reating,
                      ),
                    );
                  },
                ),
                const SizedBox(height: 12),
                Align(
                  alignment: Alignment.center,
                  child: ListButton(
                    onPressed: () {},
                    icon: Icons.list,
                    lable: "See All",
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  "Most recomanded",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff111827),
                  ),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  height: 300,
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: 3,
                    onPageChanged: (index) {
                      setState(() => _currentPage = index);
                    },
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: RecomandedShopCo(
                          image1: "assets/images/shop1.png",
                          name: "Master piece Barbershop - Haircut styling",
                          location: "Joga Expo Centre (2 km)",
                          reating: "5.0",
                          icon: Icons.bookmark,
                          buttonname: "Booking",
                          ricon: Icons.star,
                          licon: Icons.location_on,
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    3,
                    (index) => AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      width: _currentPage == index ? 20 : 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: _currentPage == index
                            ? const Color(0xff363062)
                            : const Color(0xffCBD5E1),
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: dlist.length,
                  itemBuilder: (context, index) {
                    final shop = dlist[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: NareShops(
                        image: shop.image,
                        sname: shop.sname,
                        duration: shop.duration,
                        reating: shop.reating,
                      ),
                    );
                  },
                ),
                const SizedBox(height: 16),
                Align(
                  alignment: Alignment.center,
                  child: ListButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ExplorBarabers(),
                        ),
                      );
                    },
                    icon: Icons.list_alt,
                    lable: "See All",
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  "Find a barber nearby",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff111827),
                  ),
                ),
                const SizedBox(height: 12),
                const RecomandedShopCo(
                  image1: "assets/images/map.png",
                  name: "",
                  location: "",
                  reating: "",
                  buttonname: "Find now",
                  icon: Icons.search,
                  licon: null,
                  ricon: null,
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
