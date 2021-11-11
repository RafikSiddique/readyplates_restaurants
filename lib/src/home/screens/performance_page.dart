import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readyplates_restaurants/src/home/home_controller.dart';
import 'package:readyplates_restaurants/src/home/screens/feedback_page.dart';
import 'package:readyplates_restaurants/utils/my_color.dart';
import 'package:readyplates_restaurants/widgets/onboardingbutton.dart';
import 'package:readyplates_restaurants/widgets/perfomance_circle.dart';

class PerformancePage extends GetView<HomeController> {
  static const id = "/performance";
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      initState: (state) {
        controller.getFeedbacks();
      },
      builder: (_) => Scaffold(
        backgroundColor: MyTheme.backgroundColor,
        body: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 3),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 350,
                  width: MediaQuery.of(context).size.width * 2.5,
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
                    padding: const EdgeInsets.only(
                        top: 24, bottom: 24, right: 22, left: 22),
                    child: Column(
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              PerformanceCircle(
                                text: '4.1',
                                value: 'OVERALL EXP',
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              PerformanceCircle(
                                text: '3.8',
                                value: 'TASTE',
                              )
                            ]),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              PerformanceCircle(
                                text: '4.1',
                                value: 'AMBIENCE',
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              PerformanceCircle(
                                text: '4.1',
                                value: 'SERVING TIME',
                              )
                            ]),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 27,
                ),
                SizedBox(
                  height: 27,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class FeedbackWidget extends StatelessWidget {
  const FeedbackWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
        padding: const EdgeInsets.only(left: 16, right: 16, top: 13),
        child: Column(
          children: [
            Row(children: [
              Spacer(),
              Text("Order #210403AS",
                  style: GoogleFonts.inter(
                    textStyle: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                      color: MyTheme.text3Color,
                    ),
                  )),
              Spacer(),
            ]),
            SizedBox(
              height: 11,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Overall Experience",
                    style: GoogleFonts.nunitoSans(
                      textStyle: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                        fontStyle: FontStyle.normal,
                        color: MyTheme.text3Color,
                      ),
                    )),
                Spacer(),
                Text("4",
                    textAlign: TextAlign.right,
                    style: GoogleFonts.nunito(
                      textStyle: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                        fontStyle: FontStyle.normal,
                        color: MyTheme.text2Color,
                      ),
                    ))
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Taste",
                    style: GoogleFonts.nunitoSans(
                      textStyle: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                        fontStyle: FontStyle.normal,
                        color: MyTheme.text3Color,
                      ),
                    )),
                Spacer(),
                Text("3",
                    textAlign: TextAlign.right,
                    style: GoogleFonts.nunito(
                      textStyle: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                        fontStyle: FontStyle.normal,
                        color: MyTheme.text2Color,
                      ),
                    ))
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Ambience",
                    style: GoogleFonts.nunitoSans(
                      textStyle: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                        fontStyle: FontStyle.normal,
                        color: MyTheme.text3Color,
                      ),
                    )),
                Spacer(),
                Text("3",
                    textAlign: TextAlign.right,
                    style: GoogleFonts.nunito(
                      textStyle: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                        fontStyle: FontStyle.normal,
                        color: MyTheme.text2Color,
                      ),
                    ))
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Serving time",
                    style: GoogleFonts.nunitoSans(
                      textStyle: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                        fontStyle: FontStyle.normal,
                        color: MyTheme.text3Color,
                      ),
                    )),
                Spacer(),
                Text("5",
                    textAlign: TextAlign.right,
                    style: GoogleFonts.nunito(
                      textStyle: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                        fontStyle: FontStyle.normal,
                        color: MyTheme.text2Color,
                      ),
                    ))
              ],
            ),
            SizedBox(
              height: 12,
            ),
            OnboardingButton(
              height: 44,
              onTap: () {
                Navigator.pushNamed(context, FeedbackPage.id);
              },
              buttonbackgroundColor: MyTheme.text1Color,
              text: 'View Detailed Feedback',
              buttontextColor: MyTheme.appbackgroundColor,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(
              height: 16,
            ),
          ],
        ),
      ),
    );
  }
}
