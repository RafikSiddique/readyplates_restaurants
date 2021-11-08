import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:open_file/open_file.dart';
import 'package:readyplates_restaurants/src/onboarding/onboarding_controller.dart';
import 'package:readyplates_restaurants/utils/my_color.dart';
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
    Size size = MediaQuery.of(context).size;
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
                  height: 8,
                ),
                AppFormField(
                  title: 'Type of Business',
                  hintText: 'Corporation',
                  hintfontSize: 15,
                  controller: controller.ac_number,
                ),
                SizedBox(
                  height: 17,
                ),
                AppFormField(
                  title: ' Name of Business',
                  hintText: 'Nevada Fast Food Inc.',
                  bottomText:
                      "Your name must exactly match the one listed on your IRS documents (e.g, Letter 147C or SS-4 Confirmation Letter), including capitalization and punctuation",
                  hintfontSize: 15,
                  controller: controller.ifsc_code,
                ),
                SizedBox(
                  height: 25,
                ),
                AppFormField(
                  title: 'Employer Identifaction Number EIN',
                  hintText: 'Enter 14 digit identification number',
                  hintfontSize: 15,
                  controller: controller.ifsc_code,
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
                  uploadborderColor: controller.pan_image.path.isEmpty
                      ? MyTheme.borderColor
                      : MyTheme.borderchangeColor,
                  uploadText: controller.pan_image.path.isEmpty
                      ? 'Please upload [ “png”, “jpg”, “Pdf”] Files'
                      : '${controller.pan_image.path.split('/').last}',
                  uploadtextColor: controller.pan_image.path.isEmpty
                      ? MyTheme.hinttextColor
                      : MyTheme.hinttextchangeColor,
                  fontSize: controller.pan_image.path.isEmpty ? 15 : 13,
                  onFilePicked: (p0) {
                    setState(() {
                      controller.pan_image = p0;
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
                  uploadborderColor: controller.pan_image.path.isEmpty
                      ? MyTheme.borderColor
                      : MyTheme.borderchangeColor,
                  uploadText: controller.pan_image.path.isEmpty
                      ? 'Please upload [ “png”, “jpg”, “Pdf”] Files'
                      : '${controller.pan_image.path.split('/').last}',
                  uploadtextColor: controller.pan_image.path.isEmpty
                      ? MyTheme.hinttextColor
                      : MyTheme.hinttextchangeColor,
                  fontSize: controller.pan_image.path.isEmpty ? 15 : 13,
                  onFilePicked: (p0) {
                    setState(() {
                      controller.pan_image = p0;
                    });
                  },
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.29),
                OnboardingButton(
                  onTap: () {
                    formKey.currentState!.save();
                    if (formKey.currentState!.validate())
                      controller.onboardingApi(OnBoardingMethod.api5);
                  },
                  buttonbackgroundColor: controller.pan_image.path.isEmpty
                      ? MyTheme.buttonColor
                      : MyTheme.buttonchangeColor,
                  text: 'CONTINUE',
                  buttontextColor: controller.pan_image.path.isEmpty
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
