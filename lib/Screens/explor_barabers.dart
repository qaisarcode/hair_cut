import 'package:flutter/material.dart';
import 'package:hair_cut/Utils/nare_shops.dart';
import 'package:hair_cut/Utils/recomanded_shop_co.dart';
import 'package:hair_cut/res/app_images.dart';

class ExplorBarabers extends StatefulWidget {
  const ExplorBarabers({super.key});

  @override
  State<ExplorBarabers> createState() => _ExplorBarabersState();
}

class _ExplorBarabersState extends State<ExplorBarabers> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  final List<NareShops> data = [
    NareShops(
      image: AppImages.shop1,
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
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Explore Barbers", style: TextStyle(fontSize: 18)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 12),
                SizedBox(
                  height: screenHeight * 0.35,
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
                          image1: "assets/images/sho4.png",
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
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 44,
                        child: TextFormField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: const Color(0xffEBF0F5),
                            prefixIcon: const Icon(Icons.search),
                            hintText: "Search barber’s, haircut service",
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    SizedBox(
                      height: 44,
                      width: 44,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.zero,
                          backgroundColor: const Color(0xff363062),
                          minimumSize: const Size(44, 44),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {},
                        child: const Icon(
                          Icons.tune_outlined,
                          color: Color(0xffFFFFFF),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                DefaultTabController(
                  initialIndex: 1,
                  length: 4,
                  child: Column(
                    children: [
                      TabBar(
                        tabs: [
                          Tab(text: "services"),
                          Tab(text: "Basic haircut"),
                          Tab(text: "Color"),
                          Tab(text: "Treat"),
                        ],
                      ),
                      SizedBox(
                        height: screenHeight * 0.8,
                        child: TabBarView(
                          children: [
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
                            Text("name"),
                            Text("name"),
                            Text("name"),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
