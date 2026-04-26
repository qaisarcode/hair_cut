import 'package:flutter/material.dart';
import 'package:hair_cut/Screens/booking.dart';
import 'package:hair_cut/Screens/chat_screen.dart';
import 'package:hair_cut/Screens/home_screen.dart';
import 'package:hair_cut/Screens/profile_screen.dart';

class BotomBr extends StatefulWidget {
  const BotomBr({super.key});

  @override
  State<BotomBr> createState() => _BotomBrState();
}

class _BotomBrState extends State<BotomBr> {
  int currentindex = 0;
  List Screens = [
    const HomeScreen(),
    const Booking(),
    const ChatScreen(),
    const ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Screens[currentindex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Color(0xff363062),
        unselectedItemColor: Color(0xff94A3B8),
        currentIndex: currentindex,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            currentindex = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.book_online),
            label: "Booking",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: "Chat"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}
