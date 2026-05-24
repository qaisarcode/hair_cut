import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class DarkmodeProvider with ChangeNotifier {
  ThemeMode tthemeMode = ThemeMode.light;

  ThemeMode get thmemode => tthemeMode;

  void settheme(ThemeMode mode) {
    tthemeMode = mode;
    notifyListeners();
  }
}
