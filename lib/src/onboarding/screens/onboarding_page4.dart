import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:readyplates_restaurants/src/onboarding/onboarding_controller.dart';
import 'package:readyplates_restaurants/utils/my_color.dart';
import 'package:readyplates_restaurants/widgets/field_title.dart';
import 'package:readyplates_restaurants/widgets/onboardingWrapper.dart';

class OnboardingPage4 extends StatefulWidget {
  static const id = "/onboarding4";
  const OnboardingPage4({Key? key}) : super(key: key);

  @override
  State<OnboardingPage4> createState() => _OnboardingPage4State();
}

class _OnboardingPage4State extends State<OnboardingPage4> {
  final controller = Get.find<OnboardingController>();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return OnBoardingWrapper(
      onboardingController: controller,
      child: Scaffold(
        backgroundColor: MyTheme.appbackgroundColor,
        appBar: AppBar(
          backgroundColor: MyTheme.appbackgroundColor,
          elevation: 0,
          leading: IconButton(
              iconSize: 14.83,
              icon: FaIcon(
                FontAwesomeIcons.chevronLeft,
                color: MyTheme.iconColor,
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
              color: MyTheme.appbartextColor,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 29,
                  ),
                  FieldTitle(
                    text: "Type of Establishment",
                    fontFamily: 'Inter-Regular',
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    // width: 341,
                    // height: 45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(6.0),
                      ),
                      border: Border.all(
                        width: 1,
                        color: controller.typeOfEstablishment.value.isEmpty
                            ? MyTheme.borderColor
                            : MyTheme.borderchangeColor,
                        style: BorderStyle.solid,
                      ),
                    ),
                    child: DropdownButtonFormField<String>(
                      icon: Padding(
                        padding: const EdgeInsets.only(right: 8.17),
                        child: FaIcon(
                          FontAwesomeIcons.chevronDown,
                          color: MyTheme.iconColor,
                          size: 14.87,
                        ),
                      ),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
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
                          color: controller.typeOfEstablishment.value.isEmpty
                              ? MyTheme.hinttextColor
                              : MyTheme.hinttextchangeColor,
                        ),
                      ),
                      items: controller.typeOfEsts
                          .map(
                            (e) => DropdownMenuItem(child: Text(e), value: e),
                          )
                          .toList(),
                      // value: controller.typeOfEstablishment.value,
                      onChanged: (newValue) {
                        setState(() {
                          controller.typeOfEstablishment.value = newValue!;
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    height: 29,
                  ),
                  FieldTitle(
                    text: "Type of Cuisines",
                    fontFamily: 'Inter-Regular',
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
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
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      child: ConstrainedBox(
                                        constraints: BoxConstraints(
                                            maxHeight: size.height,
                                            maxWidth: size.width * 0.055),
                                        child: Checkbox(
                                          materialTapTargetSize:
                                              MaterialTapTargetSize.shrinkWrap,
                                          activeColor: MyTheme.checkColor,
                                          checkColor: Colors.white,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                          ),
                                          value: controller.chooseCategory
                                              .contains(category),
                                          tristate: false,
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
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      width: 85,
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
                                            color: MyTheme.checkboxtextColor,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 6,
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
                      color: MyTheme.checkboxbottomtextColor,
                    ),
                  ),
                  SizedBox(
                    height: 29,
                  ),
                  FieldTitle(
                    text: "Restaurant Operational Hours",
                    fontFamily: 'Inter-Regular',
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
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
                                height: 45,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(6)),
                                  border: Border.all(
                                    width: 1,
                                    color: MyTheme.borderColor,
                                    // controller.startHour.value == true
                                    //     ? MyTheme.borderColor
                                    //     : MyTheme.borderchangeColor,
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
                                        (controller.startHour
                                                        .toString()
                                                        .length ==
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
                                          fontSize: 16,
                                          fontFamily: 'Inter',
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.w500,
                                          color: MyTheme.hinttextColor,
                                        ),
                                      ),
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox.square(
                                          dimension: 15,
                                          child: InkWell(
                                            onTap: () {
                                              if (controller.startMinute ==
                                                  30) {
                                                if (controller.startHour !=
                                                    12) {
                                                  controller.startHour + 1;
                                                }
                                                controller.startMinute.value =
                                                    00;
                                              } else {
                                                if (controller.startHour != 12)
                                                  controller.startMinute.value =
                                                      30;
                                              }
                                            },
                                            child: Container(
                                              height: 12,
                                              width: 12,
                                              alignment: Alignment.center,
                                              child: FaIcon(
                                                FontAwesomeIcons.chevronUp,
                                                color:
                                                    MyTheme.dropdownarrowColor,
                                                size: 12,
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 1,
                                        ),
                                        SizedBox.square(
                                          dimension: 15,
                                          child: InkWell(
                                            onTap: () {
                                              if (controller.startMinute ==
                                                  30) {
                                                controller.startMinute.value =
                                                    00;
                                              } else {
                                                if (controller.startHour != 0) {
                                                  controller.startMinute.value =
                                                      30;
                                                  controller.startHour - 1;
                                                }
                                              }
                                            },
                                            child: Container(
                                              height: 12,
                                              width: 12,
                                              alignment: Alignment.center,
                                              child: FaIcon(
                                                FontAwesomeIcons.chevronDown,
                                                color:
                                                    MyTheme.dropdownarrowColor,
                                                size: 12,
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
                                          color: MyTheme.borderColor,
                                          //  controller.startHour == false
                                          //     ? MyTheme.borderColor
                                          //     : MyTheme.borderchangeColor,
                                          style: BorderStyle.solid,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 19,
                                      child: Text(
                                        controller.startAmPm.value,
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontFamily: 'Inter',
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.w500,
                                          color: MyTheme.hinttextColor,
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                        child: Container(
                                          padding: EdgeInsets.only(
                                              bottom: 4, top: 4),
                                          child: FaIcon(
                                            controller.startAmPm.value == "AM"
                                                ? FontAwesomeIcons.chevronDown
                                                : FontAwesomeIcons.chevronUp,
                                            size: 12,
                                            color: MyTheme.dropdownarrowColor,
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
                                  color: MyTheme.bottomtextColor,
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
                                height: 45,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(6)),
                                  border: Border.all(
                                    width: 1,
                                    color: MyTheme.borderColor,
                                    // controller.startHour == false
                                    //     ? MyTheme.borderColor
                                    //     : MyTheme.borderchangeColor,
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
                                              : controller.endMinute
                                                  .toString()),
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontFamily: 'Inter',
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w500,
                                        color: MyTheme.hinttextColor,
                                      ),
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                                              height: 12,
                                              width: 12,
                                              alignment: Alignment.center,
                                              child: FaIcon(
                                                FontAwesomeIcons.chevronUp,
                                                color:
                                                    MyTheme.dropdownarrowColor,
                                                size: 12,
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 1,
                                        ),
                                        SizedBox.square(
                                          dimension: 15,
                                          child: InkWell(
                                            onTap: () {
                                              if (controller.endMinute == 30) {
                                                controller.endMinute.value = 00;
                                              } else {
                                                if (controller.endHour != 0) {
                                                  controller.endMinute.value =
                                                      30;
                                                  controller.endHour - 1;
                                                }
                                              }
                                            },
                                            child: Container(
                                              height: 12,
                                              width: 12,
                                              alignment: Alignment.center,
                                              child: FaIcon(
                                                FontAwesomeIcons.chevronDown,
                                                color:
                                                    MyTheme.dropdownarrowColor,
                                                size: 12,
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
                                        border: Border.all(
                                          width: 1,
                                          color: MyTheme.borderColor,
                                          //  controller.startHour == false
                                          //     ? MyTheme.borderColor
                                          //     : MyTheme.borderchangeColor,
                                          style: BorderStyle.solid,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 19,
                                      child: Text(
                                        controller.eventstartAmPm.value,
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontFamily: 'Inter',
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.w500,
                                          color: MyTheme.hinttextColor,
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                        child: Container(
                                          padding: EdgeInsets.only(
                                              bottom: 4, top: 4),
                                          child: FaIcon(
                                            controller.eventstartAmPm.value ==
                                                    "AM"
                                                ? FontAwesomeIcons.chevronDown
                                                : FontAwesomeIcons.chevronUp,
                                            size: 12,
                                            color: MyTheme.dropdownarrowColor,
                                          ),
                                        ),
                                        onTap: () {
                                          if (controller.eventstartAmPm.value ==
                                              "AM") {
                                            controller.eventstartAmPm.value =
                                                "PM";
                                          } else {
                                            controller.eventstartAmPm.value =
                                                "AM";
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
                                  color: MyTheme.bottomtextColor,
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
                    fontFamily: 'Inter-Regular',
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Obx(
                    () => Wrap(
                      direction: Axis.horizontal,
                      // crossAxisAlignment: WrapCrossAlignment.,
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
                                      Container(
                                        child: ConstrainedBox(
                                          constraints: BoxConstraints(
                                            maxHeight: size.height,
                                            maxWidth: size.width * 0.055,
                                          ),
                                          child: Checkbox(
                                            materialTapTargetSize:
                                                MaterialTapTargetSize
                                                    .shrinkWrap,
                                            activeColor: MyTheme.checkColor,
                                            checkColor: Colors.white,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                            ),
                                            value: controller.chooseDays
                                                .contains(days),
                                            onChanged: (value) {
                                              if (controller.chooseDays
                                                  .contains(days)) {
                                                controller.chooseDays
                                                    .remove(days);
                                              } else {
                                                controller.chooseDays.add(days);
                                              }
                                              setState(() {
                                                controller.isDays = value!;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
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
                                              color: MyTheme.checkboxtextColor,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 6,
                                      ),
                                    ],
                                  ),
                                ))
                            .toList(),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  InkWell(
                    onTap: () {
                      formKey.currentState!.save();
                      if (formKey.currentState!.validate())
                        controller.onboardingApi(OnBoardingMethod.api4);
                    },
                    child: Container(
                      // width: 343,
                      height: 40.11,
                      decoration: BoxDecoration(
                        color: (controller.isChecked == true &&
                                controller.isDays == true)
                            ? MyTheme.buttonchangeColor
                            : MyTheme.buttonColor,
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
                            color: MyTheme.buttontextColor,
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
      ),
    );
  }
}
