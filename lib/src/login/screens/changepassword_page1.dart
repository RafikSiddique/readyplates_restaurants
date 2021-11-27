import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readyplates_restaurants/src/login/auth_controller.dart';
import 'package:readyplates_restaurants/utils/my_color.dart';
import 'package:readyplates_restaurants/widgets/form_field.dart';
import 'package:readyplates_restaurants/widgets/onboardingbutton.dart';

class ChangePasswordPage1 extends StatefulWidget {
  static const id = "/changepasword1";
  const ChangePasswordPage1({Key? key}) : super(key: key);

  @override
  State<ChangePasswordPage1> createState() => _ChangePasswordPage1State();
}

class _ChangePasswordPage1State extends State<ChangePasswordPage1> {
  final controller = Get.find<AuthController>();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

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
                                    tag: "Change Password",
                                    child: Card(
                                      elevation: 0,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          'Change Password',
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
                            title: "New Password",
                            hintText: "**** **** ****",
                            hintfontSize: 15,
                            line: 1,
                            fontSize: 12,
                            inputType: TextInputType.text,
                            controller: controller.password,
                            isPassword: true,
                            matchVerification: true,
                            secondVal: controller.password2,
                          ),
                          SizedBox(
                            height: kToolbarHeight * 0.4,
                          ),
                          AppFormField(
                            title: "Confirm Password",
                            hintText: "**** **** ****",
                            hintfontSize: 15,
                            line: 1,
                            fontSize: 12,
                            controller: controller.password2,
                            inputType: TextInputType.text,
                            isPassword: true,
                            matchVerification: true,
                            secondVal: controller.password,
                          ),
                          SizedBox(
                            height: kToolbarHeight * 0.6,
                          ),
                          AnimatedBuilder(
                              animation: Listenable.merge([
                                controller.password,
                                controller.password2,
                              ]),
                              builder: (context, child) {
                                return OnboardingButton(
                                  height: 54,
                                  onTap: () async {
                                    formKey.currentState!.save();
                                    if (formKey.currentState!.validate())
                                      await controller.changePassword();
                                  },
                                  buttonbackgroundColor:
                                      (controller.password.text.isEmpty ||
                                              controller.password2.text.isEmpty)
                                          ? MyTheme.buttonColor
                                          : MyTheme.buttonchangeColor,
                                  text: 'Change Password',
                                  buttontextColor:
                                      (controller.password.text.isEmpty ||
                                              controller.password2.text.isEmpty)
                                          ? MyTheme.buttontextColor
                                          : MyTheme.buttontextchangeColor,
                                );
                              }),
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
