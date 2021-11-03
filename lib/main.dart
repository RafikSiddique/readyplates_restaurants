import 'dart:ui';

import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readyplates_restaurants/src/home/home_controller.dart';
import 'package:readyplates_restaurants/src/home/screens/add_food_item.dart';
import 'package:readyplates_restaurants/src/home/screens/customer_otp_verify_page.dart';
import 'package:readyplates_restaurants/src/home/screens/feedback_page.dart';
import 'package:readyplates_restaurants/src/home/screens/home_screen.dart';
import 'package:readyplates_restaurants/src/home/screens/order_complete_page1.dart';
import 'package:readyplates_restaurants/src/home/screens/order_complete_page2.dart';
import 'package:readyplates_restaurants/src/home/screens/order_complete_page3.dart';
import 'package:readyplates_restaurants/src/home/screens/performance_page.dart';
import 'package:readyplates_restaurants/src/login/auth_controller.dart';
import 'package:readyplates_restaurants/src/login/screens/changepassword_page.dart';
import 'package:readyplates_restaurants/src/login/screens/changepassword_page1.dart';
import 'package:readyplates_restaurants/src/onboarding/onboarding_controller.dart';
import 'package:readyplates_restaurants/src/login/screens/login_page.dart';
import 'package:readyplates_restaurants/src/login/screens/signup_page.dart';
import 'package:readyplates_restaurants/src/onboarding/screens/index.dart';
import 'package:readyplates_restaurants/src/staticscreens/opening_screen.dart';
import 'package:readyplates_restaurants/utils/shared_preference_helper.dart';
import 'package:readyplates_restaurants/utils/slider_track_shape.dart';
import 'package:readyplates_restaurants/utils/utils.dart';

import 'src/login/screens/signup_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(SharedPreferenceHelper());
  Get.put(OnboardingController());
  Get.put(AuthController());
  Get.put(HomeController());
  runApp(MyApp(
    key: null,
  ));
}

//This is a comment in main file
//this i s ononther change
class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.teal,
          sliderTheme:
              SliderThemeData(trackHeight: 8, trackShape: CustomTrackShape()),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            selectedLabelStyle: TextStyle(
              fontSize: 13,
              fontFamily: 'Inter',
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.normal,
            ),
            selectedItemColor: Color(0xff00ADB5).withOpacity(0.7),
            unselectedItemColor: Color(0xff393E46),
            unselectedLabelStyle: TextStyle(
              fontSize: 13,
              fontFamily: 'Inter',
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.normal,
            ),
          ),
          pageTransitionsTheme: PageTransitionsTheme(builders: {
            TargetPlatform.android: CupertinoPageTransitionsBuilder()
          })),
      // home: OpeningScreen(),
      initialRoute: FeedbackPage.id,
      routes: {
        Routes.openingscreenRoute: (context) => OpeningScreen(),
        HomePage.id: (context) => HomePage(),
        SignupPage.id: (context) => SignupPage(),
        LoginPage.id: (context) => LoginPage(),
        OrderCompletePage3.id: (context) => OrderCompletePage3(),
        FeedbackPage.id: (context) => FeedbackPage(),
        PerformancePage.id: (context) => PerformancePage(),
        ChangePasswordPage.id: (context) => ChangePasswordPage(),
        ChangePasswordPage1.id: (context) => ChangePasswordPage1(),
        RouteToScreen.id: (context) => RouteToScreen(),
        AddFoodItem.id: (context) => AddFoodItem(),
        OnboardingPage1.id: (context) => OnboardingPage1(),
        OnboardingPage2.id: (context) => OnboardingPage2(),
        OnboardingPage3.id: (context) => OnboardingPage3(),
        OnboardingPage4.id: (context) => OnboardingPage4(),
        OnboardingPage5.id: (context) => OnboardingPage5(),
        OnboardingPage6.resId: (context) => OnboardingPage6(),
        OnboardingPage7.resId: (context) => OnboardingPage7(),
      },
    );
  }
}

class RouteToScreen extends StatefulWidget {
  static const id = "/routes";
  RouteToScreen({Key? key}) : super(key: key);

  @override
  State<RouteToScreen> createState() => _RouteToScreenState();
}

class _RouteToScreenState extends State<RouteToScreen>
    with AfterLayoutMixin<RouteToScreen> {
  final AuthController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage(
            'assets/images/background.png',
          ),
          fit: BoxFit.cover,
        )),
        alignment: Alignment.center,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/spoon.png',
                width: MediaQuery.of(context).size.width * 0.6,
              ),
              RichText(
                text: TextSpan(
                    text: 'READY',
                    style: TextStyle(
                      fontSize: 30,
                      letterSpacing: -0.0769231,
                      fontFamily: 'Montserrat',
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(255, 255, 255, 0.9),
                    ),
                    children: [
                      TextSpan(
                        text: ' Plates'.toUpperCase(),
                        style: TextStyle(
                          fontSize: 30,
                          fontFamily: 'Montserrat',
                          letterSpacing: -0.0769231,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.normal,
                          color: Color.fromRGBO(255, 255, 255, 0.9),
                        ),
                      ),
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void afterFirstLayout(BuildContext context) async {
    await Future.delayed(Duration(seconds: 2));
    await controller.getSharedPref();
    if (controller.isLoggedIn.value) {
      Get.offNamed(HomePage.id);
    } else {
      //if (controller.userId == "-1") {
      Get.offNamed(Routes.openingscreenRoute);
      /*  } else {
        int id = await controller.getScreen(controller.userId);
        Get.offNamed(controller.route(id));
      } */
    }
  }
}
