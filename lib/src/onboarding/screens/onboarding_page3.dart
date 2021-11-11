import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readyplates_restaurants/src/onboarding/onboarding_controller.dart';
import 'package:readyplates_restaurants/utils/my_color.dart';
import 'package:readyplates_restaurants/widgets/field_title.dart';
import 'package:readyplates_restaurants/widgets/form_field.dart';
import 'package:readyplates_restaurants/widgets/onboardingWrapper.dart';
import 'package:readyplates_restaurants/widgets/onboardingbutton.dart';
import 'package:readyplates_restaurants/widgets/timezone.dart';

class OnboardingPage3 extends StatefulWidget {
  static const id = "/onboarding3";
  const OnboardingPage3({Key? key}) : super(key: key);

  @override
  State<OnboardingPage3> createState() => _OnboardingPage3State();
}

class _OnboardingPage3State extends State<OnboardingPage3> {
  final controller = Get.find<OnboardingController>();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return OnBoardingWrapper(
      appBarTitle: 'Account Settings',
      onboardingController: controller,
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.only(left: 17, right: 17),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 14),
                AppFormField(
                  title: "Legal Entity Account Number",
                  hintText: "511122266514782",
                  hintfontSize: 15,
                  controller: controller.accNumber,
                  bottomText: 'Please enter a valid Account Number',
                ),
                SizedBox(height: 14),

                AppFormField(
                  title: 'Account Name',
                  hintText: "Youraccountname",
                  hintfontSize: 15,
                  controller: controller.accName,
                ),

                SizedBox(height: 14),
                // address
                AppFormField(
                  title: "Business Address",
                  hintText: "Address Line 1",
                  hintfontSize: 15,
                  controller: controller.addline1,
                  isRequired: false,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(6)),
                ),

                AppFormField(
                  title: '',
                  hintText: "Address Line 2",
                  hintfontSize: 15,
                  controller: controller.addline2,
                  isRequired: false,
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(0)),
                ),

                AppFormField(
                  title: '',
                  hintText: "Address Line 3",
                  hintfontSize: 15,
                  controller: controller.addline3,
                  isRequired: false,
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(0)),
                ),
                AppFormField(
                  title: '',
                  hintText: "State",
                  hintfontSize: 15,
                  controller: controller.state,
                  isRequired: false,
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(0)),
                ),
                AppFormField(
                  title: '',
                  hintText: "City",
                  hintfontSize: 15,
                  controller: controller.city,
                  isRequired: false,
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(0)),
                ),
                AppFormField(
                  title: '',
                  hintText: "Pin Code",
                  hintfontSize: 15,
                  controller: controller.pincode,
                  isRequired: false,
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(6)),
                ),
                SizedBox(height: 14),
                FieldTitle(
                  text: 'Phone Verification',
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
                      color: controller.phoneveify.text.isEmpty
                          ? MyTheme.borderColor
                          : MyTheme.borderchangeColor,
                    ),
                  ),
                  child: TextFormField(
                    style: GoogleFonts.inter(
                      fontSize: 15,
                      color: MyTheme.hinttextchangeColor,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w500,
                    ),
                    controller: controller.phoneveify,
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
                                  color: controller.phoneveify.text.isEmpty
                                      ? MyTheme.borderColor
                                      : MyTheme.borderchangeColor,
                                ),
                              ),
                            ),
                            TextButton(
                              child: Padding(
                                padding: EdgeInsets.only(right: 20, left: 20),
                                child: Text(
                                  'Verify',
                                  style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.normal,
                                    fontFamily: 'Inter',
                                    fontSize: 15,
                                    color: MyTheme.verifytextColor,
                                  ),
                                ),
                              ),
                              onPressed: () {},
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
                  height: 2.56,
                ),
                Text(
                  controller.phoneveify.text.isEmpty
                      ? 'Tap “Verify” button after entering phone number'
                      : 'Press “Verify” to authenticate mobile number',
                  style: GoogleFonts.poppins(
                    fontSize: 9,
                    fontWeight: FontWeight.normal,
                    fontStyle: FontStyle.normal,
                    color: controller.phoneveify.text.isEmpty
                        ? MyTheme.bottomtextColor
                        : MyTheme.starColor,
                  ),
                ),
                SizedBox(
                  height: 14,
                ),
                FieldTitle(
                  text: "Time Zone",
                  fontFamily: 'Inter-Regular',
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
                SizedBox(
                  height: 5,
                ),
                TimeZone(
                  onSelect: (p0) {
                    controller.timezone.value = p0!;
                    setState(() {});
                  },
                  color: controller.timezone == ""
                      ? MyTheme.borderColor
                      : MyTheme.borderchangeColor,
                ),

                SizedBox(
                  height: 14,
                ),

                OnboardingButton(
                  onTap: () {
                    print(controller.expiry);
                    formKey.currentState!.save();
                    if (formKey.currentState!.validate())
                      controller.onboardingApi(OnBoardingMethod.api3);
                  },
                  buttonbackgroundColor: (controller.accNumber.text.isEmpty ||
                          controller.accName.text.isEmpty ||
                          controller.addline1.text.isEmpty ||
                          controller.addline2.text.isEmpty ||
                          controller.addline3.text.isEmpty ||
                          controller.state.text.isEmpty ||
                          controller.city.text.isEmpty ||
                          controller.pincode.text.isEmpty ||
                          controller.phoneveify.text.isEmpty ||
                          controller.timezone.isEmpty)
                      ? MyTheme.buttonColor
                      : MyTheme.buttonchangeColor,
                  text: 'CONTINUE',
                  buttontextColor: (controller.accNumber.text.isEmpty ||
                          controller.accName.text.isEmpty ||
                          controller.addline1.text.isEmpty ||
                          controller.addline2.text.isEmpty ||
                          controller.addline3.text.isEmpty ||
                          controller.state.text.isEmpty ||
                          controller.city.text.isEmpty ||
                          controller.pincode.text.isEmpty ||
                          controller.phoneveify.text.isEmpty ||
                          controller.timezone.isEmpty)
                      ? MyTheme.buttontextColor
                      : MyTheme.buttontextchangeColor,
                ),
                SizedBox(
                  height: 6.87,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
