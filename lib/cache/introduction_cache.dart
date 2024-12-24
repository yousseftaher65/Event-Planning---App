import 'package:shared_preferences/shared_preferences.dart';

class IntroductionCache {
  static late final SharedPreferences prefs;

  // Initialize SharedPreferences
  static init() async {
    prefs = await SharedPreferences.getInstance();
  }

  // Save eligibility state (true or false)
  static Future<bool> saveEligibility() async {
    bool result = await prefs.setBool("onBoarding", true);
    return result;
  }

  // Get eligibility state (returns null if not set)
  static bool? getEligibility() {
    return prefs.getBool("onBoarding");
  }

  // Save that the start screen has been seen
  static Future<bool> saveStart() async {
    bool result = await prefs.setBool("startScreen", true);
    return result;
  }

  // Get whether the start screen has been seen
  static bool? getStart() {
    return prefs.getBool("startScreen");
  }
}