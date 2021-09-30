import 'package:flutter/material.dart';
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
      },
    );
  }
}
