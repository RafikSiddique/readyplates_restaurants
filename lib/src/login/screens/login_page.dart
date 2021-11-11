import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readyplates_restaurants/src/login/auth_controller.dart';
import 'package:readyplates_restaurants/utils/my_color.dart';
import 'package:readyplates_restaurants/widgets/form_field.dart';
import 'package:readyplates_restaurants/widgets/onboardingbutton.dart';

class LoginPage extends StatefulWidget {
  static const id = "/login";
  final bool isChangePassword;
  const LoginPage({Key? key, this.isChangePassword = true}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final controller = Get.find<AuthController>();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  void initState() {
    controller.email.addListener(() {
      setState(() {});
    });
    controller.password.addListener(() {
      setState(() {});
    });

    super.initState();
  }

  // @override
  // void dispose() {
  //   controller.email.dispose();
  //   controller.password.dispose();

  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/loginimg.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 42, right: 43, top: 50),
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
                  Spacer(),
                  Container(
                    width: size.width,
                    decoration: BoxDecoration(
                      color: Color(0xffFFFFFF),
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(36),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16, right: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(top: kToolbarHeight / 3),
                            child: Row(
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
                                    tag: "login",
                                    child: Card(
                                      elevation: 0,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          'Login',
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
                            hintText: "Registered E-Mail ID",
                            fontSize: 13,
                            inputType: TextInputType.text,
                            controller: controller.email,
                          ),
                          SizedBox(
                            height: kToolbarHeight * 0.4,
                          ),
                          AppFormField(
                            title: "Password",
                            hintText: "** ** **",
                            line: 1,
                            fontSize: 13,
                            controller: controller.password,
                            isPassword: true,
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'Forgot Password ?',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.inter(
                                  decoration: TextDecoration.underline,
                                  fontSize: 10,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.normal,
                                  color: MyTheme.starColor,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: kToolbarHeight * 0.4,
                          ),
                          OnboardingButton(
                            height: 54,
                            onTap: () async {
                              formKey.currentState!.save();
                              if (formKey.currentState!.validate())
                                await controller.login(widget.isChangePassword);
                            },
                            buttonbackgroundColor:
                                (controller.email.text.isEmpty ||
                                        controller.password.text.isEmpty)
                                    ? MyTheme.buttonColor
                                    : MyTheme.buttonchangeColor,
                            text: 'Verify Password',
                            buttontextColor: (controller.email.text.isEmpty ||
                                    controller.password.text.isEmpty)
                                ? MyTheme.buttontextColor
                                : MyTheme.buttontextchangeColor,
                          ),
                          SizedBox(
                            height: kToolbarHeight * 0.15,
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
                                    child:
                                        Image.asset('assets/images/google.png'),
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
                            height: 10,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
