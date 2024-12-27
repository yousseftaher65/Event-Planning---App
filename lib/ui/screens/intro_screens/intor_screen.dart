import 'package:easy_localization/easy_localization.dart';
import 'package:event_planning_pojo/ui/cache/introduction_cache.dart';
import 'package:event_planning_pojo/ui/screens/auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class IntroScreen extends StatelessWidget {
  static const String tag = 'introScreen';
  const IntroScreen({super.key});

  Widget _buildImage(String assetName, [double width = 350]) {
    return Image.asset('assets/images/$assetName', width: width);
  }

  @override
  Widget build(BuildContext context) {
    final bodyStyle = Theme.of(context).textTheme.bodyLarge;

    final pageDecoration = PageDecoration(
      titleTextStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
            color: Theme.of(context).primaryColor,
          ),
      bodyTextStyle: bodyStyle!,
      bodyPadding: EdgeInsets.only(left: 16.0,right: 16.0,),
      imagePadding: EdgeInsets.zero,
      
      fullScreen: false,
      bodyAlignment: Alignment.center,
      imageAlignment: Alignment.bottomCenter,
      imageFlex: 2,
    );

    return IntroductionScreen(
      globalHeader: SafeArea(
        child: Image.asset(
          'assets/images/header.png',
          height: 275,
          alignment: Alignment.topCenter,
        ),
      ),
      dotsFlex: 2,
      dotsDecorator: DotsDecorator(
          activeColor: Theme.of(context).primaryColor,
          activeSize: const Size(16, 8),
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          color: Theme.of(context).indicatorColor),
      globalBackgroundColor: Theme.of(context).scaffoldBackgroundColor,
      showDoneButton: true,
      onDone: () async {
        await IntroductionCache.saveEligibility();
        Navigator.pushReplacementNamed(context, LoginScreen.tag);
      },
      showNextButton: true,
      nextStyle: ButtonStyle(
        shape: WidgetStatePropertyAll(
          CircleBorder(
            side: BorderSide(width: 2, color: Theme.of(context).primaryColor),
          ),
        ),
        overlayColor: WidgetStatePropertyAll(Colors.transparent),
      ),
      backStyle: ButtonStyle(
        shape: WidgetStatePropertyAll(
          CircleBorder(
            side: BorderSide(width: 2, color: Theme.of(context).primaryColor),
          ),
        ),
        overlayColor: WidgetStatePropertyAll(Colors.transparent),
      ),
      doneStyle: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(Colors.transparent),
        shape: WidgetStatePropertyAll(CircleBorder(
          side: BorderSide(width: 2, color: Theme.of(context).primaryColor),
        )),
        overlayColor: WidgetStatePropertyAll(Colors.transparent),
      ),
      showBackButton: true,
      back: Icon(
        Icons.arrow_back,
        color: Theme.of(context).primaryColor,
      ),
      done: Icon(
        Icons.arrow_forward,
        color: Theme.of(context).primaryColor,
      ),
      next: Icon(
        Icons.arrow_forward,
        color: Theme.of(context).primaryColor,
      ),
      pages: [
        PageViewModel(
          title: "onOne_title".tr(),
          body: "onOne_body".tr(),
          image: _buildImage('onOne.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "onTwo_title".tr(),
          body: "onTwo_body".tr(),
          image: _buildImage('onTwo.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "onThree_title".tr(),
          body: "onThree_body".tr(),
          image: _buildImage('onThree.png'),
          decoration: pageDecoration,
        ),
      ],
    );
  }
}
