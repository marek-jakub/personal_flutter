import 'package:flutter/material.dart';

class StateManager extends ChangeNotifier {
  var _darkMode = false;

  bool get darkMode => _darkMode;
  set setDarkMode(bool mode) {
    _darkMode = mode;
    notifyListeners();
  }
}
