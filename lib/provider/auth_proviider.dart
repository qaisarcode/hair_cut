import 'package:flutter/foundation.dart';

class AuthProviider with ChangeNotifier {
  String? _email;
  String? _password;
  final bool _isloding = false;

  String? get email => _email;
  String? get password => _password;
  bool get isLoading => _isloding;
  void setemail(String value) {
    _email = value;
    notifyListeners();
  }

  void setpassowrd(String value) {
    _password = value;
    notifyListeners();
  }
}
