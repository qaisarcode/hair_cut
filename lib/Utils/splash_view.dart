// import 'dart:nativewrappers/_internal/vm/lib/ffi_patch.dart';

import 'package:flutter/material.dart';
import 'package:hair_cut/Screens/login_screen.dart';
import 'package:hair_cut/Utils/elevated_bu.dart';

class SplashView extends StatefulWidget {
  final String image;
  final String name;
  final String details;
  final int currentIndex;
  const SplashView({
    super.key,
    required this.image,
    required this.name,
    required this.details,
    required this.currentIndex,
  });

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ClipRRect(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.65,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xffFFFFFF),
                image: DecorationImage(
                  image: AssetImage(widget.image),
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                ),
              ),
            ),
          ),
          Align(
            alignment: AlignmentGeometry.bottomEnd,
            child: Container(
              height: 350,
              width: double.infinity,
              decoration: BoxDecoration(
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
                      widget.name,
                      style: TextStyle(
                        color: Color(0xffFFFFFF),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      widget.details,
                      style: TextStyle(color: Color(0xffFFFFFF)),
                    ),
                    SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ...List.generate(
                          3,
                          (index) => Container(
                            margin: const EdgeInsets.symmetric(horizontal: 4),
                            width: widget.currentIndex == index ? 30 : 8,
                            height: widget.currentIndex == index ? 12 : 8,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: widget.currentIndex == index
                                  ? Color(0xff363062)
                                  : Colors.white54,
                              // shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    Align(
                      alignment: AlignmentGeometry.center,
                      child: ElevatedBu(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => LoginScreen()),
                          );
                        },
                        name: "Get Started",
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
