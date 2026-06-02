import 'package:flutter/widgets.dart';
import 'package:flutter/foundation.dart';

class BookingProvider with ChangeNotifier {
  DateTime today = DateTime.now();
  DateTime focustoday = DateTime.now();
  int selectedSrevicesindex = 0;
  int selectedTime = -1;
  String selectedservicesname = "basic haircut";
  String selectedservicesprice = "\$20";
  String selectedtimes = "";
  String selectedservicesimage = "assets/images/c1.png";

  // Shope carde how to crate

  String shop = "assets/images/sho1.png";
  String shopname = "Master piece Barbershop - Haircut styling";
  String shoplocation = "Jogja Expo Centre (2 km)";
  String shopraeting = "5.0";

  void updatedate(DateTime seleced, DateTime focused) {
    today = seleced;
    focustoday = focused;
    notifyListeners();
  }

  //service selection
  void updatteservices(int index, String name, String price, String image) {
    selectedSrevicesindex = index;
    selectedservicesname = name;
    selectedservicesprice = price;
    selectedservicesimage = image;
    notifyListeners();
  }

  //time section
  void updatetime(int index, String time) {
    selectedTime = index;
    selectedtimes = time;
    notifyListeners();
  }

  void updateshop(String image, String name, String location, String reating) {
    shop = image;
    shopname = name;
    shoplocation = location;
    shopraeting = reating;

    notifyListeners();
  }
}
