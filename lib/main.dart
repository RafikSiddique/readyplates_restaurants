import 'package:flutter/material.dart';
import 'package:readyplates_restaurants/src/screens/signup_page1.dart';
import 'package:readyplates_restaurants/src/screens/signup_page2.dart';
import 'package:readyplates_restaurants/src/screens/signup_page3.dart';
import 'package:readyplates_restaurants/src/staticscreens/opening_screen.dart';
import 'package:readyplates_restaurants/utils/utils.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      //home:,
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.openingscreenRoute,
      routes: {
        Routes.openingscreenRoute: (context) => OpeningScreen(),
        Routes.signup1Route: (context) => SignupPage1(),
        Routes.signup2Route: (context) => SignupPage2(),
        Routes.signup3Route: (context) => SignupPage3(),
      },
    );
  }
}
