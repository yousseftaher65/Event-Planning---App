import 'package:easy_localization/easy_localization.dart';
import 'package:event_planning_pojo/ui/cache/introduction_cache.dart';
import 'package:event_planning_pojo/ui/providers/theme_provider.dart';
import 'package:event_planning_pojo/ui/screens/intro_screens/intor_screen.dart';
import 'package:event_planning_pojo/ui/screens/auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:toggle_switch/toggle_switch.dart';

class StartScreen extends StatelessWidget {
  static const String tag = "StartScreen";
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    //var eligibility = IntroductionCache.getEligibility() ?? false;

    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/images/header.png',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              'assets/images/startBg.png',
              width: double.infinity,
              fit: BoxFit.fill,
            ),
            SizedBox(height: 28),
            Text(
              "intorduction_title".tr(),
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: Theme.of(context).primaryColor),
            ),
            SizedBox(height: 28),
            Text(
              "intorduction_body".tr(),
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            SizedBox(height: 28),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "language".tr(),
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Theme.of(context).primaryColor),
                ),
                ToggleSwitch(
                  minWidth: 73,
                  minHeight: 30,
                  cornerRadius: 20.0,
                  activeBgColors: [
                    [ Colors.white,Colors.red[800]! ,Colors.lightBlue],
                    [Colors.white,Colors.green[800]! , Colors.yellow[800]!],
                  ],
                  activeFgColor: Colors.white,
                  inactiveBgColor: Colors.transparent,
                  inactiveFgColor: Colors.black,
                  initialLabelIndex: context.locale.languageCode == 'ar' ? 1 : 0,
                  totalSwitches: 2,
                  icons: [
                    FontAwesomeIcons.flagUsa,
                    MdiIcons.abjadArabic,
                  ],
                  radiusStyle: true,
                  onToggle: (index) {
                    if(index == 1){
                      context.setLocale(Locale('ar'),);
                    }else{
                      context.setLocale(Locale('en'),);
                    }
                  },
                ),
              ],
            ),
            SizedBox(height: 28),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "theme".tr(),
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Theme.of(context).primaryColor),
                ),
                ToggleSwitch(
                  minWidth: 73,
                  minHeight: 30,
                  cornerRadius: 20.0,
                  activeBgColors: [
                    [Theme.of(context).primaryColor],
                    [Theme.of(context).primaryColor]
                  ],
                  activeFgColor: Colors.white,
                  inactiveBgColor: Colors.transparent,
                  inactiveFgColor: Theme.of(context).primaryColor ,
                  initialLabelIndex: themeProvider.themeMode == ThemeMode.dark ? 1 : 0,
                  totalSwitches: 2,
                  icons: [
                    FontAwesomeIcons.sun,
                    FontAwesomeIcons.moon,
                  ],
                  radiusStyle: true,
                  onToggle: (index) {
                    themeProvider.changeTheme( index == 1 ? ThemeMode.dark : ThemeMode.light);
                  },
                ),
              ],
            ),
            SizedBox(height: 28),
            ElevatedButton(
              onPressed: () async {
                await IntroductionCache.saveStart();
                bool? eligibility = IntroductionCache.getEligibility();
                Navigator.pushReplacementNamed(
                  context,
                  (eligibility == true) ? LoginScreen.tag : IntroScreen.tag,
                );
              },
              child: Text(
                "lets_start".tr(),
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: Theme.of(context).scaffoldBackgroundColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
