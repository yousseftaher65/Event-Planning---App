import 'package:event_planning_pojo/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LightTheme extends BaseTheme {
  @override
  Color get primaryColor => Color(0xFF5669FF);

  @override
  Color get secondaryColor => Color(0xFFF2FEFF);

  @override
  Color get accentColor => Color(0xFF1C1C1C);

  @override
  Color get backgroundColor => Colors.white;

  @override
  Color get textColor => accentColor;

  @override
  Color get buttonColor => primaryColor;

  @override
  Color get iconColor => secondaryColor;

  @override
  Color get borderColor => Colors.transparent;

  @override
  Color get errorColor => Colors.red;
  
  
  @override
  ThemeData get themeData => ThemeData(
    indicatorColor: accentColor,
    primaryColor: primaryColor,
    scaffoldBackgroundColor: backgroundColor,
    appBarTheme: AppBarTheme(
      backgroundColor: backgroundColor,
      centerTitle: true,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: backgroundColor,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      selectedItemColor: primaryColor,
      unselectedItemColor: iconColor,
    ),
    textTheme: TextTheme(
      titleLarge: GoogleFonts.inter(
        fontSize: 24,
        fontWeight: FontWeight.w700,
        color: textColor,
      ),
      titleMedium: GoogleFonts.inter(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        color: textColor,
      ),
      bodyLarge: GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w700,
        color: textColor,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 16),
        backgroundColor: primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),
  );

}