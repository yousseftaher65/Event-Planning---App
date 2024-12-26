import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  
  ThemeMode themeMode = ThemeMode.light;

  changeTheme() {
    if (themeMode == ThemeMode.light) {
      themeMode = ThemeMode.dark;
    } else {
      themeMode = ThemeMode.light;
    }
    notifyListeners();
  } 
}