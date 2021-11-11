import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:readyplates_restaurants/src/onboarding/onboarding_controller.dart';
import 'package:readyplates_restaurants/utils/my_color.dart';
import 'package:readyplates_restaurants/widgets/form_field.dart';
import 'package:readyplates_restaurants/widgets/onboardingWrapper.dart';
import 'package:readyplates_restaurants/widgets/onboardingbutton.dart';

class OnboardingPage5 extends StatefulWidget {
  static const id = "/onboarding5";
  const OnboardingPage5({Key? key}) : super(key: key);

  @override
  State<OnboardingPage5> createState() => _OnboardingPage5State();
}

class _OnboardingPage5State extends State<OnboardingPage5> {
  final controller = Get.find<OnboardingController>();
  final formKey = GlobalKey<FormState>();
  void openFile(PlatformFile file) {
    OpenFile.open(file.path!);
  }

  Future<File> saveFilePermanently(PlatformFile file) async {
    final appStorage = await getApplicationDocumentsDirectory();
    final newFile = File('${appStorage.path}/${file.name}');
    return File(file.path!).copy(newFile.path);
  }

  @override
  void initState() {
    controller.ac_number.addListener(() {
      setState(() {});
    });
    controller.reac_number.addListener(() {
      setState(() {});
    });
    controller.ifsc_code.addListener(() {
      setState(() {});
    });
    controller.pan_num.addListener(() {
      setState(() {});
    });
    controller.pan_name.addListener(() {
      setState(() {});
    });

    super.initState();
  }

  // @override
  // void dispose() {
  //   controller.ac_number.dispose();
  //   controller.reac_number.dispose();
  //   controller.ifsc_code.dispose();
  //   controller.pan_num.dispose();
  //   controller.pan_name.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return OnBoardingWrapper(
      appBarTitle: 'Public Business Information',
      onboardingController: controller,
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
                  isRequired: true,
                  controller: controller.fsolNumber,
                ),
                SizedBox(
                  height: 25,
                ),
                OnboardingButton(
                  onTap: () {
                    formKey.currentState!.save();
                    if (formKey.currentState!.validate())
                      controller.onboardingApi(OnBoardingMethod.api5);
                  },
                  buttonbackgroundColor:
                      (controller.statementDescriptor.text.isEmpty ||
                              controller.shortenedDescriptor.text.isEmpty ||
                              controller.businessWeb.text.isEmpty ||
                              controller.supportWeb.text.isEmpty ||
                              controller.privacy.text.isEmpty ||
                              controller.termServices.text.isEmpty ||
                              controller.fsolNumber.text.isEmpty)
                          ? MyTheme.buttonColor
                          : MyTheme.buttonchangeColor,
                  text: 'CONTINUE',
                  buttontextColor:
                      (controller.statementDescriptor.text.isEmpty ||
                              controller.shortenedDescriptor.text.isEmpty ||
                              controller.businessWeb.text.isEmpty ||
                              controller.supportWeb.text.isEmpty ||
                              controller.privacy.text.isEmpty ||
                              controller.termServices.text.isEmpty ||
                              controller.fsolNumber.text.isEmpty)
                          ? MyTheme.buttontextColor
                          : MyTheme.buttontextchangeColor,
                ),
                SizedBox(
                  height: 6,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
