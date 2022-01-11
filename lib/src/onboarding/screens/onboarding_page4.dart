import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readyplates_restaurants/src/onboarding/onboarding_controller.dart';
import 'package:readyplates_restaurants/utils/my_color.dart';
import 'package:readyplates_restaurants/widgets/field_title.dart';
import 'package:readyplates_restaurants/widgets/form_field.dart';
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
  bool _Switchvalue = true;

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;

    return OnBoardingWrapper(
      onboardingController: controller,
      appBarTitle: 'Public Business Information',
      buttonText: 'CONTINUE',
      onTap: () {
        formKey.currentState!.save();
        if (formKey.currentState!.validate())
          controller.onboardingApi(OnBoardingMethod.api4);
      },
      textControllers: [
        controller.pubbusinessName,
        controller.supportEmail,
        controller.supportNumber,
        controller.businessaddline1,
        controller.businessaddline2,
        controller.businessaddline3,
        controller.businessstate,
        controller.businesscity,
        controller.businesspincode,
      ],
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
                  controller: controller.pubbusinessName,
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
                  isEmail: true,
                  controller: controller.supportEmail,
                ),
                SizedBox(
                  height: 22,
                ),
                AppFormField(
                  title: "Support Phone Number",
                  hintText: '+1 808 569 2700',
                  controller: controller.supportNumber,
                  onSwitch: (Value) {
                    if (Value) {
                      controller.supportNumber.text =
                          controller.phoneveify.text;
                    } else {
                      controller.supportNumber.clear();
                    }
                  },
                  inputType: TextInputType.phone,
                ),
                SizedBox(
                  height: 22,
                ),
                Row(
                  children: [
                    FieldTitle(
                      text: "Support Phone Number",
                      fontFamily: 'Inter-Regular',
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                    Transform.scale(
                      scale: 0.6,
                      child: CupertinoSwitch(
                          thumbColor: Colors.white,
                          trackColor: MyTheme.switchButtonColor,
                          activeColor: MyTheme.switchButtonChangeColor,
                          value: _Switchvalue,
                          onChanged: (newValue) {
                            setState(() {
                              _Switchvalue = newValue;
                            });
                            if (newValue) {
                              controller.supportNumber.text =
                                  controller.phoneveify.text;
                            } else {
                              controller.supportNumber.clear();
                            }
                          }),
                    ),
                  ],
                ),
                SizedBox(
                  height: 22,
                ),
                AppFormField(
                  title: "Support Address",
                  hintText: "Address Line 1",
                  hintfontSize: 15,
                  controller: controller.businessaddline1,
                  onSwitch: (value) {
                    if (value) {
                      controller.businessaddline1.text =
                          controller.addline1.text;
                      controller.businessaddline2.text =
                          controller.addline2.text;
                      controller.businessaddline3.text =
                          controller.addline3.text;
                      controller.businessstate.text = controller.state.text;
                      controller.businesscity.text = controller.city.text;
                      controller.businesspincode.text = controller.pincode.text;
                    } else {
                      controller.businessaddline1.clear();
                      controller.businessaddline2.clear();
                      controller.businessaddline3.clear();
                      controller.businessstate.clear();
                      controller.businesscity.clear();
                      controller.businesspincode.clear();
                    }
                  },
                  borderRadius: BorderRadius.vertical(top: Radius.circular(6)),
                ),
                AppFormField(
                  title: '',
                  hintText: "Address Line 2",
                  hintfontSize: 15,
                  controller: controller.businessaddline2,
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(0)),
                ),
                AppFormField(
                  title: '',
                  hintText: "Address Line 3",
                  hintfontSize: 15,
                  controller: controller.businessaddline3,
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(0)),
                ),
                AppFormField(
                  title: '',
                  hintText: "State",
                  hintfontSize: 15,
                  controller: controller.businessstate,
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(0)),
                ),
                AppFormField(
                  title: '',
                  hintText: "City",
                  hintfontSize: 15,
                  controller: controller.businesscity,
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(0)),
                ),
                AppFormField(
                  title: '',
                  hintText: "Pin Code",
                  hintfontSize: 15,
                  controller: controller.businesspincode,
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(6)),
                  inputType: TextInputType.phone,
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
