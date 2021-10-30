import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readyplates_restaurants/src/home/screens/order_complete_page2.dart';
import 'package:readyplates_restaurants/utils/my_color.dart';
import 'package:readyplates_restaurants/widgets/onboardingbutton.dart';

class CustomerOtpVerify extends StatelessWidget {
  static const id = "/verify";
  const CustomerOtpVerify({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.backgroundColor,
      // appBar: AppBar(
      //   backgroundColor: MyTheme.appbackgroundColor,
      //   elevation: 0,
      //   centerTitle: true,
      //   title: Text(
      //     'Customer Verification',
      //     style: GoogleFonts.inter(
      //       fontStyle: FontStyle.normal,
      //       fontWeight: FontWeight.w500,
      //       fontSize: 17,
      //       color: MyTheme.appbartextColor,
      //     ),
      //   ),
      // ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 3),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.8,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 4),
                blurRadius: 4,
                spreadRadius: 0,
                color: Color(0xffBCCAE0).withOpacity(0.4),
              )
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 30),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  InkWell(
                    onTap: () {},
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.4,
                      // width: MediaQuery.of(context).size.width * 0.7,
                      child: Image(
                        image: AssetImage('assets/images/otpverify.png'),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 250,
                    child: Text(
                        "Enter PIN sent to customer to complete verification",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inter(
                          textStyle: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.normal,
                            fontStyle: FontStyle.normal,
                            color: MyTheme.textColor,
                          ),
                        )),
                  ),
                  SizedBox(
                    height: 13,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (var i = 0;
                          i < 4;
                          //  controller.otpFields.length;
                          i++)
                        Container(
                          width: 40,
                          height: 45,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: Colors.white,
                            border: Border.all(
                              width: 1,
                              color: Color(0xff71757B),
                            ),
                          ),
                          margin: EdgeInsets.all(8),
                          child: TextField(
                            textAlign: TextAlign.center,
                            style: GoogleFonts.montserrat(
                              fontStyle: FontStyle.normal,
                              fontSize: 24,
                              color: Colors.red,
                              fontWeight: FontWeight.w600,
                            ),
                            // controller: controller.otpText[i],
                            textAlignVertical: TextAlignVertical.bottom,
                            // focusNode:
                            //     controller.otpFields[i],
                            maxLength: 1,
                            // inputFormatters: [
                            //   FilteringTextInputFormatter
                            //       .digitsOnly,
                            // ],
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              counterText: "",
                              hintText: (i + 1).toString(),
                              hintStyle: GoogleFonts.montserrat(
                                fontStyle: FontStyle.normal,
                                color: MyTheme.text1Color,
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                            ),
                            onChanged: (value) {
                              // if (value.length == 1) {
                              //   controller.otp.value += value;
                              //   if (i != 5)
                              //     controller.otpFields[i + 1]
                              //         .requestFocus();
                              // } else {
                              //   if (i != 0) {
                              //     controller.otp.value =
                              //         controller.otp.value
                              //             .substring(0, i);
                              //     controller.otpFields[i - 1]
                              //         .requestFocus();
                              //   }
                              // }
                            },
                          ),
                        ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    width: 250,
                    child: Text("OTP Verified",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inter(
                          textStyle: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            fontStyle: FontStyle.normal,
                            color: MyTheme.doneiconColor,
                          ),
                        )),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  OnboardingButton(
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 2),
                        blurRadius: 4,
                        spreadRadius: 0,
                        color: Color(0xff000000).withOpacity(0.25),
                      )
                    ],
                    fontWeight: FontWeight.bold,
                    onTap: () {
                      Navigator.pushNamed(context, OrderCompletePage2.id);
                    },
                    buttonbackgroundColor: MyTheme.text1Color,
                    text: 'Confirm',
                    buttontextColor: MyTheme.appbackgroundColor,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
