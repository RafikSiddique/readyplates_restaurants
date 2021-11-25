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
  String rec = '';

  DateTime? _selectedEventDate;
  void showEventDate() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2021),
      lastDate: DateTime(2050),
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
        controller.startTime = PickedTime!.format(context);
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
        controller.endTime = PickedTime1!.format(context);
      });
    }
  }



  @override
  Widget build(BuildContext context) {
    return OnBoardingWrapper(
      appBarTitle: 'Restaurant Bio',
      onboardingController: controller,
      buttonText: 'CONTINUE',
      textControllers: [controller.resDescript, controller.eventDesc],
      onTap: () {
        formKey.currentState!.save();
        if (formKey.currentState!.validate())
          controller.onboardingApi(OnBoardingMethod.api8);
      },
      enabled: controller.servingTime.value != 00 &&
          controller.tableTurnTime.value != 00 &&
          _selectedEventDate != null &&
          rec.isNotEmpty &&
          PickedTime != null &&
          PickedTime1 != null,
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

                Row(
                  children: [
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
                                                    setState(() {
                                                      controller.servingTime
                                                          .value = e;
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
                                borderRadius:
                                    BorderRadius.all(Radius.circular(6)),
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
                                    () => Text(
                                        controller.servingTime.value.toString(),
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
                    ),
                    SizedBox(
                      width: 18,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FieldTitle(
                            text: 'Table turn time',
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
                                        children: List.generate(8, (index) {
                                          return (index + 1) * 15;
                                        })
                                            .map((e) => ListTile(
                                                  title: Text(e.toString() +
                                                      " Minutes"),
                                                  onTap: () {
                                                    setState(() {
                                                      controller.tableTurnTime
                                                          .value = e;
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
                                borderRadius:
                                    BorderRadius.all(Radius.circular(6)),
                                border: Border.all(
                                  width: 1,
                                  color: controller.tableTurnTime.value == 0
                                      ? MyTheme.borderColor
                                      : MyTheme.borderchangeColor,
                                  style: BorderStyle.solid,
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Obx(
                                    () => Text(
                                        controller.tableTurnTime.value
                                            .toString(),
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.inter(
                                          fontSize: 16,
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.w500,
                                          color:
                                              controller.tableTurnTime.value ==
                                                      00
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
                                      color:
                                          controller.tableTurnTime.value == 00
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
                            'Select average table allocation time',
                            style: GoogleFonts.poppins(
                              fontSize: 9,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.normal,
                              color: MyTheme.bottomtextColor,
                            ),
                          ),
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
                          InkWell(
                            onTap: () {
                              showEventDate();
                            },
                            child: Container(
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
                                    Spacer(),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 14),
                                      child: Text(
                                        _selectedEventDate == null
                                            ? 'Event Dates'
                                            : '${_selectedEventDate!.year}/${_selectedEventDate!.month}/${_selectedEventDate!.day}',
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.inter(
                                          fontSize: 16,
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.w500,
                                          color: _selectedEventDate == null
                                              ? MyTheme.hinttextColor
                                              : MyTheme.hinttextchangeColor,
                                        ),
                                      ),
                                    ),
                                    Spacer(),
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
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Text('Select Event Dates',
                              style: GoogleFonts.poppins(
                                fontSize: 9,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.normal,
                                color: MyTheme.bottomtextColor,
                              ))
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
                                                                .selectedRecurrence
                                                                .value
                                                                .toString();
                                                          });

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
                                    Spacer(),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 14),
                                      child: Obx(
                                        () => Text(
                                          controller.selectedRecurrence.value,
                                          style: GoogleFonts.inter(
                                            fontSize: 16,
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w500,
                                            color: rec == ''
                                                ? MyTheme.hinttextColor
                                                : MyTheme.hinttextchangeColor,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Spacer(),
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
                                                              title: Text(
                                                                e,
                                                              ),
                                                              onTap: () {
                                                                controller
                                                                    .selectedRecurrence
                                                                    .value = e;
                                                                setState(() {
                                                                  rec = controller
                                                                      .selectedRecurrence
                                                                      .value
                                                                      .toString();
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
                                  color: PickedTime == null
                                      ? MyTheme.borderColor
                                      : MyTheme.borderchangeColor,
                                  style: BorderStyle.solid,
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  PickedTime == null
                                      ? '${currentTime.format(context)}'
                                      : '${currentTime.format(context)}',
                                  style: GoogleFonts.inter(
                                    fontSize: 16,
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
                                  color: PickedTime1 == null
                                      ? MyTheme.borderColor
                                      : MyTheme.borderchangeColor,
                                  style: BorderStyle.solid,
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  PickedTime1 == null
                                      ? '${currentTime1.format(context)}'
                                      : '${currentTime1.format(context)}',
                                  style: GoogleFonts.inter(
                                    fontSize: 16,
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
                  height: 5,
                ),
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

                SizedBox(
                  height: 16,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
