import 'package:event_planning_pojo/screens/start_screen/start_screen.dart';
import 'package:event_planning_pojo/theme/dark_theme.dart';
import 'package:event_planning_pojo/theme/light_theme.dart';
import 'package:event_planning_pojo/theme/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    BaseTheme lightTheme = LightTheme();
    BaseTheme darkTheme = DarkTheme();

    return MaterialApp(
      theme: lightTheme.themeData,
      darkTheme: darkTheme.themeData,
      initialRoute: StartScreen.tag,
      routes: {
        StartScreen.tag: (context) => const StartScreen(),
      },
    );
  }
}
