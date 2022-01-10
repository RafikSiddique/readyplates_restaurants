import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readyplates_restaurants/src/login/auth_controller.dart';
import 'package:get/get.dart';
import 'package:readyplates_restaurants/utils/my_color.dart';
import 'package:readyplates_restaurants/widgets/form_field.dart';
import 'package:readyplates_restaurants/widgets/onboardingbutton.dart';

class SignupPage extends StatefulWidget {
  static const id = "/signup";
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final controller = Get.find<AuthController>();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context);
    Size size = media.size;
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/signupimg.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Center(
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 500),
                    height: media.viewInsets.bottom == 0 ? 40 : 0,
                    margin: EdgeInsets.only(
                        top: media.viewInsets.bottom == 0 ? 50 : 0),
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
                                    style: GoogleFonts.montserrat(
                                      fontSize: 30,
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromRGBO(255, 255, 255, 0.9),
                                    ),
                                    children: [
                                      TextSpan(
                                        text: ' Plates'.toUpperCase(),
                                        style: GoogleFonts.montserrat(
                                          fontSize: 30,
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.normal,
                                          color: Color.fromRGBO(
                                              255, 255, 255, 0.9),
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
                SizedBox(
                  height:
                      media.viewInsets.bottom == 0 ? kToolbarHeight / 1.5 : 0,
                ),
                Spacer(
                  flex: media.viewInsets.bottom == 0
                      ? size.height > 800
                          ? 3
                          : 1
                      : 1,
                ),
                Expanded(
                  flex: Platform.isAndroid
                      ? size.height > 800
                          ? 4
                          : 6
                      : 6,
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    width: size.width,
                    decoration: BoxDecoration(
                        color: Color(0xffFFFFFF),
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(36))),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16, right: 16),
                      child: SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: size.width,
                              padding:
                                  EdgeInsets.only(top: size.height * 0.015),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: IconButton(
                                        iconSize: 14.83,
                                        icon: FaIcon(
                                          FontAwesomeIcons.chevronLeft,
                                          color: MyTheme.iconColor,
                                        ),
                                        onPressed: () {
                                          Get.back();
                                        },
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.center,
                                    child: Hero(
                                      tag: "signup",
                                      child: Card(
                                        elevation: 0,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            'Sign-up',
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.inter(
                                              fontSize: 17,
                                              fontWeight: FontWeight.w500,
                                              fontStyle: FontStyle.normal,
                                              color: MyTheme.appbartextColor,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Spacer(),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: kToolbarHeight * 0.4,
                            ),
                            AppFormField(
                              title: "Email Address",
                              hintText: "Eg aatef.sayyed@fladdra.com",
                              controller: controller.email,
                              isEmail: true,
                              fontSize: 13,
                            ),
                            SizedBox(
                              height: kToolbarHeight * 0.4,
                            ),
                            AppFormField(
                              title: "Password",
                              hintText: "**** **** ****",
                              controller: controller.password,
                              isPassword: true,
                              fontSize: 13,
                              line: 1,
                              matchVerification: true,
                              secondVal: controller.password2,
                              bottomText:
                                  'Atleast 8 characters (Caps, Small & Special Characters)',
                            ),
                            SizedBox(
                              height: kToolbarHeight * 0.4,
                            ),
                            AppFormField(
                              title: "Re-Confirm Password",
                              hintText: "**** **** ****",
                              controller: controller.password2,
                              matchVerification: true,
                              secondVal: controller.password,
                              isPassword: true,
                              fontSize: 13,
                              line: 1,
                              bottomText: 'Please re-enter password',
                            ),
                            SizedBox(
                              height: kToolbarHeight * 0.4,
                            ),
                            AnimatedBuilder(
                                animation: Listenable.merge([
                                  controller.email,
                                  controller.password,
                                  controller.password2
                                ]),
                                builder: (context, child) {
                                  return OnboardingButton(
                                    height: 54,
                                    onTap: () async {
                                      formKey.currentState!.save();
                                      if (formKey.currentState!.validate())
                                        await controller.signup();
                                    },
                                    buttonbackgroundColor: (controller
                                                .email.text.isEmpty ||
                                            controller.password.text.isEmpty ||
                                            controller.password2.text.isEmpty)
                                        ? MyTheme.buttonColor
                                        : MyTheme.text1Color,
                                    text: 'Sign Up',
                                    buttontextColor: (controller
                                                .email.text.isEmpty ||
                                            controller.password.text.isEmpty ||
                                            controller.password2.text.isEmpty)
                                        ? MyTheme.buttontextColor
                                        : MyTheme.appbackgroundColor,
                                  );
                                }),
                            SizedBox(
                              height: Get.height * 0.01,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
