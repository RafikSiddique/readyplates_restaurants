import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:readyplates_restaurants/src/onboarding/onboarding_controller.dart';
import 'package:readyplates_restaurants/utils/my_color.dart';
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
              letterSpacing: -0.226667,
              color: MyTheme.appbartextColor,
            ),
          ),
        ),
        body: SingleChildScrollView(
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
                    hintText: "Snack Shack Fast Food Restaurant",
                    hintfontSize: 15,
                    controller: controller.resNameController,
                    validator: (p0) {
                      if (p0 == null ||
                          p0 != controller.resNameController.text) {
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
                    controller: controller.firstNameController,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(6)),
                  ),
                  AppFormField(
                    title: '',
                    hintText: "Last Name",
                    hintfontSize: 15,
                    controller: controller.lastNameController,
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
                    controller: controller.ownemailController,
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  FieldTitle(
                    text: 'Owner Mobile Number',
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    // height: 45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(6.0),
                      ),
                      border: Border.all(
                        width: 1,
                        color: controller.ownMobileController.text.isEmpty
                            ? MyTheme.borderColor
                            : MyTheme.borderchangeColor,
                      ),
                    ),
                    child: TextFormField(
                      controller: controller.ownMobileController,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.left,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          // borderSide:
                          //     BorderSide(width: 1, color: Color(0xffE0E0E0)),
                          // borderRadius: BorderRadius.all(
                          //   Radius.circular(6.0),
                          // ),
                        ),
                        hintText: '+91 XXXXXXXXXX',
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
                                    color: controller
                                            .ownMobileController.text.isEmpty
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
                                      color: controller
                                              .ownMobileController.text.isEmpty
                                          ? MyTheme.verifytextColor
                                          : MyTheme.verifytextchngeColor,
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
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Text(
                    'Will be used to make all future correspondence/communications',
                    style: TextStyle(
                      fontSize: 9,
                      color: MyTheme.bottomtextColor,
                    ),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  FieldTitle(
                    text: 'Restaurant City',
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    // height: 45,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color: controller.ownMobileController.text.isEmpty
                            ? MyTheme.borderColor
                            : MyTheme.borderchangeColor,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(6.0),
                      ),
                    ),
                    child: DropdownButtonFormField(
                      icon: Padding(
                        padding: const EdgeInsets.only(
                          right: 12.21,
                        ),
                        child: FaIcon(
                          FontAwesomeIcons.chevronDown,
                          color: MyTheme.iconColor,
                          size: 14.83,
                        ),
                      ),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          // borderRadius: BorderRadius.all(
                          //   Radius.circular(6.0),
                          // ),
                        ),
                        hintText: 'Select City',
                        contentPadding: EdgeInsets.only(
                          left: 14,
                          top: 14,
                        ),
                        hintStyle: TextStyle(
                          fontSize: 15,
                          color: MyTheme.hinttextColor,
                        ),
                      ),
                      items: [
                        DropdownMenuItem(
                            child: Text("Mumbai"), value: "Mumbai"),
                        DropdownMenuItem(child: Text("Pune"), value: "Pune"),
                      ],
                      onChanged: (newValue) {
                        setState(() {
                          controller.rescity = newValue.toString();

                          print(newValue);
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  AppFormField(
                    title: "Restaurant Point of Contact (POC)",
                    hintText: "Owner/Co-Owner/Manager etc",
                    hintfontSize: 15,
                    controller: controller.pocController,
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  AppFormField(
                    title: "Restaurant POC Mobile Number",
                    hintText: "+91 XXXXXXXXXX",
                    hintfontSize: 15,
                    controller: controller.pocNumberController,
                    inputType: TextInputType.number,
                    formatters: [FilteringTextInputFormatter.digitsOnly],
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  InkWell(
                    onTap: () async {
                      formKey.currentState!.save();
                      if (formKey.currentState!.validate())
                        controller.onboardingApi(OnBoardingMethod.api1);
                    },
                    child: Container(
                      height: 40.11,
                      decoration: BoxDecoration(
                        color: (controller.resNameController.text.isEmpty &&
                                controller.firstNameController.text.isEmpty &&
                                controller.lastNameController.text.isEmpty)
                            ? MyTheme.buttonColor
                            : MyTheme.buttonchangeColor,
                        borderRadius: BorderRadius.all(Radius.circular(6)),
                      ),
                      child: Center(
                        child: Text(
                          'CONTINUE',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                            letterSpacing: -0.28,
                            color: MyTheme.buttontextColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 7.89,
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
