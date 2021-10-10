import 'dart:ui';

import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readyplates_restaurants/src/home/screens/home_screen.dart';
import 'package:readyplates_restaurants/src/login/auth_controller.dart';
import 'package:readyplates_restaurants/src/login/screens/login_page.dart';
import 'package:readyplates_restaurants/src/login/screens/signup_page.dart';

class OpeningScreen extends StatefulWidget {
  OpeningScreen({Key? key}) : super(key: key);

  @override
  State<OpeningScreen> createState() => _OpeningScreenState();
}

class _OpeningScreenState extends State<OpeningScreen>
    with AfterLayoutMixin<OpeningScreen> {
  final controller = PageController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(),
        body: Container(
          height: size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: PageView(
            controller: controller,
            physics: NeverScrollableScrollPhysics(),
            children: [
              BackdropFilter(
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
              SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 42, right: 43, top: 34),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            // width: 40,
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
                                        color:
                                            Color.fromRGBO(255, 255, 255, 0.9),
                                      ),
                                    ),
                                  ]),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.7,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 16,
                        right: 16,
                      ),
                      child: Material(
                        type: MaterialType.transparency,
                        child: InkWell(
                          onTap: () {
                            Get.toNamed(LoginPage.id);
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(6)),
                            child: Container(
                              width: size.width,
                              height: 54,
                              decoration: BoxDecoration(
                                // #FFFFFF
                                color: Color(0xffFFFFFF).withOpacity(0.38),
                                // color: Color.fromRGBO(255, 255, 255, 0.38),
                                // borderRadius: BorderRadius.all(Radius.circular(6)),
                              ),
                              child: Center(
                                child: BackdropFilter(
                                  filter: ImageFilter.blur(
                                    sigmaX: 17,
                                    sigmaY: 17,
                                  ),
                                  child: Text(
                                    'LOGIN',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontFamily: 'Inter',
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: -0.3,
                                      color: Color(0xff222831),
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
                      child: Material(
                        type: MaterialType.transparency,
                        child: InkWell(
                          onTap: () {
                            Get.toNamed(SignupPage.id);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xffFFFFFF).withOpacity(0.2),
                              // color: Color.fromRGBO(34, 40, 49, 0.2),
                              border: Border.all(
                                width: 1.5,
                                color: Color.fromRGBO(255, 255, 255, 0.5),
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(6)),
                            ),
                            child: ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(6)),
                              child: Container(
                                width: size.width,
                                height: 54,
                                child: Center(
                                  child: BackdropFilter(
                                    filter: ImageFilter.blur(
                                      sigmaX: 10,
                                      sigmaY: 10,
                                    ),
                                    child: Text(
                                      'SIGN UP',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 17,
                                        fontFamily: 'Inter',
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: -0.3,
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
                    SizedBox(
                      height: 25,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Future<void> afterFirstLayout(BuildContext context) async {
    final controller = Get.find<AuthController>();
    await Future.delayed(Duration(seconds: 2));
    try {
      await controller.getSharedPref();
      if (controller.isLoggedIn.value) {
        Get.offNamed(HomePage.id);
      } else {
        //if (controller.userId == "-1") {
        this.controller.animateToPage(1,
            duration: Duration(milliseconds: 500), curve: Curves.ease);
        /*  } else {
        int id = await controller.getScreen(controller.userId);
        Get.offNamed(controller.route(id));
      } */
      }
    } catch (e) {
      this.controller.animateToPage(1,
            duration: Duration(milliseconds: 500), curve: Curves.ease);
    }
  }
}
