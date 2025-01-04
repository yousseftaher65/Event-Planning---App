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
  Color get backgroundColor => secondaryColor;

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
        secondaryHeaderColor: accentColor,
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

        //App Bar Theme
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(color: secondaryColor),
          surfaceTintColor: primaryColor,
          titleTextStyle: TextStyle(
              fontFamily: GoogleFonts.inter().fontFamily,
              fontWeight: FontWeight.normal,
              fontSize: 24,
              color: secondaryColor),
          backgroundColor: primaryColor,
          centerTitle: true,
        ),
        
        // Bottom Nav Theme
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

        // Text Theme
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
          titleSmall: GoogleFonts.inter(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: textColor,
          ),
          bodyLarge: GoogleFonts.inter(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: textColor,
          ),
        ),

        // Button Theme
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              backgroundColor: primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              textStyle: TextStyle(
                fontFamily: GoogleFonts.inter().fontFamily,
                color: secondaryColor,
              )),
        ),

        // Text Field Theme
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
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
              color: errorColor,
              width: 2,
            ),
          ),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
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

        // Search Bar Theme
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
        dropdownMenuTheme: DropdownMenuThemeData(
          inputDecorationTheme: InputDecorationTheme(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            //labelStyle: TextStyle(color: primaryColor),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(24),
              borderSide: BorderSide(
                color: primaryColor,
                width: 2,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(24),
              borderSide: BorderSide(
                color: primaryColor,
                width: 2,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(24),
              borderSide: BorderSide(
                color: primaryColor,
                width: 2,
              ),
            ),
          ),
          menuStyle: MenuStyle(
            elevation: WidgetStatePropertyAll(2),
            padding: WidgetStatePropertyAll(
              EdgeInsets.only(
                left: 16,
                right: 16,
              ),
            ),
            surfaceTintColor: WidgetStatePropertyAll(backgroundColor),
            backgroundColor: WidgetStatePropertyAll(backgroundColor),
          ),
          textStyle: TextStyle(
              fontSize: 20,
              fontFamily: GoogleFonts.inter().fontFamily,
              fontWeight: FontWeight.bold,
              color: primaryColor),
        ),
        menuButtonTheme: MenuButtonThemeData(
          style: ButtonStyle(
            textStyle: WidgetStatePropertyAll(
              TextStyle(
                fontFamily: GoogleFonts.inter().fontFamily,
                fontWeight: FontWeight.w700,
                fontSize: 16,
              ),
            ),
            foregroundColor: WidgetStatePropertyAll(primaryColor),
          ),
        ),
      );
}
