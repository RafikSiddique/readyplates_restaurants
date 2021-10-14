import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:readyplates_restaurants/src/login/auth_controller.dart';
import 'package:get/get.dart';
import 'package:readyplates_restaurants/utils/my_color.dart';
import 'package:readyplates_restaurants/widgets/form_field.dart';

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
                AnimatedContainer(
                  duration: Duration(milliseconds: 500),
                  height: media.viewInsets.bottom == 0 ? 40 : 0,
                  margin: EdgeInsets.only(
                      left: 42,
                      right: 43,
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
                  flex: size.height > 800 ? 5 : 6,
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
                                            style: TextStyle(
                                              fontSize: 17,
                                              fontFamily: 'Inter-Bold',
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
                              hintText: "someone@example.com",
                              controller: controller.emailController,
                              fontSize: 11,
                              fontFamily: 'Inter-Bold',
                            ),
                            SizedBox(
                              height: kToolbarHeight * 0.4,
                            ),
                            AppFormField(
                              title: "Password",
                              hintText: "**** **** ****",
                              controller: controller.passwordController,
                              isPassword: true,
                              fontSize: 11,
                              line: 1,
                              matchVerification: true,
                              secondVal: controller.password2Controller,
                              fontFamily: 'Inter-Bold',
                              bottomText:
                                  'Atleast 8 characters (Caps, Small & Special Characters)',
                            ),
                            SizedBox(
                              height: kToolbarHeight * 0.4,
                            ),
                            AppFormField(
                              title: "Re-Confirm Password",
                              hintText: "**** **** ****",
                              controller: controller.password2Controller,
                              matchVerification: true,
                              secondVal: controller.passwordController,
                              isPassword: true,
                              fontSize: 11,
                              line: 1,
                              fontFamily: 'Inter-Bold',
                              bottomText: 'Please re-enter password',
                            ),
                            SizedBox(
                              height: kToolbarHeight * 0.4,
                            ),
                            InkWell(
                              onTap: () async {
                                formKey.currentState!.save();
                                if (formKey.currentState!.validate())
                                  await controller.signup();
                              },
                              child: Container(
                                width: size.width,
                                height: 54,
                                decoration: BoxDecoration(
                                  color: (controller
                                              .emailController.text.isEmpty &&
                                          controller.passwordController.text
                                              .isEmpty &&
                                          controller
                                              .password2Controller.text.isEmpty)
                                      ? MyTheme.buttonColor
                                      : MyTheme.buttonchangeColor,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(6)),
                                ),
                                child: Center(
                                  child: Text(
                                    'Verify Password',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontFamily: 'Inter-Regular',
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w600,
                                      color: MyTheme.buttontextColor,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: kToolbarHeight * 0.2,
                            ),
                            InkWell(
                              onTap: () {},
                              child: Container(
                                width: size.width,
                                height: 54,
                                decoration: BoxDecoration(
                                  color: Color(0xffF4F4F4),
                                  border: Border.all(
                                    width: 1,
                                    color: Color(0xffB9B9B9),
                                  ),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(6)),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 26.42,
                                      height: 27,
                                      child: Image.asset(
                                          'assets/images/google.png'),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Center(
                                      child: Text(
                                        'Sign up with Google',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 17,
                                          fontFamily: 'Inter-Regular',
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xff222222),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: kToolbarHeight / 2.7,
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
