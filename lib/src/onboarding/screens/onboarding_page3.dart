import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readyplates_restaurants/src/onboarding/onboarding_controller.dart';
import 'package:readyplates_restaurants/utils/my_color.dart';
import 'package:readyplates_restaurants/widgets/field_title.dart';
import 'package:readyplates_restaurants/widgets/form_field.dart';
import 'package:readyplates_restaurants/widgets/onboardingWrapper.dart';
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
      textControllers: [
        controller.accNumber,
        controller.accName,
        controller.addline1,
        controller.addline2,
        controller.addline3,
        controller.state,
        controller.city,
        controller.pincode,
        controller.phoneveify,
      ],
      onTap: () {
        controller.businessaddline1 = TextEditingController();
        controller.businessaddline2 = TextEditingController();
        controller.businessaddline3 = TextEditingController();
        controller.businessstate = TextEditingController();
        controller.businesscity = TextEditingController();
        controller.businesspincode = TextEditingController();

        controller.businessaddline1.text = controller.addline1.text;
        controller.businessaddline2.text = controller.addline2.text;
        controller.businessaddline3.text = controller.addline3.text;
        controller.businessstate.text = controller.state.text;
        controller.businesscity.text = controller.city.text;
        controller.businesspincode.text = controller.pincode.text;
        // Get.toNamed(OnboardingPage4.id);
        formKey.currentState!.save();
        if (formKey.currentState!.validate())
          controller.onboardingApi(OnBoardingMethod.api3);
      },
      enabled: controller.timezone.isNotEmpty,
      buttonText: 'CONTINUE',
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
                  formatters: [FilteringTextInputFormatter.digitsOnly],
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
                ValueListenableBuilder<TextEditingValue>(
                    valueListenable: controller.phoneveify,
                    builder: (context, v, __) {
                      return Container(
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
                            errorStyle: TextStyle(
                              height: 1,
                              textBaseline: TextBaseline.ideographic,
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 1,
                                color: v.text != ""
                                    ? MyTheme.borderchangeColor
                                    : MyTheme.borderColor,
                              ),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 1,
                                color: v.text != ""
                                    ? MyTheme.borderchangeColor
                                    : MyTheme.borderColor,
                              ),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            counterText: "",
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
                                        width: 0.5,
                                        color: v.text != ""
                                            ? MyTheme.borderchangeColor
                                            : MyTheme.borderColor,
                                      ),
                                    ),
                                  ),
                                  TextButton(
                                    child: Padding(
                                      padding:
                                          EdgeInsets.only(right: 20, left: 20),
                                      child: Text(
                                        'Verify',
                                        style: GoogleFonts.inter(
                                          decoration: TextDecoration.underline,
                                          fontWeight: FontWeight.w500,
                                          fontStyle: FontStyle.normal,
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
                            hintStyle: GoogleFonts.inter(
                              fontSize: 15,
                              color: MyTheme.hinttextColor,
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.normal,
                            ),
                          ),
                        ),
                      );
                    }),
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
