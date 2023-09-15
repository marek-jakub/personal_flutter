import 'package:flutter/material.dart';

class StateManager extends ChangeNotifier {
  /// A variable used to set application mode.
  ///
  /// If true, dark mode is set.
  var _darkMode = false;

  bool get darkMode => _darkMode;
  set setDarkMode(bool mode) {
    _darkMode = mode;
    notifyListeners();
  }
}
