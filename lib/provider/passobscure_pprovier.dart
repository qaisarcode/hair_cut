import 'package:flutter/foundation.dart';

class PassobscurePprovier with ChangeNotifier {
  bool _obscurepass = true;
  bool get obscurepass => _obscurepass;

  void toggle() {
    _obscurepass = !_obscurepass;

    notifyListeners();
  }
}
