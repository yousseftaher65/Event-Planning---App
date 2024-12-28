import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  
  ThemeMode _themeMode = ThemeMode.light;

  ThemeMode get themeMode => _themeMode;

  changeTheme( ThemeMode themeMode) {
    _themeMode = themeMode;
    // if (themeMode == ThemeMode.light) {
    //   _themeMode = ThemeMode.dark;
    // } else {
    //   _themeMode = ThemeMode.light;
    // }
    notifyListeners();
  } 
}