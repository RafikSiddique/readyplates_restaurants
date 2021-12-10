import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:readyplates_restaurants/src/home/screens/add_food_item.dart';
import 'package:readyplates_restaurants/src/home/screens/home_screen.dart';
import 'package:readyplates_restaurants/src/login/screens/changepassword_page1.dart';
import 'package:readyplates_restaurants/src/login/screens/login_page.dart';
import 'package:readyplates_restaurants/src/login/screens/signup_page.dart';
import 'package:readyplates_restaurants/src/onboarding/screens/index.dart';
import 'package:readyplates_restaurants/src/onboarding/screens/table_config_page.dart';
import 'package:readyplates_restaurants/src/staticscreens/opening_screen.dart';

class Routes {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) {
        switch (settings.name) {
          case OpeningScreen.id:
            return OpeningScreen();
          case HomePage.id:
            return HomePage();
          case LoginPage.id:
            if (settings.arguments != null)
              return LoginPage(
                isChangePassword: settings.arguments as bool,
              );
            else
              return LoginPage();
          case SignupPage.id:
            return SignupPage();

          case ChangePasswordPage1.id:
            return ChangePasswordPage1();
          case AddFoodItem.id:
            return AddFoodItem();
          case OnboardingPage1.id:
            return OnboardingPage1();
          case OnboardingPage2.id:
            LatLng latlang = settings.arguments as LatLng;
            return OnboardingPage2(
              latLng: latlang,
            );
          case OnboardingPage3.id:
            return OnboardingPage3();
          case OnboardingPage4.id:
            return OnboardingPage4();
          case OnboardingPage5.id:
            return OnboardingPage5();
          case OnboardingPage6.id:
            return OnboardingPage6();
          case OnboardingPage7.id:
            return OnboardingPage7();
          case OnboardingPage8.id:
            return OnboardingPage8();
          case OnboardingPage9.resId:
            return OnboardingPage9();
          case TableConfig.id:
            return TableConfig();

          default:
            return OpeningScreen();
        }
      },
    );
  }
}
