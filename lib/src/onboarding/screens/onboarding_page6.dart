import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:open_file/open_file.dart';
import 'package:readyplates_restaurants/src/onboarding/onboarding_controller.dart';
import 'package:readyplates_restaurants/src/onboarding/screens/index.dart';
import 'package:readyplates_restaurants/utils/my_color.dart';
import 'package:readyplates_restaurants/widgets/business.dart';
import 'package:readyplates_restaurants/widgets/field_title.dart';
import 'package:readyplates_restaurants/widgets/file_picker.dart';
import 'package:readyplates_restaurants/widgets/form_field.dart';
import 'package:readyplates_restaurants/widgets/onboardingWrapper.dart';
import 'package:readyplates_restaurants/widgets/onboardingbutton.dart';

class OnboardingPage6 extends StatefulWidget {
  static const id = "/OnboardingPage6";
  const OnboardingPage6({Key? key}) : super(key: key);

  @override
  State<OnboardingPage6> createState() => _OnboardingPage6State();
}

class _OnboardingPage6State extends State<OnboardingPage6> {
  final controller = Get.find<OnboardingController>();
  final formKey = GlobalKey<FormState>();
  void openFile(PlatformFile file) {
    OpenFile.open(file.path!);
  }

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return OnBoardingWrapper(
      appBarTitle: 'Tax Information',
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
                FieldTitle(
                  text: "Type of Business",
                  fontFamily: 'Inter-Regular',
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
                SizedBox(
                  height: 5,
                ),
                Business(
                  onSelect: (p0) {
                    controller.businesstype.value = p0!;
                  },
                  color: controller.businesstype == ""
                      ? MyTheme.borderColor
                      : MyTheme.borderchangeColor,
                ),
                SizedBox(
                  height: 25,
                ),
                AppFormField(
                  title: 'Name of Business',
                  hintText: 'Nevada Fast Food Inc.',
                  bottomText:
                      "Your name must exactly match the one listed on your IRS documents (e.g, Letter 147C or SS-4 Confirmation Letter), including capitalization and punctuation",
                  hintfontSize: 15,
                  controller: controller.nameOfBusiness,
                ),
                SizedBox(
                  height: 25,
                ),
                AppFormField(
                  title: 'Employer Identifaction Number EIN',
                  hintText: 'Enter 14 digit identification number',
                  minLength: 14,
                  maxLength: 14,
                  hintfontSize: 15,
                  controller: controller.eiNumber,
                ),
                SizedBox(
                  height: 25,
                ),
                FieldTitle(
                  text: "Upload SS-4 Confirmation Letter (Optional)",
                  required: false,
                  fontFamily: 'Inter-Regular',
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
                SizedBox(
                  height: 5.08,
                ),
                PickFiles(
                  uploadborderColor: controller.confirmLetter.path.isEmpty
                      ? MyTheme.borderColor
                      : MyTheme.borderchangeColor,
                  uploadText: controller.confirmLetter.path.isEmpty
                      ? 'Please upload [ “png”, “jpg”, “Pdf”] Files'
                      : '${controller.confirmLetter.path.split('/').last}',
                  uploadtextColor: controller.confirmLetter.path.isEmpty
                      ? MyTheme.hinttextColor
                      : MyTheme.hinttextchangeColor,
                  fontSize: 15,
                  onFilePicked: (p0) {
                    setState(() {
                      controller.confirmLetter = p0;
                    });
                  },
                ),
                SizedBox(height: 25),
                FieldTitle(
                  text: "Upload Letter 147C (Optional)",
                  required: false,
                  fontFamily: 'Inter-Regular',
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
                SizedBox(
                  height: 5.08,
                ),
                PickFiles(
                  uploadborderColor: controller.uploadLetter.path.isEmpty
                      ? MyTheme.borderColor
                      : MyTheme.borderchangeColor,
                  uploadText: controller.uploadLetter.path.isEmpty
                      ? 'Please upload [ “png”, “jpg”, “Pdf”] Files'
                      : '${controller.uploadLetter.path.split('/').last}',
                  uploadtextColor: controller.uploadLetter.path.isEmpty
                      ? MyTheme.hinttextColor
                      : MyTheme.hinttextchangeColor,
                  fontSize: 15,
                  onFilePicked: (p0) {
                    setState(() {
                      controller.uploadLetter = p0;
                    });
                  },
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.27,
                ),
                OnboardingButton(
                  onTap: () {
                    Get.toNamed(OnboardingPage7.id);
                  },
                  buttonbackgroundColor: (controller.businesstype.isEmpty ||
                          controller.nameOfBusiness.text.isEmpty ||
                          controller.eiNumber.text.isEmpty ||
                          controller.confirmLetter.path.isEmpty ||
                          controller.uploadLetter.path.isEmpty)
                      ? MyTheme.buttonColor
                      : MyTheme.buttonchangeColor,
                  text: 'CONTINUE',
                  buttontextColor: (controller.businesstype.isEmpty ||
                          controller.nameOfBusiness.text.isEmpty ||
                          controller.eiNumber.text.isEmpty ||
                          controller.confirmLetter.path.isEmpty ||
                          controller.uploadLetter.path.isEmpty)
                      ? MyTheme.buttontextColor
                      : MyTheme.buttontextchangeColor,
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
