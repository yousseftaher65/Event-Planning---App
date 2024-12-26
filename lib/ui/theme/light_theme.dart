import 'package:event_planning_pojo/ui/theme/theme.dart';
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
  Color get borderColor => Color(0xff7B7B7B);

  @override
  Color get errorColor => Colors.red;

  @override
  ThemeData get themeData => ThemeData(
        indicatorColor: accentColor,
        primaryColor: primaryColor,
        scaffoldBackgroundColor: backgroundColor,
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          elevation: 0,
          shape: CircleBorder(
            side: BorderSide(
              color: secondaryColor,
              width: 4,
            ),
          ),
          backgroundColor: primaryColor,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: backgroundColor,
          centerTitle: true,
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          selectedLabelStyle: TextStyle(
            fontFamily: GoogleFonts.inter().fontFamily,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
          unselectedLabelStyle: TextStyle(
            fontFamily: GoogleFonts.inter().fontFamily,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
          backgroundColor: primaryColor,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedItemColor: iconColor,
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
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            backgroundColor: primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          prefixIconColor: borderColor,
          errorStyle: TextStyle(color: errorColor),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
              color: errorColor,
              width: 2,
            ),
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 16),
          labelStyle: TextStyle(color: borderColor),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
              color: borderColor,
              width: 2,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
              color: borderColor,
              width: 2,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
              color: borderColor,
              width: 2,
            ),
          ),
        ),
        searchBarTheme: SearchBarThemeData(
          elevation: WidgetStatePropertyAll(0),
          backgroundColor: WidgetStatePropertyAll(secondaryColor),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              side: BorderSide(color: primaryColor, width: 1),
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          padding: WidgetStatePropertyAll(
            EdgeInsets.symmetric(horizontal: 16),
          ),
          hintStyle: WidgetStatePropertyAll(
            TextStyle(color: primaryColor),
          ),
        ),
      );
}
