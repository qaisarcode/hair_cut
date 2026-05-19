import 'package:flutter/material.dart';
import 'package:hair_cut/Screens/login_screen.dart';
import 'package:hair_cut/Utils/elevated_bu.dart';

class OnbordingScreen extends StatefulWidget {
  const OnbordingScreen({super.key});

  @override
  State<OnbordingScreen> createState() => _OnbordingScreenState();
}

class _OnbordingScreenState extends State<OnbordingScreen> {
  int currentIndex = 0;

  final List<Map<String, String>> data = [
    {
      "image": "assets/images/s1.png",
      "name": "Welcome Gobars",
      "details":
          "Find the best grooming experience in your city with just one tap! Don't miss out on the haircut or treatment of your dreams. Let's start now!",
    },
    {
      "image": "assets/images/s3.png",
      "name": "Looking for barber?",
      "details":
          "Find the best barbershop around you in seconds, make an appointment, and enjoy the best grooming experience!",
    },
    {
      "image": "assets/images/s2.png",
      "name": "Everything in your hands",
      "details":
          "With Gobar, find high-quality barbershops, see reviews, and make appointments easily. Achieve your confident appearance!",
    },
  ];

  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isLastPage = currentIndex == data.length - 1;
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: pageController,
            itemCount: data.length,
            onPageChanged: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            itemBuilder: (context, index) {
              return Container(
                height: MediaQuery.of(context).size.height * 0.65,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xffFFFFFF),
                  image: DecorationImage(
                    image: AssetImage(data[index]["image"]!),
                    fit: BoxFit.contain,
                    alignment: Alignment.topCenter,
                  ),
                ),
              );
            },
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 350,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color(0xffF99417),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 24,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title
                    Text(
                      data[currentIndex]["name"]!,
                      style: const TextStyle(
                        color: Color(0xffFFFFFF),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),

                    // Details
                    Text(
                      data[currentIndex]["details"]!,
                      style: const TextStyle(color: Color(0xffFFFFFF)),
                    ),
                    const SizedBox(height: 40),

                    // Dots
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        data.length,
                        (index) => AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          width: currentIndex == index ? 30 : 8,
                          height: 8,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: currentIndex == index
                                ? const Color(0xff363062)
                                : Colors.white54,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),

                    // Button
                    Align(
                      alignment: Alignment.center,
                      child: ElevatedBu(
                        onPressed: () {
                          if (isLastPage) {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const LoginScreen(),
                              ),
                            );
                          } else {
                            pageController.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          }
                        },
                        name: isLastPage ? "Get Started" : "Next",
                      ),
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
