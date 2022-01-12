import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readyplates_restaurants/models/feedback_model.dart';
import 'package:readyplates_restaurants/src/home/home_controller.dart';
import 'package:readyplates_restaurants/src/home/screens/feedback_page.dart';
import 'package:readyplates_restaurants/utils/my_color.dart';
import 'package:readyplates_restaurants/widgets/onboardingbutton.dart';
import 'package:readyplates_restaurants/widgets/perfomance_circle.dart';

class PerformancePage extends GetView<HomeController> {
  //static const id = "/performance";

  double calculateStar(double value) {
    return value.isNaN || value.isNegative || value == 0
        ? 0
        : (value * 10 / 5) / 2;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MyTheme.buttontextColor,
        body: Obx(
          () => Stack(
            children: [
              Padding(
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
                                      text: calculateStar(controller.feedbacks
                                                  .map((element) =>
                                                      double.parse(element
                                                          .overall_experience))
                                                  .toList()
                                                  .sum() /
                                              controller.feedbacks.length)
                                          .toStringAsFixed(1),
                                      value: 'OVERALL EXP',
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    PerformanceCircle(
                                      text: calculateStar(controller.feedbacks
                                                  .map((element) =>
                                                      double.parse(
                                                          element.taste))
                                                  .toList()
                                                  .sum() /
                                              controller.feedbacks.length)
                                          .toStringAsFixed(1),
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
                                      text: calculateStar(controller.feedbacks
                                                  .map((element) =>
                                                      double.parse(
                                                          element.ambience))
                                                  .toList()
                                                  .sum() /
                                              controller.feedbacks.length)
                                          .toStringAsFixed(1),
                                      value: 'AMBIENCE',
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    PerformanceCircle(
                                      text: calculateStar(controller.feedbacks
                                                  .map((element) =>
                                                      double.parse(
                                                          element.serving_time))
                                                  .toList()
                                                  .sum() /
                                              controller.feedbacks.length)
                                          .toStringAsFixed(1),
                                      value: 'SERVING TIME',
                                    )
                                  ]),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ...controller.feedbacks
                          .map((element) => FeedbackWidget(
                                feedbackModel: element,
                              ))
                          .toList(),
                      SizedBox(
                        height: 27,
                      ),
                    ],
                  ),
                ),
              ),
              if (controller.feedbackLoading.value)
                IgnorePointer(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                    child: Center(child: CircularProgressIndicator()),
                  ),
                )
            ],
          ),
        ));
  }
}

class FeedbackWidget extends StatelessWidget {
  final FeedbackModel feedbackModel;
  const FeedbackWidget({Key? key, required this.feedbackModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 7),
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
              Text("Order #${feedbackModel.order}",
                  style: GoogleFonts.inter(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.normal,
                    color: MyTheme.appbartextColor,
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
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                      fontStyle: FontStyle.normal,
                      color: MyTheme.appbartextColor,
                    )),
                Spacer(),
                Text(feedbackModel.overall_experience.toString(),
                    textAlign: TextAlign.right,
                    style: GoogleFonts.nunito(
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                      fontStyle: FontStyle.normal,
                      color: MyTheme.text2Color,
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
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                      fontStyle: FontStyle.normal,
                      color: MyTheme.appbartextColor,
                    )),
                Spacer(),
                Text(feedbackModel.taste,
                    textAlign: TextAlign.right,
                    style: GoogleFonts.nunito(
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                      fontStyle: FontStyle.normal,
                      color: MyTheme.text2Color,
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
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                      fontStyle: FontStyle.normal,
                      color: MyTheme.appbartextColor,
                    )),
                Spacer(),
                Text(feedbackModel.ambience,
                    textAlign: TextAlign.right,
                    style: GoogleFonts.nunito(
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                      fontStyle: FontStyle.normal,
                      color: MyTheme.text2Color,
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
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                      fontStyle: FontStyle.normal,
                      color: MyTheme.appbartextColor,
                    )),
                Spacer(),
                Text(feedbackModel.serving_time,
                    textAlign: TextAlign.right,
                    style: GoogleFonts.nunito(
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                      fontStyle: FontStyle.normal,
                      color: MyTheme.text2Color,
                    ))
              ],
            ),
            SizedBox(
              height: 12,
            ),
            Hero(
              tag: feedbackModel.id,
              child: OnboardingButton(
                height: 44,
                onTap: () {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) =>
                            FeedbackPage(feedbackModel: feedbackModel),
                      ));
                },
                buttonbackgroundColor: MyTheme.orangeColor,
                text: 'View Detailed Feedback',
                buttontextColor: MyTheme.appbackgroundColor,
                fontWeight: FontWeight.bold,
              ),
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

extension Operation on List<double> {
  double sum() {
    double total = 0;
    if (length == 0)
      return 0;
    else {
      forEach((element) {
        total += element;
      });
      return total;
    }
  }
}
