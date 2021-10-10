import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:readyplates_restaurants/src/onboarding/onboarding_controller.dart';

class OnboardingPage5 extends StatefulWidget {
  const OnboardingPage5({Key? key}) : super(key: key);

  @override
  State<OnboardingPage5> createState() => _OnboardingPage5State();
}

class _OnboardingPage5State extends State<OnboardingPage5> {
  final controller = Get.find<OnboardingController>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 44,
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
              iconSize: 14.83,
              icon: FaIcon(
                FontAwesomeIcons.chevronLeft,
                color: Color(0xff000000),
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
              letterSpacing: -0.226667,
              color: Color(0xff393E46),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 8,
                ),
                RichText(
                  text: TextSpan(
                      text: 'Legal Entity Account Number',
                      style: TextStyle(
                        fontSize: 13,
                        fontFamily: 'Inter',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500,
                        letterSpacing: -0.229412,
                        color: Color(0xff2F2E41),
                      ),
                      children: [
                        TextSpan(
                          text: ' *',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xffEB4132),
                          ),
                        ),
                      ]),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  // width: 341,
                  height: 45,
                  child: TextFormField(
                    controller: controller.ac_numberController,
                    cursorColor: Color(0xff00ADB5),
                    textAlign: TextAlign.left,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1,
                          color: Color(0xffE0E0E0),
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(6.0),
                        ),
                      ),
                      hintText: '511122266514782',
                      contentPadding: EdgeInsets.only(
                        left: 14,
                        top: 14,
                      ),
                      hintStyle: TextStyle(
                        fontSize: 13,
                        fontFamily: 'Inter',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500,
                        letterSpacing: -0.264706,
                        color: Color(0x979797).withOpacity(0.7),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 3.02,
                ),
                Text(
                  'Make sure it matches the name on your government ID',
                  style: TextStyle(
                    fontSize: 9,
                    fontFamily: 'Poppins',
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.normal,
                    letterSpacing: -0.229412,
                    color: Color(0xff6E6D7A),
                  ),
                ),
                SizedBox(
                  height: 18,
                ),
                RichText(
                  text: TextSpan(
                      text: 'Re-Enter Account Number',
                      style: TextStyle(
                        fontSize: 13,
                        fontFamily: 'Inter',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500,
                        letterSpacing: -0.229412,
                        color: Color(0xff2F2E41),
                      ),
                      children: [
                        TextSpan(
                          text: ' *',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xffEB4132),
                          ),
                        ),
                      ]),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  // width: 341,
                  height: 45,
                  child: TextFormField(
                    controller: controller.reac_numberController,
                    cursorColor: Color(0xff00ADB5),
                    textAlign: TextAlign.left,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1,
                          color: Color(0xffE0E0E0),
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(6.0),
                        ),
                      ),
                      hintText: '511122266514782',
                      contentPadding: EdgeInsets.only(
                        left: 14,
                        top: 14,
                      ),
                      hintStyle: TextStyle(
                        fontSize: 13,
                        fontFamily: 'Inter',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500,
                        letterSpacing: -0.264706,
                        color: Color(0x979797).withOpacity(0.7),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 3.02,
                ),
                Text(
                  'Both fields should match',
                  style: TextStyle(
                    fontSize: 9,
                    fontFamily: 'Poppins',
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.normal,
                    letterSpacing: -0.229412,
                    color: Color(0xff6E6D7A),
                  ),
                ),
                SizedBox(
                  height: 18,
                ),
                RichText(
                  text: TextSpan(
                      text: 'Type of Account',
                      style: TextStyle(
                        fontSize: 13,
                        fontFamily: 'Inter',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500,
                        letterSpacing: -0.229412,
                        color: Color(0xff2F2E41),
                      ),
                      children: [
                        TextSpan(
                          text: ' *',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xffEB4132),
                          ),
                        ),
                      ]),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  // width: 341,
                  height: 45,
                  child: DropdownButtonFormField<String>(
                    icon: Padding(
                      padding: const EdgeInsets.only(right: 8.17),
                      child: FaIcon(
                        FontAwesomeIcons.chevronDown,
                        color: Color(0xff000000),
                        size: 14.87,
                      ),
                    ),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1,
                          color: Color(0xffE0E0E0),
                          style: BorderStyle.solid,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(6.0),
                        ),
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
                        letterSpacing: -0.264706,
                        color: Color(0xff979797).withOpacity(0.7),
                      ),
                    ),
                    items: controller.accType
                        .map((e) => DropdownMenuItem(child: Text(e), value: e))
                        .toList(),
                    onChanged: (newValue) {
                      controller.typeOfAcc = newValue!;
                    },
                  ),
                ),
                SizedBox(
                  height: 18,
                ),
                RichText(
                  text: TextSpan(
                      text: 'IFSC Code',
                      style: TextStyle(
                        fontSize: 13,
                        fontFamily: 'Inter',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500,
                        letterSpacing: -0.229412,
                        color: Color(0xff2F2E41),
                      ),
                      children: [
                        TextSpan(
                          text: ' *',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xffEB4132),
                          ),
                        ),
                      ]),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  // width: 341,
                  height: 45,
                  child: TextFormField(
                    controller: controller.ifsc_codeController,
                    cursorColor: Color(0xff00ADB5),
                    textAlign: TextAlign.left,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1,
                          color: Color(0xffE0E0E0),
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(6.0),
                        ),
                      ),
                      hintText: 'HDFC000042',
                      contentPadding: EdgeInsets.only(
                        left: 14,
                        top: 14,
                      ),
                      hintStyle: TextStyle(
                        fontSize: 13,
                        fontFamily: 'Inter',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500,
                        letterSpacing: -0.264706,
                        color: Color(0x979797).withOpacity(0.7),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 3.02,
                ),
                Text(
                  'Enter a valid IFSC Code',
                  style: TextStyle(
                    fontSize: 9,
                    fontFamily: 'Poppins',
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.normal,
                    letterSpacing: -0.229412,
                    color: Color(0xff6E6D7A),
                  ),
                ),
                SizedBox(
                  height: 18,
                ),
                Text(
                  'PAN Number of Restaurant',
                  style: TextStyle(
                    fontSize: 13,
                    fontFamily: 'Inter',
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w500,
                    letterSpacing: -0.229412,
                    color: Color(0xff2F2E41),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  // width: 341,
                  height: 45,
                  child: TextFormField(
                    controller: controller.pan_numController,
                    cursorColor: Color(0xff00ADB5),
                    textAlign: TextAlign.left,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1,
                          color: Color(0xffE0E0E0),
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(6.0),
                        ),
                      ),
                      hintText: 'BSUTA1568A',
                      contentPadding: EdgeInsets.only(
                        left: 14,
                        top: 14,
                      ),
                      hintStyle: TextStyle(
                        fontSize: 13,
                        fontFamily: 'Inter',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500,
                        letterSpacing: -0.264706,
                        color: Color(0x979797).withOpacity(0.7),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 3.02,
                ),
                Text(
                  'PAN of the registered legal entity',
                  style: TextStyle(
                    fontSize: 9,
                    fontFamily: 'Poppins',
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.normal,
                    letterSpacing: -0.229412,
                    color: Color(0xff6E6D7A),
                  ),
                ),
                SizedBox(
                  height: 18,
                ),
                Text(
                  'Name of the PAN Card',
                  style: TextStyle(
                    fontSize: 13,
                    fontFamily: 'Inter',
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w500,
                    letterSpacing: -0.229412,
                    color: Color(0xff2F2E41),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  // width: 341,
                  height: 45,
                  child: TextFormField(
                    controller: controller.pan_nameController,
                    cursorColor: Color(0xff00ADB5),
                    textAlign: TextAlign.left,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 1,
                            color: Color(0xffE0E0E0),
                            style: BorderStyle.solid),
                        borderRadius: BorderRadius.all(
                          Radius.circular(6.0),
                        ),
                      ),
                      hintText: 'Snack Shack Fast Foods',
                      contentPadding: EdgeInsets.only(
                        left: 14,
                        top: 14,
                      ),
                      hintStyle: TextStyle(
                        fontSize: 13,
                        fontFamily: 'Inter',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500,
                        letterSpacing: -0.264706,
                        color: Color(0x979797).withOpacity(0.7),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 18,
                ),
                Text(
                  'Uplaod PAN Card',
                  style: TextStyle(
                    fontSize: 13,
                    fontFamily: 'Inter',
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w500,
                    letterSpacing: -0.229412,
                    color: Color(0xff2F2E41),
                  ),
                ),
                SizedBox(
                  height: 5.08,
                ),
                Container(
                  height: 45.68,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: Color(0xffE0E0E0),
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
                          controller.pan_image.path == ""
                              ? 'Please upload [ “png”, “jpg”, “jpeg”, “pdf”] files'
                              : controller.pan_image.path.split('/').last,
                          style: TextStyle(
                            fontSize: 13,
                            fontFamily: 'Inter',
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w500,
                            letterSpacing: -0.264706,
                            color: Color(0xff979797).withOpacity(0.7),
                          ),
                          textAlign: TextAlign.center,
                        ),
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
                    controller.onboardingapi5();
                  },
                  child: Container(
                    // width: 343,
                    height: 40.11,
                    decoration: BoxDecoration(
                      color: Color(0xff7A7E83),
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
                          color: Color(0xffE5E5E5),
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
                    fontWeight: FontWeight.w500,
                    letterSpacing: -0.229412,
                    color: Color(0xff6E6D7A),
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
    );
  }
}
