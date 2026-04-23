import 'package:flutter/material.dart';
import 'package:hair_cut/Utils/splash_view.dart';

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
          "Find the best grooming experience in your city\n with just one tap! Don't miss out on the haircut\n or treatment of your dreams. Let's start now!",
    },
    {
      "image": "assets/images/s3.png",
      "name": "Loooking for barber?",
      "details":
          "Find the best barbershop around you in\n seconds, make an appointment, and enjoy the \nbest grooming experience.!",
    },
    {
      "image": "assets/images/s2.png",
      "name": "Everything in your hands",
      "details":
          "With Gobar, find high-quality barbershops, see\n reviews, and make appointments easily.\n Achieve your confident appearance!!",
    },
  ];
  late PageController pageController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: pageController,
        itemCount: data.length,
        onPageChanged: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        itemBuilder: (context, index) {
          return SplashView(
            image: data[index]["image"]!,
            name: data[index]["name"]!,
            details: data[index]["details"]!,
            currentIndex: currentIndex,
          );
        },
      ),
    );
  }
}
