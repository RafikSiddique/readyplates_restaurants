import 'dart:ui';

import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:readyplates_restaurants/src/home/home_controller.dart';
import 'package:readyplates_restaurants/src/onboarding/onboarding_controller.dart';
import 'package:readyplates_restaurants/src/onboarding/screens/index.dart';
import 'package:readyplates_restaurants/src/orders/order_controller.dart';
import 'package:readyplates_restaurants/src/home/screens/home_screen.dart';
import 'package:readyplates_restaurants/src/login/auth_controller.dart';
import 'package:readyplates_restaurants/src/login/screens/login_page.dart';
import 'package:readyplates_restaurants/src/login/screens/signup_page.dart';
import 'package:readyplates_restaurants/utils/fcm_service.dart';
import 'package:readyplates_restaurants/utils/my_color.dart';
import 'package:readyplates_restaurants/utils/shared_preference_helper.dart';

class OpeningScreen extends StatefulWidget {
  static const id = "/openingScreen";

  OpeningScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<OpeningScreen> createState() => _OpeningScreenState();
}

class _OpeningScreenState extends State<OpeningScreen>
    with AfterLayoutMixin<OpeningScreen> {
  final controller = PageController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      // appBar: AppBar(),
      // final push

      body: Stack(
        children: [
          Hero(
            tag: 'rpimage',
            child: Material(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/background.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          PageView(
            controller: controller,
            physics: NeverScrollableScrollPhysics(),
            children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                  height: Get.height,
                  color: Colors.white,
                  child: Align(
                    alignment: Alignment.center,
                    child: Material(
                      type: MaterialType.transparency,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 40,
                            child: Image.asset(
                              "assets/images/spoon.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(width: 16),
                          Container(
                            // width: size.width * 0.6,
                            height: 39,
                            child: RichText(
                              text: TextSpan(
                                  text: 'READY',
                                  style: GoogleFonts.montserrat(
                                    fontSize: 30,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w700,
                                    color: MyTheme.orangeColor,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: 'Plates'.toUpperCase(),
                                      style: GoogleFonts.montserrat(
                                        fontSize: 30,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w200,
                                        color: MyTheme.orangeColor,
                                      ),
                                    ),
                                  ]),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              // BackdropFilter(
              //   filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              //   child: Column(
              //     crossAxisAlignment: CrossAxisAlignment.center,
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: [
              //       Image.asset(
              //         'assets/images/spoon.png',
              //         width: MediaQuery.of(context).size.width * 0.6,
              //       ),
              //       RichText(
              //         text: TextSpan(
              //             text: 'READY',
              //             style: GoogleFonts.montserrat(
              //               fontSize: 30,
              //               fontStyle: FontStyle.normal,
              //               fontWeight: FontWeight.w700,
              //               color: MyTheme.orangeColor,
              //             ),
              //             children: [
              //               TextSpan(
              //                 text: 'Plates'.toUpperCase(),
              //                 style: GoogleFonts.montserrat(
              //                   fontSize: 30,
              //                   fontStyle: FontStyle.normal,
              //                   fontWeight: FontWeight.w200,
              //                   color: MyTheme.orangeColor,
              //                 ),
              //               ),
              //             ]),
              //       ),
              //     ],
              //   ),
              // ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 55),
                    child: Hero(
                      tag: "rp",
                      child: Material(
                        type: MaterialType.transparency,
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 40,
                              child: Image.asset(
                                "assets/images/spoon.png",
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(width: 16),
                            Container(
                              // width: size.width * 0.6,
                              height: 40,
                              child: Center(
                                child: RichText(
                                  text: TextSpan(
                                      text: 'READY',
                                      style: GoogleFonts.montserrat(
                                        fontSize: 30,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w700,
                                        color: MyTheme.orangeColor,
                                      ),
                                      children: [
                                        TextSpan(
                                          text: 'Plates'.toUpperCase(),
                                          style: GoogleFonts.montserrat(
                                            fontSize: 30,
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w200,
                                            color: MyTheme.orangeColor,
                                          ),
                                        ),
                                      ]),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 16,
                      right: 16,
                    ),
                    child: Hero(
                      tag: "login",
                      child: Material(
                        type: MaterialType.transparency,
                        child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, LoginPage.id);
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(6)),
                            child: Container(
                              width: size.width,
                              height: 54,
                              decoration: BoxDecoration(
                                color: Color(0xffF47121).withOpacity(0.15),
                              ),
                              child: Center(
                                child: BackdropFilter(
                                  filter: ImageFilter.blur(
                                    sigmaX: 6,
                                    sigmaY: 6,
                                  ),
                                  child: Text(
                                    'LOGIN',
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.inter(
                                      fontSize: 17,
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xff2F2E41),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 16,
                      right: 16,
                    ),
                    child: Hero(
                      tag: 'signup',
                      child: Material(
                        type: MaterialType.transparency,
                        child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, SignupPage.id);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xffFF7622).withOpacity(0.6),
                              // border: Border.all(
                              //   width: 1.5,
                              //   color: Color(0xffFFFFFF).withOpacity(0.5),
                              // ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(6)),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.all(
                                Radius.circular(6),
                              ),
                              child: Container(
                                width: size.width,
                                height: 54,
                                child: Center(
                                  child: BackdropFilter(
                                    filter: ImageFilter.blur(
                                      sigmaX: 4,
                                      sigmaY: 4,
                                    ),
                                    child: Text(
                                      'SIGN UP',
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.inter(
                                        fontSize: 17,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xffFFFFFF),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Future<void> afterFirstLayout(BuildContext context) async {
    final AuthController authController = Get.find<AuthController>();
    await Future.delayed(Duration(seconds: 1));
    print(authController.userId);
    try {
      await authController.getSharedPref();
      if (authController.isLoggedIn.value) {
        print("Logged In");
        Get.put(HomeController(selectedIndex: 0.obs));
        Get.put(OrderController());
        Get.offNamed(HomePage.id);
      } else {
        print("Not Logged In");
/* 
        String resId = await SharedPreferenceHelper().getRestaurantId();
/*         if (authController.userId != "-1" && resId != "" && resId != "null") {
          Get.put(HomeController(selectedIndex: 0.obs));
          Get.put(OrderController());
          Get.offNamed(HomePage.id);
        } else { */ */
        print("User Id: ${authController.userId}");
        if (authController.userId != "-1") {
          int id = await authController.getScreen(authController.userId);
          print("Screen ID $id");
          if (id >= 12) {
            await SharedPreferenceHelper().setLoggedIn(true);
final fcm = FirebaseMessagingService();
          fcm.initNotifications();
            Get.put(HomeController(selectedIndex: 0.obs));
            Get.put(OrderController());
            Get.offNamed(HomePage.id);
          } else {
            if (id <= 0) {
              controller.animateToPage(1,
                  duration: Duration(milliseconds: 500), curve: Curves.ease);
            } else {
              if (id == 1) {
                final c = Get.put(OnboardingController());

                await Geolocator.requestPermission();
                Position position = await Geolocator.getCurrentPosition();
                c.init2();
                Get.toNamed(OnboardingPage2.id,
                    arguments: LatLng(position.latitude, position.longitude));
              } else {
                Get.toNamed(authController.route(id + 1));
              }
            }
          }
          //}
        } else {
          controller.animateToPage(1,
              duration: Duration(milliseconds: 500), curve: Curves.ease);
        }
      }
    } catch (e) {
      print(e);

      controller.animateToPage(1,
          duration: Duration(milliseconds: 500), curve: Curves.ease);
    }
  }
}
