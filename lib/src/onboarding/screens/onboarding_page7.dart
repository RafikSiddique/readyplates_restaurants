import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readyplates_restaurants/src/onboarding/onboarding_controller.dart';
import 'package:readyplates_restaurants/src/onboarding/screens/index.dart';
import 'package:readyplates_restaurants/utils/my_color.dart';
import 'package:readyplates_restaurants/widgets/field_title.dart';
import 'package:readyplates_restaurants/widgets/onboardingWrapper.dart';
import 'package:readyplates_restaurants/widgets/onboardingbutton.dart';

class OnboardingPage7 extends StatefulWidget {
  static const id = "/onboarding7";
  const OnboardingPage7({Key? key}) : super(key: key);

  @override
  State<OnboardingPage7> createState() => _OnboardingPage7State();
}

class _OnboardingPage7State extends State<OnboardingPage7> {
  final controller = Get.find<OnboardingController>();
  final formKey = GlobalKey<FormState>();

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
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return OnBoardingWrapper(
      onboardingController: controller,
      appBarTitle: 'Partner Onboarding',
      child: Padding(
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
                      hintStyle: GoogleFonts.inter(
                        fontSize: 15,
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
                                            controller.chooseCategory
                                                .contains(category);
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
                                        style: GoogleFonts.inter(
                                          fontSize: controller.chooseCategory
                                                      .contains(category) ==
                                                  true
                                              ? 15
                                              : 13,
                                          fontStyle: FontStyle.normal,
                                          fontWeight: controller.chooseCategory
                                                      .contains(category) ==
                                                  true
                                              ? FontWeight.w600
                                              : FontWeight.normal,
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
                  style: GoogleFonts.poppins(
                    fontSize: 9,
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
                                  style: GoogleFonts.inter(
                                    fontSize: PickedTime == null ? 16 : 18,
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
                                  style: GoogleFonts.inter(
                                    fontSize: PickedTime1 == null ? 16 : 18,
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
                                              MaterialTapTargetSize.shrinkWrap,
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
                                              controller.chooseDays
                                                  .contains(days);
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
                                          style: GoogleFonts.inter(
                                            fontSize: controller.chooseDays
                                                        .contains(days) ==
                                                    true
                                                ? 15
                                                : 13,
                                            fontStyle: FontStyle.normal,
                                            fontWeight: controller.chooseDays
                                                        .contains(days) ==
                                                    true
                                                ? FontWeight.w600
                                                : FontWeight.normal,
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
                OnboardingButton(
                  onTap: () {
                    formKey.currentState!.save();
                    if (formKey.currentState!.validate())
                      controller.onboardingApi(OnBoardingMethod.api4);
                    // Get.toNamed(OnboardingPage8.resId);
                  },
                  buttonbackgroundColor:
                      (controller.typeOfEstablishment.value.isEmpty ||
                              controller.isChecked == false ||
                              PickedTime == null ||
                              PickedTime1 == null ||
                              controller.isDays == false)
                          ? MyTheme.buttonColor
                          : MyTheme.buttonchangeColor,
                  text: 'CONTINUE',
                  buttontextColor:
                      (controller.typeOfEstablishment.value.isEmpty ||
                              controller.isChecked == false ||
                              PickedTime == null ||
                              PickedTime1 == null ||
                              controller.isDays == false)
                          ? MyTheme.buttontextColor
                          : MyTheme.buttontextchangeColor,
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
