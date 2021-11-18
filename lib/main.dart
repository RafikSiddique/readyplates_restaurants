import 'dart:ui';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readyplates_restaurants/src/login/auth_controller.dart';
import 'package:readyplates_restaurants/src/staticscreens/opening_screen.dart';
import 'package:readyplates_restaurants/utils/fcm_service.dart';
import 'package:readyplates_restaurants/utils/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:readyplates_restaurants/utils/shared_preference_helper.dart';
import 'package:readyplates_restaurants/utils/slider_track_shape.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Get.put(SharedPreferenceHelper());
  Get.put(AuthController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key) {
    FirebaseMessagingService();
  }

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
