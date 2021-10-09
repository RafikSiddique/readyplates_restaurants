import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readyplates_restaurants/src/onboarding/controller/auth_controller.dart';
import 'package:readyplates_restaurants/src/onboarding/controller/onboarding_controller.dart';
import 'package:readyplates_restaurants/src/screens/login_page.dart';
import 'package:readyplates_restaurants/src/onboarding/screens/onboarding_page4.dart';
import 'package:readyplates_restaurants/src/onboarding/screens/onboarding_page5.dart';
import 'package:readyplates_restaurants/src/onboarding/screens/onboarding_page6.dart';
import 'package:readyplates_restaurants/src/onboarding/screens/onboarding_page7.dart';
import 'package:readyplates_restaurants/src/onboarding/screens/onboarding_page8.dart';
import 'package:readyplates_restaurants/src/onboarding/screens/onboarding_page9.dart';
import 'package:readyplates_restaurants/src/screens/signup_page.dart';
import 'package:readyplates_restaurants/src/onboarding/screens/onboarding_page1.dart';
import 'package:readyplates_restaurants/src/onboarding/screens/onboarding_page2.dart';
import 'package:readyplates_restaurants/src/onboarding/screens/onboarding_page3.dart';
import 'package:readyplates_restaurants/src/staticscreens/opening_screen.dart';
import 'package:readyplates_restaurants/utils/shared_preference_helper.dart';
import 'package:readyplates_restaurants/utils/utils.dart';

import 'src/screens/signup_page.dart';

void main() {
  Get.put(OnBoardingController());
  Get.put(SharedPreferenceHelper());
  Get.put(AuthController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SignupPage.id,
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      routes: {
        Routes.openingscreenRoute: (context) => OpeningScreen(),
        SignupPage.id: (context) => SignupPage(),
        LoginPage.id: (context) => LoginPage(),
        OnboardingPage1.id: (context) => OnboardingPage1(),
        OnboardingPage2.id: (context) => OnboardingPage2(),
        Routes.onboarding3Route: (context) => OnboardingPage3(),
        Routes.onboarding4Route: (context) => OnboardingPage4(),
        Routes.onboarding5Route: (context) => OnboardingPage5(),
        Routes.onboarding6Route: (context) => OnboardingPage6(),
        Routes.onboarding7Route: (context) => OnboardingPage7(),
        Routes.onboarding8Route: (context) => OnboardingPage8(),
        Routes.onboarding9Route: (context) => OnboardingPage9(),
      },
    );
  }
}
