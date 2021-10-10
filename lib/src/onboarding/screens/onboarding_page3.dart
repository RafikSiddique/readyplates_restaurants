import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:readyplates_restaurants/src/onboarding/onboarding_controller.dart';

class OnboardingPage3 extends StatefulWidget {
  static const id = "/onboarding3";
  const OnboardingPage3({Key? key}) : super(key: key);

  @override
  State<OnboardingPage3> createState() => _OnboardingPage3State();
}

class _OnboardingPage3State extends State<OnboardingPage3> {
  final controller = Get.find<OnboardingController>();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  void openFile(PlatformFile file) {
    OpenFile.open(file.path!);
  }

  Future<File> saveFilePermanently(PlatformFile file) async {
    final appStorage = await getApplicationDocumentsDirectory();
    final newFile = File('${appStorage.path}/${file.name}');
    return File(file.path!).copy(newFile.path);
  }

  void fssaiExpiryDate() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2021),
      lastDate: DateTime(2030),
      currentDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        controller.expiry = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
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
            'Partner Onboarding',
            style: TextStyle(
              fontSize: 17,
              letterSpacing: -0.226667,
              color: Color(0xff393E46),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.only(left: 17),
                  child: RichText(
                    text: TextSpan(
                        text: 'GSTIN Present ',
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
                ),
                SizedBox(
                  height: 5,
                ),

                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 45,
                  margin: EdgeInsets.only(
                    left: 17,
                    right: 17,
                  ),
                  child: TextFormField(
                    controller: controller.gstpresentController,
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
                      hintText: 'Yes/No/Applied/Acknowledgement Received',
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

                SizedBox(height: 26),
                Padding(
                  padding: const EdgeInsets.only(left: 17),
                  child: Text("Restaurant GSTIN",
                      style: TextStyle(
                        fontSize: 13,
                        fontFamily: 'Inter',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500,
                        letterSpacing: -0.229412,
                        color: Color(0xff2F2E41),
                      )),
                ),
                SizedBox(
                  height: 5,
                ),

                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 45,
                  margin: EdgeInsets.only(
                    left: 17,
                    right: 17,
                  ),
                  child: TextFormField(
                    controller: controller.gstnumController,
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
                      hintText: 'Eg.22AABCU9603R1ZX',
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

                SizedBox(height: 26),
                Padding(
                  padding: const EdgeInsets.only(left: 17),
                  child: Text("FSSAI License Status",
                      style: TextStyle(
                        fontSize: 13,
                        fontFamily: 'Inter',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500,
                        letterSpacing: -0.229412,
                        color: Color(0xff2F2E41),
                      )),
                ),

                SizedBox(
                  height: 5,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 45,
                  margin: EdgeInsets.only(
                    left: 17,
                    right: 17,
                  ),
                  child: TextFormField(
                    controller: controller.fssaistatusController,
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
                      hintText: 'Yes/No/Applied/Acknowledgement Received',
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

                SizedBox(height: 26),
                Padding(
                  padding: const EdgeInsets.only(left: 17),
                  child: Text("FSSAI Expiry Date",
                      style: TextStyle(
                        fontSize: 13,
                        fontFamily: 'Inter',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500,
                        letterSpacing: -0.229412,
                        color: Color(0xff2F2E41),
                      )),
                ),

                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 45.68,
                  margin: EdgeInsets.only(
                    left: 17,
                    right: 17,
                  ),
                  width: MediaQuery.of(context).size.width,
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
                          controller.expiry == DateTime(1900)
                              ? 'mm/dd/yyyy'
                              : '${controller.expiry.year}/${controller.expiry.month}/${controller.expiry.day}',
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
                        onTap: () {
                          fssaiExpiryDate();
                        },
                        child: Container(
                          width: 45,
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
                              width: 15,
                              height: 15,
                              child: Image(
                                image: AssetImage(
                                  'assets/images/calendar.png',
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                //

                SizedBox(height: 26),
                Padding(
                  padding: const EdgeInsets.only(left: 17),
                  child: RichText(
                    text: TextSpan(
                        text:
                            'Upload KYC (Aadhar Card/ Passport/Driving License/ \nVoter ID',
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
                              fontSize: 13,
                              color: Color(0xffEB4132),
                            ),
                          ),
                        ]),
                  ),
                ),

                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 45.68,
                  margin: EdgeInsets.only(
                    left: 17,
                    right: 17,
                  ),
                  width: MediaQuery.of(context).size.width,
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
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 12.5),
                          child: Text(
                            '${controller.kycimg.path.split('/').last}',
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
                      ),
                      InkWell(
                        onTap: () async {
                          final result = await FilePicker.platform
                              .pickFiles(allowMultiple: true);
                          if (result == null) return;
                          final file = result.files.first;
                          // openFile(file);

                          print('Name: ${file.name}');
                          print('Bytes: ${file.bytes}');
                          print('Size: ${file.size}');
                          print('Extension: ${file.extension}');
                          setState(() {
                            controller.kycimg = File(file.path!);
                          });
                        },
                        child: Container(
                          width: 45,
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

                //

                SizedBox(height: 26),
                Padding(
                  padding: const EdgeInsets.only(left: 17),
                  child: Text("Upload GSTIN Certificate",
                      style: TextStyle(
                        fontSize: 13,
                        fontFamily: 'Inter',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500,
                        letterSpacing: -0.229412,
                        color: Color(0xff2F2E41),
                      )),
                ),
                SizedBox(
                  height: 5,
                ),

                SizedBox(
                  height: 5.08,
                ),
                Container(
                  height: 45.68,
                  margin: EdgeInsets.only(
                    left: 17,
                    right: 17,
                  ),
                  width: MediaQuery.of(context).size.width,
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
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 12.5),
                          child: Text(
                            '${controller.gstinimg.path.split('/').last}',
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
                      ),
                      InkWell(
                        onTap: () async {
                          final result = await FilePicker.platform
                              .pickFiles(allowMultiple: false);
                          if (result == null) return;
                          final file = result.files.first;
                          // openFile(file);

                          print('Name: ${file.name}');
                          print('Bytes: ${file.bytes}');
                          print('Size: ${file.size}');
                          print('Extension: ${file.extension}');
                          setState(() {
                            controller.gstinimg = File(file.path!);
                          });
                        },
                        child: Container(
                          width: 45,
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

                //
                SizedBox(height: 26),
                Padding(
                  padding: const EdgeInsets.only(left: 17),
                  child: Text("Upload FSSAI Certificate",
                      style: TextStyle(
                        fontSize: 13,
                        fontFamily: 'Inter',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500,
                        letterSpacing: -0.229412,
                        color: Color(0xff2F2E41),
                      )),
                ),

                SizedBox(
                  height: 5.08,
                ),
                Container(
                  height: 45.68,
                  margin: EdgeInsets.only(
                    left: 17,
                    right: 17,
                  ),
                  width: MediaQuery.of(context).size.width,
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
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 12.5),
                          child: Text(
                            '${controller.fssaiimg.path.split('/').last}',
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
                      ),
                      InkWell(
                        onTap: () async {
                          final result = await FilePicker.platform
                              .pickFiles(allowMultiple: true);
                          if (result == null) return;
                          final file = result.files.first;
                          // openFile(file);

                          print('Name: ${file.name}');
                          print('Bytes: ${file.bytes}');
                          print('Size: ${file.size}');
                          print('Extension: ${file.extension}');
                          print('Path: ${file.path}');

                          print('From Path: ${file.path!}');
                          setState(() {
                            controller.fssaiimg = File(file.path!);
                          });
                        },
                        child: Container(
                          width: 45,
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

                //

                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 17, right: 15),
                  child: SizedBox(
                    height: 45,
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xff7A7E83),
                          side: BorderSide(
                              width: 1.5,
                              color: Color.fromRGBO(255, 255, 255, 0.5)),
                        ),
                        onPressed: () async {
                          formKey.currentState!.save();
                          await controller.onboardingapi3();
                        },
                        child: Text('CONTINUE',
                            style: TextStyle(
                              color: Color(0xffE5E5E5),
                              fontSize: 17,
                            ))),
                  ),
                ),
                SizedBox(
                  height: 17,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
