import 'package:easy_localization/easy_localization.dart';
import 'package:event_planning_pojo/screens/start_screen/start_screen.dart';
import 'package:event_planning_pojo/theme/dark_theme.dart';
import 'package:event_planning_pojo/theme/light_theme.dart';
import 'package:event_planning_pojo/theme/theme.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      supportedLocales: [Locale('en'), Locale('ar')],
      fallbackLocale: Locale('en'),
      path: 'assets/translations',
      child: MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    BaseTheme lightTheme = LightTheme();
    BaseTheme darkTheme = DarkTheme();

    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      theme: lightTheme.themeData,
      darkTheme: darkTheme.themeData,
      themeMode: ThemeMode.light,
      initialRoute: StartScreen.tag,
      routes: {
        StartScreen.tag: (context) => const StartScreen(),
      },
    );
  }
}
