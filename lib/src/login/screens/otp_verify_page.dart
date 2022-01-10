import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readyplates_restaurants/src/login/auth_controller.dart';
import 'package:readyplates_restaurants/src/login/auth_services.dart';
import 'package:readyplates_restaurants/src/login/screens/changepassword_page1.dart';
import 'package:readyplates_restaurants/utils/my_color.dart';
import 'package:readyplates_restaurants/widgets/onboardingbutton.dart';

class VerifyOtpPage extends StatefulWidget {
  static const id = "/verifyotp";
  const VerifyOtpPage({Key? key}) : super(key: key);

  @override
  State<VerifyOtpPage> createState() => _VerifyOtpPageState();
}

class _VerifyOtpPageState extends State<VerifyOtpPage> {
  final controller = Get.find<AuthController>();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  int j = 0;

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
                                    tag: "OTP Verification",
                                    child: Card(
                                      elevation: 0,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          "OTP Verification",
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
                          Align(
                            alignment: Alignment.center,
                            child: Container(
                              width: 200,
                              child: Text(
                                "Enter OTP sent on registered email to proceed further",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.inter(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FontStyle.normal,
                                  color: MyTheme.chevrondowncolor,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              for (var i = 0;
                                  i < controller.otpFields.length;
                                  i++)
                                Container(
                                  width: 38,
                                  height: 50,
                                  margin: EdgeInsets.all(8),
                                  child: TextField(
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.montserrat(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600),
                                    controller: controller.otpText[i],
                                    textAlignVertical: TextAlignVertical.bottom,
                                    focusNode: controller.otpFields[i],
                                    maxLength: 1,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly,
                                    ],
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      counterText: "",
                                      hintText: (i + 1).toString(),
                                      hintStyle: TextStyle(
                                        color: Colors.grey.shade300,
                                      ),
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          width: 1,
                                          color: MyTheme.borderColor,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(6.0),
                                      ),
                                    ),
                                    onChanged: (value) {
                                      print(value);

                                      print(
                                          '${controller.otp} type otp isssssssssssssss');
                                      print(
                                          '${respOtp} respOtp otp isssssssssssssss');
                                      if (value.length == 1) {
                                        controller.otp += value;
                                        if (i < 5) {
                                          controller.otpFields[i + 1]
                                              .requestFocus();
                                        } else {
                                          if (respOtp == controller.otp) {
                                            controller.otpVerification.value =
                                                controller.otpVerified;
                                          } else {
                                            controller.otpVerification.value =
                                                controller.incorrect;
                                          }
                                        }
                                      } else {
                                        if (i != 0) {
                                          controller.otp =
                                              controller.otp.substring(0, i);
                                          controller.otpFields[i - 1]
                                              .requestFocus();
                                        } else {
                                          controller.otp = "";
                                        }
                                      }
                                    },
                                  ),
                                )
                            ],
                          ),
                          Obx(() => controller.otpVerification.value != ""
                              ? SizedBox(
                                  height: 8,
                                )
                              : Container()),
                          Obx(() => Align(
                                alignment: Alignment.center,
                                child: Text(controller.otpVerification.value,
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.inter(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FontStyle.normal,
                                      color: controller.otpVerification.value ==
                                              controller.otpVerified
                                          ? MyTheme.borderchangeColor
                                          : Colors.red,
                                    )),
                              )),
                          SizedBox(
                            height: kToolbarHeight * 0.4,
                          ),
                          AnimatedBuilder(
                              animation: Listenable.merge([
                                controller.otpText[j],
                              ]),
                              builder: (context, child) {
                                return OnboardingButton(
                                  height: 54,
                                  onTap: () async {
                                    if (controller.otpVerification.value ==
                                        controller.otpVerified) {
                                      isForgotPass = true;
                                      Get.toNamed(ChangePasswordPage1.id);
                                    }
                                  },
                                  buttonbackgroundColor:
                                      (controller.otpText[j].text.isEmpty)
                                          ? MyTheme.completeOrderTextColor
                                          : MyTheme.text1Color,
                                  text: 'CONTINUE',
                                  buttontextColor:
                                      (controller.otpText[j].text.isEmpty)
                                          ? MyTheme.appbackgroundColor
                                          : MyTheme.appbackgroundColor,
                                );
                              }),
                          SizedBox(
                            height: 16,
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
