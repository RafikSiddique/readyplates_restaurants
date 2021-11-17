import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readyplates_restaurants/src/onboarding/onboarding_controller.dart';
import 'package:readyplates_restaurants/utils/my_color.dart';
import 'package:readyplates_restaurants/widgets/city_selector.dart';
import 'package:readyplates_restaurants/widgets/field_title.dart';
import 'package:readyplates_restaurants/widgets/form_field.dart';
import 'package:readyplates_restaurants/widgets/onboardingWrapper.dart';

class OnboardingPage1 extends StatefulWidget {
  static const id = "/onboarding1";

  @override
  _OnboardingPage1State createState() => _OnboardingPage1State();
}

class _OnboardingPage1State extends State<OnboardingPage1> {
  final controller = Get.find<OnboardingController>();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return OnBoardingWrapper(
      onboardingController: controller,
      appBarTitle: "Partner Onboarding",
      buttonText: 'CONTINUE',
      onTap: () {
        formKey.currentState!.save();
        if (formKey.currentState!.validate())
          controller.onboardingApi(OnBoardingMethod.api1);
      },
      textControllers: [
        controller.resName,
        controller.firstName,
        controller.lastName,
        controller.ownemail,
        controller.ownMobile,
        controller.poc,
        controller.pocNumber
      ],
      enabled: controller.rescity.isNotEmpty,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 8,
                ),
                AppFormField(
                  title: "Restaurant Name",
                  hintText: "Your Restaurant Name",
                  hintfontSize: 15,
                  controller: controller.resName,
                  validator: (p0) {
                    if (p0 == null || p0 != controller.resName.text) {
                      return "Account number does not match";
                    }
                  },
                ),
                SizedBox(
                  height: 18,
                ),
                AppFormField(
                  title: "Owner Name",
                  hintText: "First Name",
                  hintfontSize: 15,
                  controller: controller.firstName,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(6)),
                ),
                AppFormField(
                  title: '',
                  hintText: "Last Name",
                  hintfontSize: 15,
                  controller: controller.lastName,
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(6)),
                  bottomText:
                      'Make sure it matches the name on your government ID',
                ),
                SizedBox(
                  height: 18,
                ),
                AppFormField(
                  title: 'Owner Email ID',
                  hintText: 'username@aol.com',
                  hintfontSize: 15,
                  controller: controller.ownemail,
                ),
                SizedBox(
                  height: 18,
                ),
                FieldTitle(
                  text: 'Owner Mobile Number',
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
                    style: GoogleFonts.inter(
                      fontSize: 15,
                      color: MyTheme.hinttextchangeColor,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w500,
                    ),
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
                            TextButton(
                              child: Padding(
                                padding: EdgeInsets.only(right: 20, left: 20),
                                child: Text(
                                  'Verify',
                                  style: GoogleFonts.inter(
                                    decoration: TextDecoration.underline,
                                    fontWeight: FontWeight.bold,
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
                  height: 3,
                ),
                Text(
                  controller.ownMobile.text.isEmpty
                      ? 'Will be used to make all future correspondence/communications'
                      : 'Press “Verify” to authenticate mobile number',
                  style: GoogleFonts.poppins(
                    fontSize: 9,
                    fontWeight: FontWeight.normal,
                    fontStyle: FontStyle.normal,
                    color: controller.ownMobile.text.isEmpty
                        ? MyTheme.bottomtextColor
                        : MyTheme.starColor,
                  ),
                ),
                SizedBox(
                  height: 18,
                ),
                FieldTitle(
                  text: 'Restaurant City',
                  fontFamily: 'Inter-Regular',
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
                SizedBox(
                  height: 5,
                ),
                GestureDetector(
                  onTap: () async {
                    controller.rxStates
                        .sort((a, b) => a.name.compareTo(b.name));
                    await showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          content: CitySelectorSheet(),
                        );
                      },
                    );
                    setState(() {});
                  },
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color: controller.rescity.isEmpty
                            ? MyTheme.borderColor
                            : MyTheme.borderchangeColor,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(6.0),
                      ),
                    ),
                    child: Text(
                      controller.rescity == ""
                          ? "Select City"
                          : controller.rescity,
                      style: GoogleFonts.inter(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal,
                        color: controller.rescity == ""
                            ? MyTheme.hinttextColor
                            : MyTheme.hinttextchangeColor,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 18,
                ),
                AppFormField(
                  title: "Restaurant Point of Contact (POC)",
                  hintText: "Owner/Co-Owner/Manager etc",
                  hintfontSize: 15,
                  controller: controller.poc,
                ),
                SizedBox(
                  height: 18,
                ),
                AppFormField(
                  title: "Restaurant POC Mobile Number",
                  hintText: '+1 415 569 2700',
                  hintfontSize: 15,
                  controller: controller.pocNumber,
                  inputType: TextInputType.number,
                  formatters: [FilteringTextInputFormatter.digitsOnly],
                ),
                SizedBox(
                  height: 18,
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
