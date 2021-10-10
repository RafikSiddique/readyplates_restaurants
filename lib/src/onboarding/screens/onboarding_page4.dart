import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:readyplates_restaurants/src/onboarding/onboarding_controller.dart';
import 'package:readyplates_restaurants/widgets/field_title.dart';

class OnboardingPage4 extends StatefulWidget {
  const OnboardingPage4({Key? key}) : super(key: key);

  @override
  State<OnboardingPage4> createState() => _OnboardingPage4State();
}

class _OnboardingPage4State extends State<OnboardingPage4> {
  final controller = Get.find<OnboardingController>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 44,
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
              iconSize: 14.83,
              icon: FaIcon(
                FontAwesomeIcons.chevronLeft,
                color: Color(0xff000000),
              ),
              onPressed: () {
                Get.back();
              }),
          centerTitle: true,
          title: Text(
            'Partner Onboarding',
            style: TextStyle(
              fontSize: 17,
              fontFamily: 'Inter',
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w500,
              letterSpacing: -0.226667,
              color: Color(0xff393E46),
            ),
          ),
        ),
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 29,
                ),
                RichText(
                  text: TextSpan(
                      text: 'Type of Establishment',
                      style: TextStyle(
                        fontSize: 13,
                        fontFamily: 'Inter',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500,
                        letterSpacing: -0.229412,
                        color: Color(0xff2F2E41),
                      ),
                      children: [
                        TextSpan(
                          text: ' *',
                          style: TextStyle(
                            fontSize: 13,
                            fontFamily: 'Inter',
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w500,
                            letterSpacing: -0.229412,
                            color: Color(0xffEB4132),
                          ),
                        ),
                      ]),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  // width: 341,
                  height: 45,
                  child: DropdownButtonFormField<String>(
                    icon: Padding(
                      padding: const EdgeInsets.only(right: 8.17),
                      child: FaIcon(
                        FontAwesomeIcons.chevronDown,
                        color: Color(0xff000000),
                        size: 14.87,
                      ),
                    ),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1,
                          color: Color(0xffE0E0E0),
                          style: BorderStyle.solid,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(6.0),
                        ),
                      ),
                      hintText: 'Dineout only / Dineout & Delivery Both',
                      contentPadding: EdgeInsets.only(
                        left: 14,
                        top: 14,
                      ),
                      hintStyle: TextStyle(
                        fontSize: 15,
                        fontFamily: 'Inter',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500,
                        letterSpacing: -0.264706,
                        color: Color(0xff979797).withOpacity(0.7),
                      ),
                    ),
                    items: controller.typeOfEsts
                        .map(
                          (e) => DropdownMenuItem(child: Text(e), value: e),
                        )
                        .toList(),
                    // value: controller.typeOfEstablishment.value,
                    onChanged: (newValue) {
                      controller.typeOfEstablishment.value = newValue!;
                    },
                  ),
                ),
                SizedBox(
                  height: 29,
                ),
                RichText(
                  text: TextSpan(
                    text: 'Type of Cuisines',
                    style: TextStyle(
                      fontSize: 13,
                      fontFamily: 'Inter',
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w500,
                      letterSpacing: -0.229412,
                      color: Color(0xff2F2E41),
                    ),
                    children: [
                      TextSpan(
                        text: ' *',
                        style: TextStyle(
                          fontSize: 13,
                          fontFamily: 'Inter',
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w500,
                          letterSpacing: -0.229412,
                          color: Color(0xffEB4132),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15.05,
                ),
                Obx(
                  () => Wrap(
                    direction: Axis.horizontal,
                    children: [
                      ...controller.selectCategory
                          //      .sublist(0, 6)
                          .map((category) => Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    child: Checkbox(
                                      checkColor: Colors.white,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          side: BorderSide(
                                            color: Color(0xffE0E0E0),
                                            width: 1,
                                            style: BorderStyle.solid,
                                          )),
                                      value: controller.chooseCategory
                                          .contains(category),
                                      onChanged: (value) {
                                        if (controller.chooseCategory
                                            .contains(category)) {
                                          controller.chooseCategory
                                              .remove(category);
                                        } else {
                                          controller.chooseCategory
                                              .add(category);
                                        }
                                        setState(() {
                                          controller.isChecked = value!;
                                        });
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Container(
                                    width: size.width * 0.15,
                                    alignment: Alignment.centerLeft,
                                    child: FittedBox(
                                      fit: BoxFit.scaleDown,
                                      child: Text(
                                        category,
                                        style: TextStyle(
                                          fontSize: 13,
                                          fontFamily: 'Inter',
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.normal,
                                          letterSpacing: -0.264706,
                                          color: Color(0xff2F2E41)
                                              .withOpacity(0.7),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ))
                          .toList(),
                    ],
                  ),
                ),
                SizedBox(
                  height: 9.95,
                ),
                Text(
                  '* Select 2 cusinies which constitute majority of your menu',
                  style: TextStyle(
                    fontSize: 9,
                    fontFamily: 'Poppins',
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.normal,
                    letterSpacing: -0.229412,
                    color: Color(0xffEB4132),
                  ),
                ),
                SizedBox(
                  height: 29,
                ),
                RichText(
                  text: TextSpan(
                    text: 'Restaurant Operational Hours',
                    style: TextStyle(
                      fontSize: 13,
                      fontFamily: 'Inter',
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w500,
                      letterSpacing: -0.229412,
                      color: Color(0xff2F2E41),
                    ),
                    children: [
                      TextSpan(
                        text: ' *',
                        style: TextStyle(
                          fontSize: 13,
                          fontFamily: 'Inter',
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w500,
                          letterSpacing: -0.229412,
                          color: Color(0xffEB4132),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Obx(
                  () => Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(6)),
                                border: Border.all(
                                  width: 1,
                                  color: Color(0xffE0E0E0),
                                  style: BorderStyle.solid,
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8),
                                    child: Text(
                                      (controller.startHour.toString().length ==
                                                  1
                                              ? controller.startHour
                                                  .toString()
                                                  .padLeft(2, "0")
                                              : controller.startHour
                                                  .toString()) +
                                          ":" +
                                          (controller.startMinute
                                                      .toString()
                                                      .length ==
                                                  1
                                              ? controller.startMinute
                                                  .toString()
                                                  .padLeft(2, "0")
                                              : controller.startMinute
                                                  .toString()),
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontFamily: 'Inter',
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w500,
                                        letterSpacing: -0.264706,
                                        color:
                                            Color(0xff979797).withOpacity(0.7),
                                      ),
                                    ),
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SizedBox.square(
                                        dimension: 15,
                                        child: InkWell(
                                          onTap: () {
                                            if (controller.startMinute == 30) {
                                              if (controller.startHour != 12) {
                                                controller.startHour + 1;
                                              }
                                              controller.startMinute.value = 00;
                                            } else {
                                              if (controller.startHour != 12)
                                                controller.startMinute.value =
                                                    30;
                                            }
                                          },
                                          child: Container(
                                            height: 20,
                                            width: 20,
                                            alignment: Alignment.center,
                                            child: FaIcon(
                                              FontAwesomeIcons.chevronUp,
                                              color: Color(0xff6E6D7A),
                                              size: 15,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox.square(
                                        dimension: 15,
                                        child: InkWell(
                                          onTap: () {
                                            if (controller.startMinute == 30) {
                                              controller.startMinute.value = 00;
                                            } else {
                                              if (controller.startHour != 0) {
                                                controller.startMinute.value =
                                                    30;
                                                controller.startHour - 1;
                                              }
                                            }
                                          },
                                          child: Container(
                                            height: 20,
                                            width: 20,
                                            alignment: Alignment.center,
                                            child: FaIcon(
                                              FontAwesomeIcons.chevronDown,
                                              color: Color(0xff6E6D7A),
                                              size: 15,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    height: 35,
                                    width: 0,
                                    decoration: BoxDecoration(
                                      color: Color(0xffE0E0E0),
                                      border: Border.all(
                                        width: 1,
                                        color: Color(0xffE0E0E0),
                                        style: BorderStyle.solid,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 19,
                                    child: Text(
                                      controller.startAmPm.value,
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontFamily: 'Inter',
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w500,
                                        letterSpacing: -0.264706,
                                        color:
                                            Color(0xff979797).withOpacity(0.7),
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                      child: Container(
                                        padding:
                                            EdgeInsets.only(bottom: 4, top: 4),
                                        child: FaIcon(
                                          controller.startAmPm.value == "AM"
                                              ? FontAwesomeIcons.chevronDown
                                              : FontAwesomeIcons.chevronUp,
                                          size: 13,
                                          color: Color(0xff6E6D7A),
                                        ),
                                      ),
                                      onTap: () {
                                        if (controller.startAmPm.value ==
                                            "AM") {
                                          controller.startAmPm.value = "PM";
                                        } else {
                                          controller.startAmPm.value = "AM";
                                        }
                                      }),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Text(
                              'Select start time (hh:mm AM/PM)',
                              style: TextStyle(
                                fontSize: 9,
                                fontFamily: 'Poppins',
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.normal,
                                letterSpacing: -0.229412,
                                color: Color(0xff6E6D7A),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 18,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(6)),
                                border: Border.all(
                                  width: 1,
                                  color: Color(0xffE0E0E0),
                                  style: BorderStyle.solid,
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    (controller.endHour.toString().length == 1
                                            ? controller.endHour
                                                .toString()
                                                .padLeft(2, "0")
                                            : controller.endHour.toString()) +
                                        ":" +
                                        (controller.endMinute
                                                    .toString()
                                                    .length ==
                                                1
                                            ? controller.endMinute
                                                .toString()
                                                .padLeft(2, "0")
                                            : controller.endMinute.toString()),
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: 'Inter',
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: -0.264706,
                                      color: Color(0xff979797).withOpacity(0.7),
                                    ),
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SizedBox.square(
                                        dimension: 15,
                                        child: InkWell(
                                          onTap: () {
                                            if (controller.endMinute == 30) {
                                              if (controller.endHour != 12) {
                                                controller.endHour + 1;
                                              }
                                              controller.endMinute.value = 00;
                                            } else {
                                              controller.endMinute.value = 30;
                                            }
                                          },
                                          child: Container(
                                            height: 20,
                                            width: 20,
                                            alignment: Alignment.center,
                                            child: FaIcon(
                                              FontAwesomeIcons.chevronUp,
                                              color: Color(0xff6E6D7A),
                                              size: 15,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox.square(
                                        dimension: 15,
                                        child: InkWell(
                                          onTap: () {
                                            if (controller.endMinute == 30) {
                                              controller.endMinute.value = 00;
                                            } else {
                                              if (controller.endHour != 0) {
                                                controller.endMinute.value = 30;
                                                controller.endHour - 1;
                                              }
                                            }
                                          },
                                          child: Container(
                                            height: 20,
                                            width: 20,
                                            alignment: Alignment.center,
                                            child: FaIcon(
                                              FontAwesomeIcons.chevronDown,
                                              color: Color(0xff6E6D7A),
                                              size: 15,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    height: 35,
                                    width: 0,
                                    decoration: BoxDecoration(
                                      color: Color(0xffE0E0E0),
                                      border: Border.all(
                                        width: 1,
                                        color: Color(0xffE0E0E0),
                                        style: BorderStyle.solid,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 19,
                                    child: Text(
                                      controller.endAmPm.value,
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontFamily: 'Inter',
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w500,
                                        letterSpacing: -0.264706,
                                        color:
                                            Color(0xff979797).withOpacity(0.7),
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                      child: Container(
                                        padding:
                                            EdgeInsets.only(bottom: 4, top: 4),
                                        child: FaIcon(
                                          controller.endAmPm.value == "AM"
                                              ? FontAwesomeIcons.chevronDown
                                              : FontAwesomeIcons.chevronUp,
                                          size: 13,
                                          color: Color(0xff6E6D7A),
                                        ),
                                      ),
                                      onTap: () {
                                        if (controller.endAmPm.value == "AM") {
                                          controller.endAmPm.value = "PM";
                                        } else {
                                          controller.endAmPm.value = "AM";
                                        }
                                      }),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Text(
                              'Select end time (hh:mm AM/PM)',
                              style: TextStyle(
                                fontSize: 9,
                                fontFamily: 'Poppins',
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.normal,
                                letterSpacing: -0.229412,
                                color: Color(0xff6E6D7A),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 29,
                ),
                FieldTitle(
                  text: 'Restaurant Operational Days',
                ),
                SizedBox(
                  height: 15,
                ),
                Obx(
                  () => Wrap(
                    direction: Axis.horizontal,
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /*     Column(
                        children: [ */
                      ...controller.selectDays
                          //.sublist(0, 3)
                          .map((days) => Container(
                                width: size.width * 0.29,
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Checkbox(
                                      checkColor: Colors.white,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          side: BorderSide(
                                            color: Color(0xffE0E0E0),
                                            width: 1,
                                            style: BorderStyle.solid,
                                          )),
                                      value:
                                          controller.chooseDays.contains(days),
                                      onChanged: (value) {
                                        if (controller.chooseDays
                                            .contains(days)) {
                                          controller.chooseDays.remove(days);
                                        } else {
                                          controller.chooseDays.add(days);
                                        }
                                      },
                                    ),
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      width: size.width * 0.15,
                                      child: FittedBox(
                                        fit: BoxFit.scaleDown,
                                        child: Text(
                                          days,
                                          style: TextStyle(
                                            fontSize: 13,
                                            fontFamily: 'Inter',
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.normal,
                                            letterSpacing: -0.264706,
                                            color: Color(0xff2F2E41)
                                                .withOpacity(0.7),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ))
                          .toList(),
                    ],
                  ),
                  /* Column(
                        children: [
                          ...controller.selectDays
                              .sublist(3, 5)
                              .map((days) => Row(
                                    children: [
                                      Checkbox(
                                        checkColor: Colors.white,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            side: BorderSide(
                                              color: Color(0xffE0E0E0),
                                              width: 1,
                                              style: BorderStyle.solid,
                                            )),
                                        value: controller.chooseDays
                                            .contains(days),
                                        onChanged: (value) {
                                          if (controller.chooseDays
                                              .contains(days)) {
                                            controller.chooseDays.remove(days);
                                          } else {
                                            controller.chooseDays.add(days);
                                          }
                                        },
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        width: 85,
                                        child: Text(
                                          days,
                                          style: TextStyle(
                                            fontSize: 13,
                                            fontFamily: 'Inter',
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.normal,
                                            letterSpacing: -0.264706,
                                            color: Color(0xff2F2E41)
                                                .withOpacity(0.7),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ))
                              .toList(),
                        ], */
                ),
                /* Column(
                        children: [
                          ...controller.selectDays
                              .sublist(5, 7)
                              .map((days) => Row(
                                    children: [
                                      Checkbox(
                                        checkColor: Colors.white,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            side: BorderSide(
                                              color: Color(0xffE0E0E0),
                                              width: 1,
                                              style: BorderStyle.solid,
                                            )),
                                        value: controller.chooseDays
                                            .contains(days),
                                        onChanged: (value) {
                                          if (controller.chooseDays
                                              .contains(days)) {
                                            controller.chooseDays.remove(days);
                                          } else {
                                            controller.chooseDays.add(days);
                                          }
                                        },
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        width: 85,
                                        child: Text(
                                          days,
                                          style: TextStyle(
                                            fontSize: 13,
                                            fontFamily: 'Inter',
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.normal,
                                            letterSpacing: -0.264706,
                                            color: Color(0xff2F2E41)
                                                .withOpacity(0.7),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ))
                              .toList(),
                        ],
                      ), */
                // ],
                //),
                //),
                SizedBox(
                  height: 29,
                ),
                InkWell(
                  onTap: () {
                    controller.onboardingapi4();
                  },
                  child: Container(
                    // width: 343,
                    height: 40.11,
                    decoration: BoxDecoration(
                      color: Color(0xff7A7E83),
                      borderRadius: BorderRadius.all(Radius.circular(6)),
                    ),
                    child: Center(
                      child: Text(
                        'CONTINUE',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          letterSpacing: -0.28,
                          color: Color(0xffE5E5E5),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5.89,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
