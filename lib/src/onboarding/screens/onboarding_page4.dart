import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readyplates_restaurants/src/onboarding/onboarding_controller.dart';
import 'package:readyplates_restaurants/utils/my_color.dart';
import 'package:readyplates_restaurants/widgets/field_title.dart';
import 'package:readyplates_restaurants/widgets/form_field.dart';
import 'package:readyplates_restaurants/widgets/onboardingWrapper.dart';
import 'package:readyplates_restaurants/widgets/onboardingbutton.dart';

class OnboardingPage4 extends StatefulWidget {
  static const id = "/onboarding4";
  const OnboardingPage4({Key? key}) : super(key: key);

  @override
  State<OnboardingPage4> createState() => _OnboardingPage4State();
}

class _OnboardingPage4State extends State<OnboardingPage4> {
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
      appBarTitle: 'Public Business Information',
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 22,
                ),
                AppFormField(
                  title: "Public Business Name",
                  hintText: "Nevada Fast Food Inc.",
                  hintfontSize: 15,
                  controller: controller.gstpresent,
                  bottomText:
                      'Your public business name may be used on invoices and receipts. Please make sure it’s correct',
                ),
                SizedBox(
                  height: 22,
                ),
                AppFormField(
                  title: "Support Email",
                  hintText: "contactus@nevadafastfoods.com",
                  hintfontSize: 15,
                  controller: controller.gstpresent,
                ),
                SizedBox(
                  height: 22,
                ),
                FieldTitle(
                  text: 'Support Phone Number',
                  fontFamily: 'Inter-Regular',
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(6.0),
                    ),
                    border: Border.all(
                      width: 1,
                      color: controller.ownMobile.text.isEmpty
                          ? MyTheme.borderColor
                          : MyTheme.borderchangeColor,
                    ),
                  ),
                  child: TextFormField(
                    controller: controller.ownMobile,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.left,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      hintText: '+1 415 569 2700',
                      suffixIcon: Container(
                        width: 115,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              height: 35,
                              width: 0,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 1,
                                  color: controller.ownMobile.text.isEmpty
                                      ? MyTheme.borderColor
                                      : MyTheme.borderchangeColor,
                                ),
                              ),
                            ),
                            Container(
                              width: 100,
                              // height: 45,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(6.0),
                                ),
                              ),
                              child: DropdownButtonFormField<String>(
                                isExpanded: true,
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
                                  hintText: 'US',
                                  contentPadding: EdgeInsets.only(
                                    left: 14,
                                    top: 14,
                                  ),
                                  hintStyle: GoogleFonts.inter(
                                    fontSize: 15,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w500,
                                    color: controller
                                            .typeOfEstablishment.value.isEmpty
                                        ? MyTheme.hinttextColor
                                        : MyTheme.hinttextchangeColor,
                                  ),
                                ),
                                items: controller.typeOfEsts
                                    .map(
                                      (e) => DropdownMenuItem(
                                          child: Text(e), value: e),
                                    )
                                    .toList(),
                                // value: controller.typeOfEstablishment.value,
                                onChanged: (newValue) {
                                  setState(() {
                                    controller.typeOfEstablishment.value =
                                        newValue!;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      contentPadding:
                          EdgeInsets.only(left: 14, top: 14, right: 24),
                      hintStyle: TextStyle(
                        fontSize: 15,
                        color: MyTheme.hinttextColor,
                        fontFamily: 'Inter-Regular',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 22,
                ),
                FieldTitle(
                  text: "Support Phone Number",
                  fontFamily: 'Inter-Regular',
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
                SizedBox(
                  height: 22,
                ),
                AppFormField(
                  title: "Support Address",
                  hintText: "Address Line 1",
                  hintfontSize: 15,
                  controller: controller.address1,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(6)),
                ),
                AppFormField(
                  title: '',
                  hintText: "Address Line 2",
                  hintfontSize: 15,
                  controller: controller.address2,
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(0)),
                ),
                AppFormField(
                  title: '',
                  hintText: "Address Line 3",
                  hintfontSize: 15,
                  controller: controller.address2,
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(0)),
                ),
                AppFormField(
                  title: '',
                  hintText: "State",
                  hintfontSize: 15,
                  controller: controller.address2,
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(0)),
                ),
                AppFormField(
                  title: '',
                  hintText: "City",
                  hintfontSize: 15,
                  controller: controller.address2,
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(0)),
                ),
                AppFormField(
                  title: '',
                  hintText: "Pin Code",
                  hintfontSize: 15,
                  controller: controller.nearbylandnark,
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(6)),
                ),
                SizedBox(
                  height: 22,
                ),
                OnboardingButton(
                  onTap: () {
                    formKey.currentState!.save();
                    if (formKey.currentState!.validate())
                      controller.onboardingApi(OnBoardingMethod.api4);
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
                  height: 4.89,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
