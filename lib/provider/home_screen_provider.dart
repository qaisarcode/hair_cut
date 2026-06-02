import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class HomeScreenProvider with ChangeNotifier {
  int selectedshopindex = 0;
  String selectedshopimage = "assets/images/shop1.png";
  String selectedshopname = "Master piece Barbershop - Haircut styling";
  String selectedsshoplocation = "Jogja Expo Centre (2 km)";
  String selectedshopreating = "5.0";

  void upadateservices(
    int index,
    String image,
    String name,
    String location,
    String reating,
  ) {
    selectedshopindex = index;
    selectedshopimage = image;
    selectedshopname = name;
    selectedsshoplocation = location;
    selectedshopreating = reating;
    notifyListeners();
  }
}
