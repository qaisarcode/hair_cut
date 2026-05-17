import 'package:flutter/material.dart';
import 'package:hair_cut/Screens/login_screen.dart';
import 'package:hair_cut/Utils/elevated_bu.dart';

class SplashView extends StatelessWidget {
  final String image;
  final String name;
  final String details;
  final int currentIndex;
  final int totalCount;
  final VoidCallback onNext; // ← naya add kiya

  const SplashView({
    super.key,
    required this.image,
    required this.name,
    required this.details,
    required this.currentIndex,
    required this.totalCount, // ← naya
    required this.onNext, // ← naya
  });

  @override
  Widget build(BuildContext context) {
    bool isLastPage = currentIndex == totalCount - 1; // ← last page check

    return Scaffold(
      body: Stack(
        children: [
          ClipRRect(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.65,
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xffFFFFFF),
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                ),
              ),
            ),
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
                    Text(
                      name,
                      style: const TextStyle(
                        color: Color(0xffFFFFFF),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      details,
                      style: const TextStyle(color: Color(0xffFFFFFF)),
                    ),
                    const SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        totalCount,
                        (index) => Container(
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          width: currentIndex == index ? 30 : 8,
                          height: currentIndex == index ? 12 : 8,
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
                    Align(
                      alignment: Alignment.center,
                      child: ElevatedBu(
                        onPressed: () {
                          if (isLastPage) {
                            // ← Last page → Login
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const LoginScreen(),
                              ),
                            );
                          } else {
                            onNext(); // ← Next page
                          }
                        },
                        name: isLastPage
                            ? "Get Started"
                            : "Next", // ← text badlega
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
