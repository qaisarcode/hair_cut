import 'package:flutter/foundation.dart';

class EmailProvider with ChangeNotifier {
  String? _email;
  String? _password;
  bool _isloding = false;

  String? get email => _email;
  String? get password => _password;

  void setemail(String value) {
    _email = value;
    notifyListeners();
  }

  void setpassowrd(String value) {
    _password = value;
    notifyListeners();
  }
}
