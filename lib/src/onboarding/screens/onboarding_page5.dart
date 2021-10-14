import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:readyplates_restaurants/src/onboarding/onboarding_controller.dart';
import 'package:readyplates_restaurants/utils/my_color.dart';
import 'package:readyplates_restaurants/widgets/field_title.dart';
import 'package:readyplates_restaurants/widgets/form_field.dart';
import 'package:readyplates_restaurants/widgets/onboardingWrapper.dart';

class OnboardingPage5 extends StatefulWidget {
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
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
            'Payment Setup',
            style: TextStyle(
              fontSize: 17,
              fontFamily: 'Inter',
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w500,
              color: MyTheme.appbartextColor,
            ),
          ),
        ),
        body: Padding(
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
                    title: 'Legal Entity Account Number',
                    hintText: '511122266514782',
                    bottomText:
                        'Make sure it matches the name on your government ID',
                    inputType: TextInputType.number,
                    formatters: [FilteringTextInputFormatter.digitsOnly],
                    controller: controller.ac_numberController,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  AppFormField(
                    title: 'Re-Enter Account Number',
                    hintText: '511122266514782',
                    matchVerification: true,
                    bottomText: "Both fields should match",
                    secondVal: controller.ac_numberController,
                    inputType: TextInputType.number,
                    formatters: [FilteringTextInputFormatter.digitsOnly],
                    controller: controller.reac_numberController,
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  FieldTitle(text: "Type of Account"),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    height: 45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(6.0),
                      ),
                      border: Border.all(
                        width: 1,
                        color: controller.typeOfAcc == ''
                            ? MyTheme.borderColor
                            : MyTheme.borderchangeColor,
                        style: BorderStyle.solid,
                      ),
                    ),
                    child: DropdownButtonFormField<String>(
                      icon: Padding(
                        padding: const EdgeInsets.only(right: 8.17),
                        child: FaIcon(
                          FontAwesomeIcons.chevronDown,
                          color: MyTheme.iconColor,
                          size: 14.87,
                        ),
                      ),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(borderSide: BorderSide.none
                            // borderRadius: BorderRadius.all(
                            //   Radius.circular(6.0),
                            // ),
                            ),
                        hintText: 'Current/Savings',
                        contentPadding: EdgeInsets.only(
                          left: 14,
                          top: 14,
                        ),
                        hintStyle: TextStyle(
                          fontSize: 13,
                          fontFamily: 'Inter',
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w500,
                          color: MyTheme.hinttextColor,
                        ),
                      ),
                      items: controller.accType
                          .map(
                              (e) => DropdownMenuItem(child: Text(e), value: e))
                          .toList(),
                      onChanged: (newValue) {
                        controller.typeOfAcc = newValue!;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  AppFormField(
                    title: 'IFSC Code',
                    hintText: 'HDFC000042',

                    bottomText: "Enter a valid IFSC Code",

                    // formatters: [FilteringTextInputFormatter.digitsOnly],
                    controller: controller.ifsc_codeController,
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  AppFormField(
                    title: 'PAN Number of Restaurant',
                    hintText: 'BSUTA1568A',
                    isRequired: false,
                    bottomText: "PAN of the registered legal entity",
                    controller: controller.pan_numController,
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  AppFormField(
                    title: 'Name of the PAN Card',
                    hintText: 'Bliss Bistro & Cafe',
                    isRequired: false,
                    bottomText: "PAN of the registered legal entity",
                    controller: controller.pan_nameController,
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  FieldTitle(
                    text: "Uplaod PAN Card",
                    required: false,
                  ),
                  SizedBox(
                    height: 5.08,
                  ),
                  Container(
                    height: 45.68,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color: controller.pan_image.path.isEmpty
                            ? MyTheme.borderColor
                            : MyTheme.borderchangeColor,
                        style: BorderStyle.solid,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(6.0),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 12.5),
                          child: Text(
                            controller.pan_image.path.isEmpty
                                ? 'Please upload [ “png”, “jpg”, “jpeg”, “pdf”] files'
                                : '${controller.pan_image.path.split('/').last}',
                            style: TextStyle(
                              fontSize: 13,
                              fontFamily: 'Inter',
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w500,
                              color: controller.pan_image.path.isEmpty
                                  ? MyTheme.hinttextColor
                                  : MyTheme.hinttextchangeColor,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(
                          height: 18,
                        ),
                        InkWell(
                          onTap: () async {
                            final result = await FilePicker.platform
                                .pickFiles(allowMultiple: true);
                            if (result == null) return;
                            final file = result.files.first;
                            controller.pan_image = File(file.path!);
                            print('Name: ${file.name}');
                            print('Bytes: ${file.bytes}');
                            print('Size: ${file.size}');
                            print('Extension: ${file.extension}');
                            print('Path: ${file.path}');
                            print('From Path: ${file.path!}');
                            setState(() {
                              controller.pan_image = File(file.path!);
                            });
                          },
                          child: Container(
                            width: size.width * 0.110,
                            decoration: BoxDecoration(
                              color: Color(0xffEFEFEF),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(0),
                                topRight: Radius.circular(6.0),
                                bottomLeft: Radius.circular(0),
                                bottomRight: Radius.circular(6.0),
                              ),
                            ),
                            child: Center(
                              child: Container(
                                width: 20,
                                height: 20,
                                child: Image(
                                  image: AssetImage(
                                    'assets/images/upload.png',
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  InkWell(
                    onTap: () {
                      formKey.currentState!.save();
                      if (formKey.currentState!.validate())
                        controller.onboardingApi(OnBoardingMethod.api5);
                    },
                    child: Container(
                      // width: 343,
                      height: 40.11,
                      decoration: BoxDecoration(
                        color: controller.pan_image.path.isEmpty
                            ? MyTheme.buttonColor
                            : MyTheme.buttonchangeColor,
                        borderRadius: BorderRadius.all(Radius.circular(6)),
                      ),
                      child: Center(
                        child: Text(
                          'Click here to verify account',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 17,
                            fontFamily: 'Inter',
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w600,
                            letterSpacing: -0.28,
                            color: MyTheme.buttontextColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Text(
                    '₹ 1 will be credited to your account for verification',
                    style: TextStyle(
                      fontSize: 8,
                      fontFamily: 'Montserrat',
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w400,
                      color: MyTheme.bottomtextColor,
                    ),
                  ),
                  SizedBox(
                    height: 6,
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
