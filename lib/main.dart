import 'package:easy_localization/easy_localization.dart';
import 'package:event_planning_pojo/cache/introduction_cache.dart';
import 'package:event_planning_pojo/providers/theme_provider.dart';
import 'package:event_planning_pojo/screens/intro_screens/intor_screen.dart';
import 'package:event_planning_pojo/screens/signIn_screens/forget_pass_screen.dart';
import 'package:event_planning_pojo/screens/signIn_screens/login_screen.dart';
import 'package:event_planning_pojo/screens/signIn_screens/register_screen.dart';
import 'package:event_planning_pojo/screens/start_screen/start_screen.dart';
import 'package:event_planning_pojo/theme/dark_theme.dart';
import 'package:event_planning_pojo/theme/light_theme.dart';
import 'package:event_planning_pojo/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await IntroductionCache.init();

  bool? start = IntroductionCache.getStart();
  bool? eligibility = IntroductionCache.getEligibility();
  

  String initialRoute;
  if (start == true) {
    initialRoute = eligibility == true ? LoginScreen.tag : IntroScreen.tag;
  } else {
    initialRoute = StartScreen.tag;
  }

  runApp(
    ChangeNotifierProvider(

      create: (BuildContext context) { 
        return ThemeProvider();
      },
      child: EasyLocalization(
        supportedLocales: [Locale('en'), Locale('ar')],
        fallbackLocale: Locale('en'),
        path: 'assets/translations',
        child: MainApp(
          initialRoute: initialRoute
        ),
      ),
    ),
  );
}

class MainApp extends StatelessWidget {
  final String initialRoute;
  const MainApp({super.key, required this.initialRoute});

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
      initialRoute:  initialRoute,// IntroductionCache.getStart() == true ? IntroScreen.tag : StartScreen.tag,
      routes: {
        StartScreen.tag: (context) => const StartScreen(),
        IntroScreen.tag: (context) =>  IntroScreen(),
        LoginScreen.tag: (context) =>  LoginScreen(),
        RegisterScreen.tag: (context) =>  RegisterScreen(),
        ForgetPassScreen.tag: (context) =>  ForgetPassScreen(),
      },
    );
  }
}
