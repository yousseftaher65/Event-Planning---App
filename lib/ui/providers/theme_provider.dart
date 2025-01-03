import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  
  ThemeMode _themeMode = ThemeMode.light;


  ThemeMode get themeMode => _themeMode;
  ThemeProvider(bool initialIsDarkMode)
      : _themeMode = initialIsDarkMode ?  ThemeMode.light : ThemeMode.dark;

  changeTheme( ThemeMode themeMode) async {
    _themeMode = themeMode;
    // if (themeMode == ThemeMode.light) {
    //   _themeMode = ThemeMode.dark;
    // } else {
    //   _themeMode = ThemeMode.light;
    // }
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDarkMode', themeMode == ThemeMode.light);
    notifyListeners();
  } 
}