import 'package:flutter/material.dart';

abstract class BaseTheme {
  Color get primaryColor;
  Color get secondaryColor;
  Color get accentColor;
  Color get backgroundColor;
  Color get textColor;
  Color get buttonColor;
  Color get iconColor;
  Color get borderColor;
  Color get errorColor;

  ThemeData get themeData;

}