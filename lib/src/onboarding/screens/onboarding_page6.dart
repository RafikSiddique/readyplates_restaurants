import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:readyplates_restaurants/src/onboarding/onboarding_controller.dart';
import 'package:readyplates_restaurants/utils/my_color.dart';
import 'package:readyplates_restaurants/widgets/field_title.dart';
import 'package:readyplates_restaurants/widgets/form_field.dart';
import 'package:readyplates_restaurants/widgets/onboardingWrapper.dart';
import 'package:readyplates_restaurants/widgets/onboardingbutton.dart';

class OnboardingPage6 extends StatefulWidget {
  static const resId = "/onboarding6";
  const OnboardingPage6({Key? key}) : super(key: key);

  @override
  State<OnboardingPage6> createState() => _OnboardingPage6State();
}

class _OnboardingPage6State extends State<OnboardingPage6> {
  final dobController = TextEditingController();
  final controller = Get.find<OnboardingController>();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String dob = '';
  String rec = '';
  DateTime? _selectedEventDate;
  void showEventDate() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2021),
      lastDate: DateTime.now(),
      currentDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      controller.recurrenceTime = pickedDate;
      setState(() {
        _selectedEventDate = pickedDate;
      });
    });
  }

  TimeOfDay currentTime = TimeOfDay.now();
  TimeOfDay? PickedTime;

  Future<void> _selectStartTime(BuildContext context) async {
    PickedTime = await showTimePicker(
      context: context,
      initialTime: currentTime,
      initialEntryMode: TimePickerEntryMode.dial,
      helpText: 'Select Start Time',
      confirmText: 'choose',
      cancelText: 'cancel',
      hourLabelText: 'hour',
      minuteLabelText: 'minute',
    );
    if (PickedTime != null && PickedTime != currentTime) {
      setState(() {
        currentTime = PickedTime!;
        controller.startTime = PickedTime.toString();
        print(PickedTime!.format(context));
      });
    }
  }

  TimeOfDay currentTime1 = TimeOfDay.now();
  TimeOfDay? PickedTime1;
  Future<void> _selectEndTime(BuildContext context) async {
    PickedTime1 = await showTimePicker(
      context: context,
      initialTime: currentTime1,
      initialEntryMode: TimePickerEntryMode.dial,
      helpText: 'Select End Time',
      confirmText: 'choose',
      cancelText: 'cancel',
      hourLabelText: 'hour',
      minuteLabelText: 'minute',
    );
    if (PickedTime1 != null && PickedTime1 != currentTime1) {
      setState(() {
        currentTime1 = PickedTime1!;
        controller.endTime = PickedTime1.toString();
        print(PickedTime1!.format(context));
      });
    }
  }

  @override
  void initState() {
    controller.resDescript.addListener(() {
      setState(() {});
    });
    controller.eventDesc.addListener(() {
      setState(() {});
    });

    super.initState();
  }

  @override
  void dispose() {
    controller.resDescript.dispose();
    controller.eventDesc.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                color: MyTheme.appbartextColor,
              ),
              onPressed: () {
                Get.back();
              }),
          centerTitle: true,
          title: Text(
            'Restaurant Bio',
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
                    height: 8,
                  ),

                  AppFormField(
                    line: 4,
                    title: 'Restaurant Description',
                    hintText:
                        'Founded in 1954, Burger King is the second largest fast food hamburger chain in the world. The original Home of the Whopper, our commitment to premium ingredients, signature recipes, and family-friendly dining experiences is what has defined our brand for more than 50 successful years.',
                    hintfontSize: 15,
                    controller: controller.resDescript,
                    bottomText: 'Max 50 words',
                  ),

                  SizedBox(
                    height: 15,
                  ),
                  FieldTitle(
                    text: 'Table Information',
                    fontFamily: 'Inter-Regular',
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),

                  SizedBox(
                    height: 5,
                  ),
                  Row(
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
                                  style: BorderStyle.solid,
                                ),
                              ),
                              child: InkWell(
                                onTap: () {
                                  Get.bottomSheet(BottomSheet(
                                    onClosing: () {},
                                    builder: (context) {
                                      //  (controller.noOfTables.value
                                      //             .toString()
                                      //             .length ==
                                      //         1
                                      //     ? controller.noOfTables.value
                                      //         .toString()
                                      //         .padLeft(2, "0")
                                      //     : controller.noOfTables.value
                                      //         .toString())
                                      return Card(
                                          margin: EdgeInsets.zero,
                                          child: ListView(
                                            shrinkWrap: true,
                                            children: List.generate(30,
                                                    (index) {
                                              return (index + 1);
                                            })
                                                .map((e) => ListTile(
                                                      title: Text(e.toString()),
                                                      onTap: () {
                                                        controller.noOfTables
                                                            .value = e;
                                                        Get.back();
                                                      },
                                                    ))
                                                .toList(),
                                          ));
                                    },
                                  ));
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Obx(
                                      () => Text(
                                        controller.noOfTables.value
                                            .toString()
                                            .padLeft(2, "0"),
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: 'Inter',
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.bold,
                                          color: MyTheme.hinttextColor,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 16,
                                    ),
                                    Container(),
                                    // Text(
                                    //   '₹',
                                    //   style: TextStyle(
                                    //     fontSize: 16,
                                    //     fontFamily: 'Inter',
                                    //     fontStyle: FontStyle.normal,
                                    //     fontWeight: FontWeight.bold,
                                    //     color: MyTheme.checkboxtextColor,
                                    //   ),
                                    // ),
                                  ],
                                ),
                              ),
                              //     Row(
                              //   mainAxisAlignment: MainAxisAlignment.center,
                              //   children: [
                              //     Obx(
                              //       () => Text(
                              //         (controller.noOfTables.value
                              //                     .toString()
                              //                     .length ==
                              //                 1
                              //             ? controller.noOfTables.value
                              //                 .toString()
                              //                 .padLeft(2, "0")
                              //             : controller.noOfTables.value
                              //                 .toString()),
                              //         style: TextStyle(
                              //           fontSize: 16,
                              //           fontFamily: 'Inter',
                              //           fontStyle: FontStyle.normal,
                              //           fontWeight: FontWeight.bold,
                              //           color: MyTheme.hinttextColor,
                              //         ),
                              //       ),
                              //     ),
                              //     Padding(
                              //       padding: const EdgeInsets.only(left: 10),
                              //       child: Column(
                              //         mainAxisAlignment:
                              //             MainAxisAlignment.center,
                              //         crossAxisAlignment:
                              //             CrossAxisAlignment.center,
                              //         children: [
                              //           SizedBox.square(
                              //             dimension: 15,
                              //             child: InkWell(
                              //               onTap: () {
                              //                 controller.noOfTables++;
                              //               },
                              //               child: Container(
                              //                 height: 12,
                              //                 width: 12,
                              //                 alignment: Alignment.center,
                              //                 child: FaIcon(
                              //                   FontAwesomeIcons.chevronUp,
                              //                   color:
                              //                       MyTheme.dropdownarrowColor,
                              //                   size: 15,
                              //                 ),
                              //               ),
                              //             ),
                              //           ),
                              //           SizedBox(
                              //             height: 1,
                              //           ),
                              //           SizedBox.square(
                              //             dimension: 15,
                              //             child: InkWell(
                              //               onTap: () {
                              //                 if (controller.noOfTables != 0)
                              //                   controller.noOfTables--;
                              //               },
                              //               child: Container(
                              //                 height: 12,
                              //                 width: 12,
                              //                 alignment: Alignment.center,
                              //                 child: FaIcon(
                              //                   FontAwesomeIcons.chevronDown,
                              //                   color:
                              //                       MyTheme.dropdownarrowColor,
                              //                   size: 15,
                              //                 ),
                              //               ),
                              //             ),
                              //           ),
                              //         ],
                              //       ),
                              //     ),
                              //   ],
                              // ),
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Text(
                              'Enter No of tables present',
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
                                  style: BorderStyle.solid,
                                ),
                              ),
                              child: InkWell(
                                onTap: () {
                                  Get.bottomSheet(BottomSheet(
                                    onClosing: () {},
                                    builder: (context) {
                                      return Card(
                                          margin: EdgeInsets.zero,
                                          child: ListView(
                                            shrinkWrap: true,
                                            children: List.generate(30,
                                                    (index) {
                                              return (index + 1);
                                            })
                                                .map((e) => ListTile(
                                                      title: Text(e.toString()),
                                                      onTap: () {
                                                        controller.noOfSeats
                                                            .value = e;
                                                        Get.back();
                                                      },
                                                    ))
                                                .toList(),
                                          ));
                                    },
                                  ));
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Obx(
                                      () => Text(
                                        controller.noOfSeats.value
                                            .toString()
                                            .padLeft(2, "0"),
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: 'Inter',
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.bold,
                                          color: MyTheme.hinttextColor,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 16,
                                    ),
                                    Container(),
                                    // Text(
                                    //   '₹',
                                    //   style: TextStyle(
                                    //     fontSize: 16,
                                    //     fontFamily: 'Inter',
                                    //     fontStyle: FontStyle.normal,
                                    //     fontWeight: FontWeight.bold,
                                    //     color: MyTheme.checkboxtextColor,
                                    //   ),
                                    // ),
                                  ],
                                ),
                              ),
                              //  Row(
                              //   mainAxisAlignment: MainAxisAlignment.center,
                              //   children: [
                              //     Obx(
                              //       () => Text(
                              //         (controller.noOfSeats.value
                              //                     .toString()
                              //                     .length ==
                              //                 1
                              //             ? controller.noOfSeats.value
                              //                 .toString()
                              //                 .padLeft(2, "0")
                              //             : controller.noOfSeats.value
                              //                 .toString()),
                              //         style: TextStyle(
                              //           fontSize: 16,
                              //           fontFamily: 'Inter',
                              //           fontStyle: FontStyle.normal,
                              //           fontWeight: FontWeight.bold,
                              //           color: MyTheme.hinttextColor,
                              //         ),
                              //       ),
                              //     ),
                              //     Padding(
                              //       padding: const EdgeInsets.only(left: 10),
                              //       child: Column(
                              //         mainAxisAlignment:
                              //             MainAxisAlignment.center,
                              //         crossAxisAlignment:
                              //             CrossAxisAlignment.center,
                              //         children: [
                              //           SizedBox.square(
                              //             dimension: 15,
                              //             child: InkWell(
                              //               onTap: () {
                              //                 controller.noOfSeats++;
                              //               },
                              //               child: Container(
                              //                 height: 12,
                              //                 width: 12,
                              //                 alignment: Alignment.center,
                              //                 child: FaIcon(
                              //                   FontAwesomeIcons.chevronUp,
                              //                   color:
                              //                       MyTheme.dropdownarrowColor,
                              //                   size: 15,
                              //                 ),
                              //               ),
                              //             ),
                              //           ),
                              //           SizedBox(
                              //             height: 1,
                              //           ),
                              //           SizedBox.square(
                              //             dimension: 15,
                              //             child: InkWell(
                              //               onTap: () {
                              //                 if (controller.noOfSeats != 0)
                              //                   controller.noOfSeats--;
                              //               },
                              //               child: Container(
                              //                 height: 12,
                              //                 width: 12,
                              //                 alignment: Alignment.center,
                              //                 child: FaIcon(
                              //                   FontAwesomeIcons.chevronDown,
                              //                   color:
                              //                       MyTheme.dropdownarrowColor,
                              //                   size: 15,
                              //                 ),
                              //               ),
                              //             ),
                              //           ),
                              //         ],
                              //       ),
                              //     ),
                              //   ],
                              // ),
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Text(
                              'Max table size (No of persons)',
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
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            FieldTitle(
                              text: 'Cost for two',
                              fontFamily: 'Inter-Regular',
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            InkWell(
                              onTap: () {
                                Get.bottomSheet(BottomSheet(
                                  onClosing: () {},
                                  builder: (context) {
                                    return Card(
                                        margin: EdgeInsets.zero,
                                        child: ListView(
                                          shrinkWrap: true,
                                          children: List.generate(20, (index) {
                                            return (index + 1) * 50;
                                          })
                                              .map((e) => ListTile(
                                                    title: Text(e.toString()),
                                                    onTap: () {
                                                      controller
                                                          .costFor2.value = e;
                                                      Get.back();
                                                    },
                                                  ))
                                              .toList(),
                                        ));
                                  },
                                ));
                              },
                              child: Container(
                                height: 45,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(6)),
                                  border: Border.all(
                                    width: 1,
                                    color: MyTheme.borderColor,
                                    style: BorderStyle.solid,
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Obx(
                                      () => Text(
                                        controller.costFor2.value.toString(),
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: 'Inter',
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.bold,
                                          color: MyTheme.hinttextColor,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 16,
                                    ),
                                    Text(
                                      '₹',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontFamily: 'Inter',
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.bold,
                                        color: MyTheme.checkboxtextColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Text(
                              'Enter average cost for two per meal',
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
                            FieldTitle(
                              text: 'Serving time',
                              fontFamily: 'Inter-Regular',
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            InkWell(
                              onTap: () {
                                Get.bottomSheet(BottomSheet(
                                  onClosing: () {},
                                  builder: (context) {
                                    return Card(
                                        margin: EdgeInsets.zero,
                                        child: ListView(
                                          shrinkWrap: true,
                                          children: List.generate(6, (index) {
                                            return (index + 1) * 15;
                                          })
                                              .map((e) => ListTile(
                                                    title: Text(e.toString() +
                                                        " Minutes"),
                                                    onTap: () {
                                                      controller.servingTime
                                                          .value = e;

                                                      Get.back();
                                                    },
                                                  ))
                                              .toList(),
                                        ));
                                  },
                                ));
                              },
                              child: Container(
                                height: 45,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(6)),
                                  border: Border.all(
                                    width: 1,
                                    color: MyTheme.borderColor,
                                    style: BorderStyle.solid,
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Obx(
                                      () => Text(
                                        controller.servingTime.value.toString(),
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: 'Inter',
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.bold,
                                          color: MyTheme.hinttextColor,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                      'mins',
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontFamily: 'Inter',
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.bold,
                                        color: MyTheme.checkboxtextColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Text(
                              'Enter average serving time for two',
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
                  SizedBox(
                    height: 15,
                  ),
                  FieldTitle(
                    text: 'Recurring events (optional)',
                    required: false,
                    fontFamily: 'Inter-Regular',
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),

                  SizedBox(
                    height: 5,
                  ),
                  Row(
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
                                  color: _selectedEventDate == null
                                      ? MyTheme.borderColor
                                      : MyTheme.borderchangeColor,
                                  style: BorderStyle.solid,
                                ),
                              ),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 14),
                                      child: InkWell(
                                        onTap: () {
                                          showEventDate();
                                        },
                                        child: Text(
                                          _selectedEventDate == null
                                              ? 'Event Dates'
                                              : '${_selectedEventDate!.year}/${_selectedEventDate!.month}/${_selectedEventDate!.day}',
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontFamily: 'Inter',
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w500,
                                            color: _selectedEventDate == null
                                                ? MyTheme.hinttextColor
                                                : MyTheme.hinttextchangeColor,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 7.5),
                                      child: InkWell(
                                        onTap: () {
                                          showEventDate();
                                        },
                                        child: Container(
                                          width: 20,
                                          height: 20,
                                          child: Image(
                                              image: AssetImage(
                                                  'assets/images/calendar.png')),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Text(
                              'Enter No of tables present',
                              style: TextStyle(
                                fontSize: 9,
                                fontFamily: 'Poppins',
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.normal,
                                letterSpacing: -0.229412,
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
                                  color: rec.isEmpty
                                      ? MyTheme.borderColor
                                      : MyTheme.borderchangeColor,
                                  style: BorderStyle.solid,
                                ),
                              ),
                              child: InkWell(
                                onTap: () {
                                  Get.bottomSheet(BottomSheet(
                                    onClosing: () {},
                                    builder: (context) {
                                      return Card(
                                          margin: EdgeInsets.zero,
                                          child: ListView(
                                            shrinkWrap: true,
                                            children:
                                                ["Yearly", "Monthly", "Weekly"]
                                                    .map((e) => ListTile(
                                                          title: Text(e),
                                                          onTap: () {
                                                            controller
                                                                .selectedRecurrence
                                                                .value = e;
                                                            setState(() {
                                                              rec = controller
                                                                  .servingTime
                                                                  .value
                                                                  .toString();
                                                            });
                                                            //controller.servingTime.value.toString()
                                                            //e.toString();
                                                            Get.back();
                                                          },
                                                        ))
                                                    .toList(),
                                          ));
                                    },
                                  ));
                                },
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 14),
                                        child: Obx(
                                          () => Text(
                                            controller.selectedRecurrence.value
                                            /* _selectedMonthlyDate == null
                                                ? 'Monthly'
                                                : '${_selectedMonthlyDate!.year}/${_selectedMonthlyDate!.month}/${_selectedMonthlyDate!.day}' */
                                            ,
                                            style: TextStyle(
                                              fontSize: 15,
                                              fontFamily: 'Inter',
                                              fontStyle: FontStyle.normal,
                                              fontWeight: FontWeight.w500,
                                              color: MyTheme.hinttextColor,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 7.5),
                                        child: InkWell(
                                          onTap: () {
                                            Get.bottomSheet(BottomSheet(
                                              onClosing: () {},
                                              builder: (context) {
                                                return Card(
                                                    margin: EdgeInsets.zero,
                                                    child: ListView(
                                                      shrinkWrap: true,
                                                      children: [
                                                        "Yearly",
                                                        "Monthly",
                                                        "Weekly"
                                                      ]
                                                          .map((e) => ListTile(
                                                                title: Text(e),
                                                                onTap: () {
                                                                  controller
                                                                      .selectedRecurrence
                                                                      .value = e;
                                                                  setState(() {
                                                                    rec = controller
                                                                        .servingTime
                                                                        .value
                                                                        .toString();
                                                                  });
                                                                  //controller.servingTime.value.toString()
                                                                  //e.toString();
                                                                  Get.back();
                                                                },
                                                              ))
                                                          .toList(),
                                                    ));
                                              },
                                            ));
                                          },
                                          child: Container(
                                            width: 20,
                                            height: 20,
                                            child: Image(
                                                image: AssetImage(
                                                    'assets/images/calendar.png')),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Text(
                              'Recurrance frequency',
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
                  SizedBox(
                    height: 5,
                  ),
                  //hgf
                  Row(
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
                                  color: PickedTime == null
                                      ? MyTheme.borderColor
                                      : MyTheme.borderchangeColor,
                                  style: BorderStyle.solid,
                                ),
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  _selectStartTime(context);
                                },
                                child: Center(
                                  child: Text(
                                    PickedTime == null
                                        ? '${currentTime.format(context)}'
                                        : '${currentTime.format(context)}',
                                    style: TextStyle(
                                      fontSize: PickedTime == null ? 16 : 20,
                                      fontFamily: 'Inter',
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w500,
                                      color: PickedTime == null
                                          ? MyTheme.hinttextColor
                                          : MyTheme.hinttextchangeColor,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
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
                        width: 15,
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
                                  color: PickedTime1 == null
                                      ? MyTheme.borderColor
                                      : MyTheme.borderchangeColor,
                                  style: BorderStyle.solid,
                                ),
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  _selectEndTime(context);
                                },
                                child: Center(
                                  child: Text(
                                    PickedTime1 == null
                                        ? '${currentTime1.format(context)}'
                                        : '${currentTime1.format(context)}',
                                    style: TextStyle(
                                      fontSize: PickedTime1 == null ? 16 : 20,
                                      fontFamily: 'Inter',
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w500,
                                      color: PickedTime1 == null
                                          ? MyTheme.hinttextColor
                                          : MyTheme.hinttextchangeColor,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
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

                  // Obx(
                  //   () => Row(
                  //     children: [
                  //       Expanded(
                  //         child: Column(
                  //           crossAxisAlignment: CrossAxisAlignment.start,
                  //           children: [
                  //             Container(
                  //               height: 45,
                  //               decoration: BoxDecoration(
                  //                 borderRadius:
                  //                     BorderRadius.all(Radius.circular(6)),
                  //                 border: Border.all(
                  //                   width: 1,
                  //                   color: MyTheme.borderColor,
                  //                   style: BorderStyle.solid,
                  //                 ),
                  //               ),
                  //               child: Row(
                  //                 mainAxisAlignment:
                  //                     MainAxisAlignment.spaceAround,
                  //                 children: [
                  //                   Text(
                  //                     (controller.eventstartHour.toString().length ==
                  //                                 1
                  //                             ? controller.eventstartHour
                  //                                 .toString()
                  //                                 .padLeft(2, "0")
                  //                             : controller.eventstartHour
                  //                                 .toString()) +
                  //                         ":" +
                  //                         (controller.eventstartMinute
                  //                                     .toString()
                  //                                     .length ==
                  //                                 1
                  //                             ? controller.eventstartMinute
                  //                                 .toString()
                  //                                 .padLeft(2, "0")
                  //                             : controller.eventstartMinute
                  //                                 .toString()),
                  //                     style: TextStyle(
                  //                       fontSize: 15,
                  //                       fontFamily: 'Inter',
                  //                       fontStyle: FontStyle.normal,
                  //                       fontWeight: FontWeight.w500,
                  //                       color: MyTheme.hinttextColor,
                  //                     ),
                  //                   ),
                  //                   Column(
                  //                     mainAxisAlignment:
                  //                         MainAxisAlignment.center,
                  //                     crossAxisAlignment:
                  //                         CrossAxisAlignment.center,
                  //                     children: [
                  //                       SizedBox.square(
                  //                         dimension: 15,
                  //                         child: InkWell(
                  //                           onTap: () {
                  //                             if (controller.eventstartMinute ==
                  //                                 30) {
                  //                               if (controller.eventstartHour !=
                  //                                   12) {
                  //                                 controller.eventstartHour + 1;
                  //                               }
                  //                               controller.eventstartMinute
                  //                                   .value = 00;
                  //                             } else {
                  //                               if (controller.eventstartHour !=
                  //                                   12)
                  //                                 controller.eventstartMinute
                  //                                     .value = 30;
                  //                             }
                  //                           },
                  //                           child: Container(
                  //                             height: 12,
                  //                             width: 12,
                  //                             alignment: Alignment.center,
                  //                             child: FaIcon(
                  //                               FontAwesomeIcons.chevronUp,
                  //                               color:
                  //                                   MyTheme.dropdownarrowColor,
                  //                               size: 15,
                  //                             ),
                  //                           ),
                  //                         ),
                  //                       ),
                  //                       SizedBox.square(
                  //                         dimension: 15,
                  //                         child: InkWell(
                  //                           onTap: () {
                  //                             if (controller.eventstartMinute ==
                  //                                 30) {
                  //                               controller.eventstartMinute
                  //                                   .value = 00;
                  //                             } else {
                  //                               if (controller.eventstartHour !=
                  //                                   0) {
                  //                                 controller.eventstartMinute
                  //                                     .value = 30;
                  //                                 controller.eventstartHour - 1;
                  //                               }
                  //                             }
                  //                           },
                  //                           child: Container(
                  //                             height: 12,
                  //                             width: 12,
                  //                             alignment: Alignment.center,
                  //                             child: FaIcon(
                  //                               FontAwesomeIcons.chevronDown,
                  //                               color:
                  //                                   MyTheme.dropdownarrowColor,
                  //                               size: 15,
                  //                             ),
                  //                           ),
                  //                         ),
                  //                       ),
                  //                     ],
                  //                   ),
                  //                   Container(
                  //                     height: 35,
                  //                     width: 0,
                  //                     decoration: BoxDecoration(
                  //                       border: Border.all(
                  //                         width: 1,
                  //                         color: MyTheme.borderColor,
                  //                         style: BorderStyle.solid,
                  //                       ),
                  //                     ),
                  //                   ),
                  //                   Container(
                  //                     height: 18,
                  //                     child: Text(
                  //                       controller.eventendAmPm.value,
                  //                       style: TextStyle(
                  //                         fontSize: 15,
                  //                         fontFamily: 'Inter',
                  //                         fontStyle: FontStyle.normal,
                  //                         fontWeight: FontWeight.w500,
                  //                         color: MyTheme.hinttextColor,
                  //                       ),
                  //                     ),
                  //                   ),
                  //                   InkWell(
                  //                       child: Container(
                  //                         padding: EdgeInsets.only(
                  //                             bottom: 2, top: 4),
                  //                         child: FaIcon(
                  //                           controller.eventstartAmPm.value ==
                  //                                   "AM"
                  //                               ? FontAwesomeIcons.chevronDown
                  //                               : FontAwesomeIcons.chevronUp,
                  //                           size: 13,
                  //                           color: MyTheme.dropdownarrowColor,
                  //                         ),
                  //                       ),
                  //                       onTap: () {
                  //                         if (controller.eventstartAmPm.value ==
                  //                             "AM") {
                  //                           controller.eventstartAmPm.value =
                  //                               "PM";
                  //                         } else {
                  //                           controller.eventstartAmPm.value =
                  //                               "AM";
                  //                         }
                  //                       }),
                  //                 ],
                  //               ),
                  //             ),
                  //             SizedBox(
                  //               height: 3,
                  //             ),
                  //             Text(
                  //               'Select start time  (hh:mm AM/PM)',
                  //               style: TextStyle(
                  //                 fontSize: 9,
                  //                 fontFamily: 'Poppins',
                  //                 fontStyle: FontStyle.normal,
                  //                 fontWeight: FontWeight.normal,
                  //                 color: MyTheme.bottomtextColor,
                  //               ),
                  //             )
                  //           ],
                  //         ),
                  //       ),
                  //       SizedBox(
                  //         width: 18,
                  //       ),
                  //       Expanded(
                  //         child: Column(
                  //           crossAxisAlignment: CrossAxisAlignment.start,
                  //           children: [
                  //             Container(
                  //               height: 45,
                  //               decoration: BoxDecoration(
                  //                 borderRadius:
                  //                     BorderRadius.all(Radius.circular(6)),
                  //                 border: Border.all(
                  //                   width: 1,
                  //                   color: MyTheme.borderColor,
                  //                   style: BorderStyle.solid,
                  //                 ),
                  //               ),
                  //               child: Row(
                  //                 mainAxisAlignment:
                  //                     MainAxisAlignment.spaceAround,
                  //                 children: [
                  //                   Text(
                  //                     (controller.eventendHour
                  //                                     .toString()
                  //                                     .length ==
                  //                                 1
                  //                             ? controller.eventendHour
                  //                                 .toString()
                  //                                 .padLeft(2, "0")
                  //                             : controller.eventendHour
                  //                                 .toString()) +
                  //                         ":" +
                  //                         (controller.eventendMinute
                  //                                     .toString()
                  //                                     .length ==
                  //                                 1
                  //                             ? controller.eventendMinute
                  //                                 .toString()
                  //                                 .padLeft(2, "0")
                  //                             : controller.eventendMinute
                  //                                 .toString()),
                  //                     style: TextStyle(
                  //                       fontSize: 15,
                  //                       fontFamily: 'Inter',
                  //                       fontStyle: FontStyle.normal,
                  //                       fontWeight: FontWeight.w500,
                  //                       color: MyTheme.hinttextColor,
                  //                     ),
                  //                   ),

                  //                   Column(
                  //                     mainAxisAlignment:
                  //                         MainAxisAlignment.center,
                  //                     crossAxisAlignment:
                  //                         CrossAxisAlignment.center,
                  //                     children: [
                  //                       SizedBox.square(
                  //                         dimension: 15,
                  //                         child: InkWell(
                  //                           onTap: () {
                  //                             if (controller.eventendMinute ==
                  //                                 30) {
                  //                               if (controller.eventendHour !=
                  //                                   12) {
                  //                                 controller.eventendHour + 1;
                  //                               }
                  //                               controller
                  //                                   .eventendMinute.value = 00;
                  //                             } else {
                  //                               controller
                  //                                   .eventendMinute.value = 30;
                  //                             }
                  //                           },
                  //                           child: Container(
                  //                             height: 12,
                  //                             width: 12,
                  //                             alignment: Alignment.center,
                  //                             child: FaIcon(
                  //                               FontAwesomeIcons.chevronUp,
                  //                               color:
                  //                                   MyTheme.dropdownarrowColor,
                  //                               size: 15,
                  //                             ),
                  //                           ),
                  //                         ),
                  //                       ),
                  //                       SizedBox.square(
                  //                         dimension: 15,
                  //                         child: InkWell(
                  //                           onTap: () {
                  //                             if (controller.eventendMinute ==
                  //                                 30) {
                  //                               controller
                  //                                   .eventendMinute.value = 00;
                  //                             } else {
                  //                               if (controller.eventendHour !=
                  //                                   0) {
                  //                                 controller.eventendMinute
                  //                                     .value = 30;
                  //                                 controller.eventendHour - 1;
                  //                               }
                  //                             }
                  //                           },
                  //                           child: Container(
                  //                             height: 12,
                  //                             width: 12,
                  //                             alignment: Alignment.center,
                  //                             child: FaIcon(
                  //                               FontAwesomeIcons.chevronDown,
                  //                               color:
                  //                                   MyTheme.dropdownarrowColor,
                  //                               size: 15,
                  //                             ),
                  //                           ),
                  //                         ),
                  //                       ),
                  //                     ],
                  //                   ),
                  //                   // SizedBox(
                  //                   //   width: 6,
                  //                   // ),
                  //                   Container(
                  //                     height: 35,
                  //                     width: 0,
                  //                     decoration: BoxDecoration(
                  //                       border: Border.all(
                  //                         width: 1,
                  //                         color: MyTheme.borderColor,
                  //                         style: BorderStyle.solid,
                  //                       ),
                  //                     ),
                  //                   ),

                  //                   Container(
                  //                     height: 18,
                  //                     child: Text(
                  //                       controller.eventendAmPm.value,
                  //                       style: TextStyle(
                  //                         fontSize: 15,
                  //                         fontFamily: 'Inter',
                  //                         fontStyle: FontStyle.normal,
                  //                         fontWeight: FontWeight.w500,
                  //                         color: MyTheme.hinttextColor,
                  //                       ),
                  //                     ),
                  //                   ),
                  //                   InkWell(
                  //                       child: Container(
                  //                         padding: EdgeInsets.only(
                  //                             bottom: 2, top: 4),
                  //                         child: FaIcon(
                  //                           controller.eventendAmPm.value ==
                  //                                   "AM"
                  //                               ? FontAwesomeIcons.chevronDown
                  //                               : FontAwesomeIcons.chevronUp,
                  //                           size: 13,
                  //                           color: MyTheme.dropdownarrowColor,
                  //                         ),
                  //                       ),
                  //                       onTap: () {
                  //                         if (controller.eventendAmPm.value ==
                  //                             "AM") {
                  //                           controller.eventendAmPm.value =
                  //                               "PM";
                  //                         } else {
                  //                           controller.eventendAmPm.value =
                  //                               "AM";
                  //                         }
                  //                       }),
                  //                 ],
                  //               ),
                  //             ),
                  //             SizedBox(
                  //               height: 3,
                  //             ),
                  //             Text(
                  //               'Event end time (hh:mm AM/PM)',
                  //               style: TextStyle(
                  //                 fontSize: 9,
                  //                 fontFamily: 'Poppins',
                  //                 fontStyle: FontStyle.normal,
                  //                 fontWeight: FontWeight.normal,
                  //                 color: MyTheme.bottomtextColor,
                  //               ),
                  //             )
                  //           ],
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  SizedBox(
                    height: 5,
                  ),
                  //hjghj
                  AppFormField(
                    line: 4,
                    title: '',
                    hintText: 'Event Description',
                    hintfontSize: 15,
                    controller: controller.eventDesc,
                    bottomText: 'Max 20 words',
                  ),

                  SizedBox(
                    height: 15,
                  ),
                  OnboardingButton(
                    onTap: () {
                      formKey.currentState!.save();
                      if (formKey.currentState!.validate())
                        controller.onboardingApi(OnBoardingMethod.api6);
                    },
                    buttonbackgroundColor:
                        controller.eventDesc.value.text.isEmpty
                            ? MyTheme.buttonColor
                            : MyTheme.buttonchangeColor,
                    text: 'CONTINUE',
                    buttontextColor: controller.eventDesc.value.text.isEmpty
                        ? MyTheme.buttontextColor
                        : MyTheme.buttontextchangeColor,
                  ),
                  // InkWell(
                  //   onTap: () {
                  //     formKey.currentState!.save();
                  //     if (formKey.currentState!.validate())
                  //       controller.onboardingApi(OnBoardingMethod.api6);
                  //   },
                  //   child: Container(
                  //     // width: 343,
                  //     height: 40.11,
                  //     decoration: BoxDecoration(
                  //       color: controller.eventDesc.value.text.isEmpty
                  //           ? MyTheme.buttonColor
                  //           : MyTheme.buttonchangeColor,
                  //       borderRadius: BorderRadius.all(Radius.circular(6)),
                  //     ),
                  //     child: Center(
                  //       child: Text(
                  //         'CONTINUE',
                  //         textAlign: TextAlign.center,
                  //         style: TextStyle(
                  //           fontSize: 17,
                  //           fontFamily: 'Inter',
                  //           fontStyle: FontStyle.normal,
                  //           fontWeight: FontWeight.w600,
                  //           color: MyTheme.buttontextColor,
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  SizedBox(
                    height: 6.89,
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
