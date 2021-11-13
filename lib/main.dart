import 'dart:ui';

import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readyplates_restaurants/src/login/auth_controller.dart';
import 'package:readyplates_restaurants/src/staticscreens/opening_screen.dart';
import 'package:readyplates_restaurants/utils/routes.dart';
import 'package:readyplates_restaurants/utils/shared_preference_helper.dart';
import 'package:readyplates_restaurants/utils/slider_track_shape.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(SharedPreferenceHelper());
  Get.put(AuthController());
  runApp(MyApp());
}

//This is a comment in main file
//this i s ononther change
class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.teal,
          sliderTheme:
              SliderThemeData(trackHeight: 8, trackShape: CustomTrackShape()),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            selectedLabelStyle: GoogleFonts.inter(
              fontSize: 13,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.normal,
            ),
            selectedItemColor: Color(0xff00ADB5).withOpacity(0.7),
            unselectedItemColor: Color(0xff393E46),
            unselectedLabelStyle: GoogleFonts.inter(
              fontSize: 13,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.normal,
            ),
          ),
          pageTransitionsTheme: PageTransitionsTheme(builders: {
            TargetPlatform.android: CupertinoPageTransitionsBuilder()
          })),
      home: OpeningScreen(),
      onGenerateRoute: Routes.onGenerateRoute,
    );
  }
}
