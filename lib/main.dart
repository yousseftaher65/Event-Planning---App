import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:event_planning_pojo/ui/cache/introduction_cache.dart';
import 'package:event_planning_pojo/ui/providers/auth_validation_provider.dart';
import 'package:event_planning_pojo/ui/providers/theme_provider.dart';
import 'package:event_planning_pojo/ui/screens/edit_event/edit_event.dart';
import 'package:event_planning_pojo/ui/screens/event_details/event_details_screen.dart';
import 'package:event_planning_pojo/ui/screens/home/home_screen.dart';
import 'package:event_planning_pojo/ui/screens/home/tabs/create_event_tab/create_event_tab.dart';
import 'package:event_planning_pojo/ui/screens/intro_screens/intro_screen.dart';
import 'package:event_planning_pojo/ui/screens/auth/forget_pass_screen.dart';
import 'package:event_planning_pojo/ui/screens/auth/login_screen.dart';
import 'package:event_planning_pojo/ui/screens/auth/register_screen.dart';
import 'package:event_planning_pojo/ui/screens/splash_screen/splash_screen.dart';
import 'package:event_planning_pojo/ui/screens/start_screen/start_screen.dart';
import 'package:event_planning_pojo/ui/services/auth_service.dart';
import 'package:event_planning_pojo/ui/theme/dark_theme.dart';
import 'package:event_planning_pojo/ui/theme/light_theme.dart';
import 'package:event_planning_pojo/ui/theme/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseFirestore.instance.disableNetwork();
  await EasyLocalization.ensureInitialized();
  await IntroductionCache.init();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool initialIsDarkMode =
  prefs.getBool('isDarkMode') ?? ThemeMode.light == ThemeMode.light;

  runApp(
  MultiProvider(
    providers: [
ChangeNotifierProvider<ThemeProvider>(
      create: (BuildContext context) 
        => ThemeProvider(initialIsDarkMode),
    ),
ChangeNotifierProvider<AuthValidationProvider>(
      create: (BuildContext context) 
        => AuthValidationProvider(authService: AuthService()),
    ),
    ],
      child: EasyLocalization(
        supportedLocales: [Locale('en'), Locale('ar')],
        fallbackLocale: Locale('en'),
        path: 'assets/translations',
        child: MainApp(initialIsDarkMode: initialIsDarkMode),
      ),
    ),
  );
}

class MainApp extends StatelessWidget {
  final bool initialIsDarkMode;
  const MainApp({super.key, required this.initialIsDarkMode});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    BaseTheme lightTheme = LightTheme();
    BaseTheme darkTheme = DarkTheme();

    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      theme: lightTheme.themeData,
      darkTheme: darkTheme.themeData,
      themeMode: themeProvider.themeMode,
      initialRoute: SplashScreen.tag,
      routes: {
        SplashScreen.tag: (context) => const SplashScreen(),
        StartScreen.tag: (context) => const StartScreen(),
        IntroScreen.tag: (context) => IntroScreen(),
        LoginScreen.tag: (context) => LoginScreen(),
        RegisterScreen.tag: (context) => RegisterScreen(),
        ForgetPassScreen.tag: (context) => ForgetPassScreen(),
        HomeScreen.tag: (context) => HomeScreen(),
        CreateEventTab.tag: (context) => CreateEventTab(),
        EventDetailsScreen.tag: (context) => EventDetailsScreen(),
        EditEvent.tag: (context) => EditEvent(),
      },
    );
  }
}
