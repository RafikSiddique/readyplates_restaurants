import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readyplates_restaurants/src/onboarding/onboarding_controller.dart';
import 'package:readyplates_restaurants/widgets/form_field.dart';
import 'package:readyplates_restaurants/widgets/onboardingWrapper.dart';

class OnboardingPage5 extends StatefulWidget {
  static const id = "/onboarding5";
  const OnboardingPage5({Key? key}) : super(key: key);

  @override
  State<OnboardingPage5> createState() => _OnboardingPage5State();
}

class _OnboardingPage5State extends State<OnboardingPage5> {
  final controller = Get.find<OnboardingController>();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return OnBoardingWrapper(
      appBarTitle: 'Public Business Information',
      onboardingController: controller,
      buttonText: 'CONTINUE',
      onTap: () {
        formKey.currentState!.save();
        if (formKey.currentState!.validate())
          controller.onboardingApi(OnBoardingMethod.api5);
        // Get.toNamed(OnboardingPage6.id);
      },
      textControllers: [
        controller.statementDescriptor,
        controller.shortenedDescriptor,
        controller.businessWeb,
        controller.supportWeb,
        controller.privacy,
        controller.termServices,
        controller.fsolNumber,
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
                  height: 17,
                ),
                AppFormField(
                  title: 'Statement Descriptor',
                  hintText: 'nevadafastfood.com',
                  hintfontSize: 15,
                  bottomText:
                      "This is the business name that will show up on the customer’s bank or credit card statements Choose something they will recognize to help prevent disputes",
                  controller: controller.statementDescriptor,
                ),
                SizedBox(
                  height: 17,
                ),
                AppFormField(
                  title: 'Shortened Descriptor',
                  hintText: 'NEVADAFASTFOOD',
                  hintfontSize: 15,
                  controller: controller.shortenedDescriptor,
                ),
                SizedBox(
                  height: 17,
                ),
                AppFormField(
                  isUrl: true,
                  title: 'Business Website',
                  hintText: 'http://nevadafastfoods.com/',
                  hintfontSize: 15,
                  controller: controller.businessWeb,
                  isRequired: false,
                ),
                SizedBox(
                  height: 17,
                ),
                AppFormField(
                  isUrl: true,
                  title: 'Support Website',
                  hintText: 'http://nevadafastfoods.com/',
                  hintfontSize: 15,
                  controller: controller.supportWeb,
                  isRequired: false,
                ),
                SizedBox(
                  height: 17,
                ),
                AppFormField(
                  isUrl: true,
                  title: 'Privacy Policy',
                  hintText: 'http://nevadafastfoods.com/privacypolicy',
                  hintfontSize: 15,
                  isRequired: false,
                  controller: controller.privacy,
                ),
                SizedBox(
                  height: 17,
                ),
                AppFormField(
                  title: 'Terms of Service',
                  hintText: 'http://nevadafastfoods.com/termsofservice',
                  hintfontSize: 15,
                  isUrl: true,
                  isRequired: false,
                  controller: controller.termServices,
                ),
                SizedBox(
                  height: 17,
                ),
                AppFormField(
                  title: 'FSOL License Number',
                  hintText: '67534289110934',
                  hintfontSize: 15,
                  isUrl: false,
                  isRequired: true,
                  controller: controller.fsolNumber,
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
