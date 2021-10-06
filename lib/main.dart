import 'package:flutter/material.dart';
import 'package:readyplates_restaurants/src/screens/login_page.dart';
import 'package:readyplates_restaurants/src/screens/onboarding_page4.dart';
import 'package:readyplates_restaurants/src/screens/onboarding_page5.dart';
import 'package:readyplates_restaurants/src/screens/onboarding_page6.dart';
import 'package:readyplates_restaurants/src/screens/signup_page.dart';
import 'package:readyplates_restaurants/src/screens/onboarding_page1.dart';
import 'package:readyplates_restaurants/src/screens/onboarding_page2.dart';
import 'package:readyplates_restaurants/src/screens/onboarding_page3.dart';
import 'package:readyplates_restaurants/src/staticscreens/opening_screen.dart';
import 'package:readyplates_restaurants/utils/utils.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.onboarding6Route,
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      routes: {
        "/openingscreen": (context) => SignupPage(),
        Routes.openingscreenRoute: (context) => OpeningScreen(),
        Routes.signupRoute: (context) => SignupPage(),
        Routes.loginRoute: (context) => LoginPage(),
        Routes.onboarding1Route: (context) => OnboardingPage1(),
        Routes.onboarding2Route: (context) => OnboardingPage2(),
        Routes.onboarding3Route: (context) => OnboardingPage3(),
        Routes.onboarding4Route: (context) => OnboardingPage4(),
        Routes.onboarding5Route: (context) => OnboardingPage5(),
        Routes.onboarding6Route: (context) => OnboardingPage6(),
      },
    );
  }
}
