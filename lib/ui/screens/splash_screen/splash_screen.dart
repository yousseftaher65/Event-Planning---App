import 'package:animate_do/animate_do.dart';
import 'package:event_planning_pojo/ui/cache/introduction_cache.dart';
import 'package:event_planning_pojo/ui/screens/auth/login_screen.dart';
import 'package:event_planning_pojo/ui/screens/intro_screens/intro_screen.dart';
import 'package:event_planning_pojo/ui/screens/start_screen/start_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  static const tag = '/';
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {

    bool? start = IntroductionCache.getStart();
    bool? eligibility = IntroductionCache.getEligibility();

    String initialRoute;
    if (start == true) {
      initialRoute = eligibility == true ? LoginScreen.tag : IntroScreen.tag;
    } else {
      initialRoute = StartScreen.tag;
    }
    
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, initialRoute);
    });

    Size size = MediaQuery.of(context).size;

    Duration duration = Duration(milliseconds: 1750);

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(),
          SizedBox(height: size.height * 0.15,),
        ZoomIn(
          duration: duration,
          child: Image.asset('assets/logos/appLogo.png', width: size.width * 0.6)),
          Spacer(),
          FadeInUp(
            duration: duration,
            child: Image.asset('assets/logos/routeLogo.png', width: size.width * 0.6)),
            Padding(padding:EdgeInsets.only(bottom: size.height * 0.024),),
        ],
      )),
    );
  }
}
