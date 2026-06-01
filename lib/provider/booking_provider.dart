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

  void updatedate(DateTime seleced, DateTime focused) {
    today = seleced;
    focustoday = focused;
    notifyListeners();
  }

  //service selection
  void updatteservices(int index, String name, String price) {
    selectedSrevicesindex = index;
    selectedservicesname = name;
    selectedservicesprice = price;
    notifyListeners();
  }

  //time section
  void updatetime(int index, String time) {
    selectedTime = index;
    selectedtimes = time;
    notifyListeners();
  }
}
