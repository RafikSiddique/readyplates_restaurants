import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readyplates_restaurants/src/onboarding/onboarding_controller.dart';
import 'package:readyplates_restaurants/utils/my_color.dart';
import 'package:readyplates_restaurants/widgets/field_title.dart';
import 'package:readyplates_restaurants/widgets/form_field.dart';
import 'package:readyplates_restaurants/widgets/onboardingWrapper.dart';

class OnboardingPage8 extends StatefulWidget {
  static const id = "/onboarding8";
  const OnboardingPage8({Key? key}) : super(key: key);

  @override
  State<OnboardingPage8> createState() => _OnboardingPage8State();
}

class _OnboardingPage8State extends State<OnboardingPage8> {
  final dobController = TextEditingController();
  final controller = Get.find<OnboardingController>();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String dob = '';

  void showEventDate() async {
    DateTime? dt = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2021),
      lastDate: DateTime(2050),
      currentDate: DateTime.now(),
      cancelText: 'Cancel',
      confirmText: 'Ok',
    );
    if (dt != null)
      setState(() {
        controller.recurrenceTime = dt;
      });
  }

  TimeOfDay currentTime = TimeOfDay.now();

  Future<void> _selectStartTime(BuildContext context) async {
    TimeOfDay? tod = await showTimePicker(
      context: context,
      initialTime: controller.estartTimeTod ?? currentTime,
      initialEntryMode: TimePickerEntryMode.dial,
      helpText: 'Select Start Time',
      confirmText: 'Choose',
      cancelText: 'Cancel',
      hourLabelText: 'Hour',
      minuteLabelText: 'Minute',
    );
    if (tod != null && tod != currentTime) {
      controller.estartTimeTod = tod;
      setState(() {
        controller.estartTime = controller.estartTimeTod!.format(context);
      });
    }
  }

  Future<void> _selectEndTime(BuildContext context) async {
    TimeOfDay? tod = await showTimePicker(
      context: context,
      initialTime: controller.eendTimeTod ?? currentTime,
      initialEntryMode: TimePickerEntryMode.dial,
      helpText: 'Select End Time',
      confirmText: 'Choose',
      cancelText: 'Cancel',
      hourLabelText: 'Hour',
      minuteLabelText: 'Minute',
    );
    if (tod != null && tod != currentTime) {
      controller.eendTimeTod = tod;
      setState(() {
        controller.eendTime = controller.eendTimeTod!.format(context);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return OnBoardingWrapper(
      appBarTitle: 'Restaurant Bio',
      onboardingController: controller,
      buttonText: 'CONTINUE',
      textControllers: [
        controller.resDescript,
        controller.maxOrders,
        controller.advanceOrders,
        controller.eventName,
        controller.eventDesc
      ],
      onTap: () {
        formKey.currentState!.save();
        if (formKey.currentState!.validate())
          controller.onboardingApi(OnBoardingMethod.api8);
      },
      enabled: controller.servingTime.value != 00 &&
          controller.recurrenceTime != null &&
          // controller.selectedRecurrence.isNotEmpty &&
          controller.eendTimeTod != currentTime &&
          controller.estartTimeTod != currentTime,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
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

                Column(
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
                                            title:
                                                Text(e.toString() + " Minutes"),
                                            onTap: () {
                                              setState(() {
                                                controller.servingTime.value =
                                                    e;
                                              });

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
                          borderRadius: BorderRadius.all(Radius.circular(6)),
                          border: Border.all(
                            width: 1,
                            color: controller.servingTime.value == 0
                                ? MyTheme.borderColor
                                : MyTheme.borderchangeColor,
                            style: BorderStyle.solid,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Obx(
                              () =>
                                  Text(controller.servingTime.value.toString(),
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.inter(
                                        fontSize: 16,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w500,
                                        color:
                                            controller.servingTime.value == 00
                                                ? MyTheme.hinttextColor
                                                : MyTheme.hinttextchangeColor,
                                      )),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              'mins',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.inter(
                                fontSize: 16,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w500,
                                color: controller.servingTime.value == 00
                                    ? MyTheme.hinttextColor
                                    : MyTheme.checkboxtextColor,
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
                      style: GoogleFonts.poppins(
                        fontSize: 9,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.normal,
                        color: MyTheme.bottomtextColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                AppFormField(
                  title: 'Maximum orders per day',
                  hintText: '100',
                  hintfontSize: 15,
                  inputType: TextInputType.number,
                  controller: controller.maxOrders,
                ),

                SizedBox(
                  height: 15,
                ),

                AppFormField(
                  title: 'Allows orders for days in advance',
                  hintText: '7',
                  hintfontSize: 15,
                  inputType: TextInputType.number,
                  controller: controller.advanceOrders,
                ),

                SizedBox(
                  height: 15,
                ),
                FieldTitle(
                  text: 'Recurring events (optional)',
                  required: false,
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),

                SizedBox(
                  height: 5,
                ),
                // Row(
                //   children: [
                //     Expanded(
                //       child:
                // Column(
                //   crossAxisAlignment: CrossAxisAlignment.start,
                //   children: [
                InkWell(
                  onTap: () {
                    showEventDate();
                  },
                  child: Container(
                    height: 45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(6)),
                      border: Border.all(
                        width: 1,
                        color: controller.recurrenceTime == null
                            ? MyTheme.borderColor
                            : MyTheme.borderchangeColor,
                        style: BorderStyle.solid,
                      ),
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(left: 14),
                            child: Text(
                              controller.recurrenceTime == null
                                  ? 'Event Dates'
                                  : '${controller.recurrenceTime!.year}/${controller.recurrenceTime!.month}/${controller.recurrenceTime!.day}',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.inter(
                                fontSize: 16,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w500,
                                color: controller.recurrenceTime == null
                                    ? MyTheme.hinttextColor
                                    : MyTheme.hinttextchangeColor,
                              ),
                            ),
                          ),
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(right: 7.5),
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
                ),
                SizedBox(
                  height: 3,
                ),
                Text(
                  'Select Event Dates',
                  style: GoogleFonts.poppins(
                    fontSize: 9,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.normal,
                    color: MyTheme.bottomtextColor,
                  ),
                ),
                //   ],
                // ),
                // ),
                // SizedBox(
                //   width: 18,
                // ),
                // Expanded(
                //   child: Column(
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: [
                //       Container(
                //         height: 45,
                //         decoration: BoxDecoration(
                //           borderRadius:
                //               BorderRadius.all(Radius.circular(6)),
                //           border: Border.all(
                //             width: 1,
                //             color: controller.selectedRecurrence.value == ""
                //                 ? MyTheme.borderColor
                //                 : MyTheme.borderchangeColor,
                //             style: BorderStyle.solid,
                //           ),
                //         ),
                //         child: InkWell(
                //           onTap: () {
                //             Get.bottomSheet(BottomSheet(
                //               onClosing: () {},
                //               builder: (context) {
                //                 return Card(
                //                     margin: EdgeInsets.zero,
                //                     child: ListView(
                //                       shrinkWrap: true,
                //                       children:
                //                           ["Yearly", "Monthly", "Weekly"]
                //                               .map((e) => ListTile(
                //                                     title: Text(e),
                //                                     onTap: () {
                //                                       controller
                //                                           .selectedRecurrence
                //                                           .value = e;
                //                                       setState(() {});

                //                                       Get.back();
                //                                     },
                //                                   ))
                //                               .toList(),
                //                     ));
                //               },
                //             ));
                //           },
                //           child: Center(
                //             child: Row(
                //               mainAxisAlignment:
                //                   MainAxisAlignment.spaceBetween,
                //               children: [
                //                 Spacer(),
                //                 Padding(
                //                   padding: const EdgeInsets.only(left: 14),
                //                   child: Obx(
                //                     () => Text(
                //                       controller.selectedRecurrence.value ==
                //                               ''
                //                           ? 'Monthly'
                //                           : controller
                //                               .selectedRecurrence.value,
                //                       style: GoogleFonts.inter(
                //                         fontSize: 16,
                //                         fontStyle: FontStyle.normal,
                //                         fontWeight: FontWeight.w500,
                //                         color: controller.selectedRecurrence
                //                                 .value.isEmpty
                //                             ? MyTheme.hinttextColor
                //                             : MyTheme.hinttextchangeColor,
                //                       ),
                //                     ),
                //                   ),
                //                 ),
                //                 Spacer(),
                //                 Padding(
                //                   padding:
                //                       const EdgeInsets.only(right: 7.5),
                //                   child: InkWell(
                //                     onTap: () {
                //                       /*             Get.bottomSheet(BottomSheet(
                //                         onClosing: () {},
                //                         builder: (context) {
                //                           return Card(
                //                               margin: EdgeInsets.zero,
                //                               child: ListView(
                //                                 shrinkWrap: true,
                //                                 children: [
                //                                   "Yearly",
                //                                   "Monthly",
                //                                   "Weekly"
                //                                 ]
                //                                     .map((e) => ListTile(
                //                                           title: Text(
                //                                             e,
                //                                           ),
                //                                           onTap: () {
                //                                             controller
                //                                                 .selectedRecurrence
                //                                                 .value = e;
                //                                             setState(() {
                //                                               rec = controller
                //                                                   .selectedRecurrence
                //                                                   .value
                //                                                   .toString();
                //                                             });

                //                                             Get.back();
                //                                           },
                //                                         ))
                //                                     .toList(),
                //                               ));
                //                         },
                //                       )); */
                //                     },
                //                     child: Container(
                //                       width: 20,
                //                       height: 20,
                //                       child: Image(
                //                           image: AssetImage(
                //                               'assets/images/calendar.png')),
                //                     ),
                //                   ),
                //                 ),
                //               ],
                //             ),
                //           ),
                //         ),
                //       ),
                //       SizedBox(
                //         height: 3,
                //       ),
                //       Text(
                //         'Recurrance frequency',
                //         style: GoogleFonts.poppins(
                //           fontSize: 9,
                //           fontStyle: FontStyle.normal,
                //           fontWeight: FontWeight.normal,
                //           color: MyTheme.bottomtextColor,
                //         ),
                //       )
                //     ],
                //   ),
                // ),
                // ],
                // ),
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
                          InkWell(
                            onTap: () {
                              _selectStartTime(context);
                            },
                            child: Container(
                              height: 45,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(6)),
                                border: Border.all(
                                  width: 1,
                                  color: controller.estartTimeTod == null
                                      ? MyTheme.borderColor
                                      : MyTheme.borderchangeColor,
                                  style: BorderStyle.solid,
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  controller.estartTimeTod == null
                                      ? '${currentTime.format(context)}'
                                      : '${controller.estartTimeTod!.format(context)}',
                                  style: GoogleFonts.inter(
                                    fontSize: 16,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w500,
                                    color: controller.estartTimeTod == null
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
                            style: GoogleFonts.poppins(
                              fontSize: 9,
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
                          InkWell(
                            onTap: () {
                              _selectEndTime(context);
                            },
                            child: Container(
                              height: 45,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(6)),
                                border: Border.all(
                                  width: 1,
                                  color: controller.eendTimeTod == null
                                      ? MyTheme.borderColor
                                      : MyTheme.borderchangeColor,
                                  style: BorderStyle.solid,
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  controller.eendTimeTod == null
                                      ? '${currentTime.format(context)}'
                                      : '${controller.eendTimeTod!.format(context)}',
                                  style: GoogleFonts.inter(
                                    fontSize: 16,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w500,
                                    color: controller.eendTimeTod == null
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
                            style: GoogleFonts.poppins(
                              fontSize: 9,
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
                AppFormField(
                  title: 'Event Name',
                  hintText: 'Event Name',
                  hintfontSize: 15,
                  isRequired: false,
                  controller: controller.eventName,
                ),

                SizedBox(
                  height: 15,
                ),

                AppFormField(
                  line: 4,
                  title: 'Event Description',
                  hintText: 'Event Description',
                  hintfontSize: 15,
                  isRequired: false,
                  controller: controller.eventDesc,
                  bottomText: 'Max 20 words',
                ),

                SizedBox(
                  height: 22,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
