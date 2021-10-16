// import 'dart:io';

// import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
// import 'package:open_file/open_file.dart';
// import 'package:path_provider/path_provider.dart';
import 'package:readyplates_restaurants/src/onboarding/onboarding_controller.dart';
import 'package:readyplates_restaurants/utils/my_color.dart';
import 'package:readyplates_restaurants/widgets/field_title.dart';
import 'package:readyplates_restaurants/widgets/file_picker.dart';
import 'package:readyplates_restaurants/widgets/form_field.dart';
import 'package:readyplates_restaurants/widgets/onboardingWrapper.dart';

class OnboardingPage3 extends StatefulWidget {
  static const id = "/onboarding3";
  const OnboardingPage3({Key? key}) : super(key: key);

  @override
  State<OnboardingPage3> createState() => _OnboardingPage3State();
}

class _OnboardingPage3State extends State<OnboardingPage3> {
  final controller = Get.find<OnboardingController>();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  // void openFile(PlatformFile file) {
  //   OpenFile.open(file.path!);
  // }

  // Future<File> saveFilePermanently(PlatformFile file) async {
  //   final appStorage = await getApplicationDocumentsDirectory();
  //   final newFile = File('${appStorage.path}/${file.name}');
  //   return File(file.path!).copy(newFile.path);
  // }

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
  void initState() {
    controller.gstpresentController.addListener(() {
      setState(() {});
    });
    controller.gstnumController.addListener(() {
      setState(() {});
    });
    controller.fssaistatusController.addListener(() {
      setState(() {});
    });

    super.initState();
  }

  @override
  void dispose() {
    controller.gstpresentController.dispose();
    controller.gstnumController.dispose();
    controller.fssaistatusController.dispose();

    super.dispose();
  }

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
              color: MyTheme.appbartextColor,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.only(left: 17, right: 17),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 8),
                  AppFormField(
                    title: "GSTIN Present",
                    hintText: "Yes/No/Applied/Acknowledgement Received",
                    controller: controller.gstpresentController,
                  ),

                  SizedBox(height: 26),

                  SizedBox(
                    height: 5,
                  ),
                  AppFormField(
                    title: 'Restaurant GSTIN',
                    hintText: "Eg.22AABCU9603R1ZX",
                    isRequired: false,
                    controller: controller.gstnumController,
                  ),

                  SizedBox(
                    height: 26,
                  ),

                  AppFormField(
                    title: 'FSSAI License Status',
                    hintText: "Yes/No/Applied/Acknowledgement Received",
                    isRequired: false,
                    controller: controller.fssaistatusController,
                  ),

                  SizedBox(height: 26),

                  FieldTitle(
                    text: 'FSSAI Expiry Date',
                    required: false,
                  ),

                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    height: 45.68,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color: controller.expiry == DateTime(1900)
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
                            controller.expiry == DateTime(1900)
                                ? 'mm/dd/yyyy'
                                : '${controller.expiry.year}/${controller.expiry.month}/${controller.expiry.day}',
                            style: TextStyle(
                              fontSize: 13,
                              fontFamily: 'Inter',
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w500,
                              letterSpacing: -0.264706,
                              color: MyTheme.hinttextColor,
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
                  FieldTitle(
                    text:
                        'Upload KYC (Aadhar Card/ Passport/Driving License/ Voter ID',
                  ),

                  SizedBox(
                    height: 5,
                  ),
                  PickFiles(
                    uploadborderColor: controller.kycimg.path.isEmpty
                        ? MyTheme.borderColor
                        : MyTheme.borderchangeColor,
                    uploadText: controller.kycimg.path.isEmpty
                        ? 'Please upload [ “png”, “jpg”, “jpeg”] images'
                        : '${controller.kycimg.path.split('/').last}',
                    uploadtextColor: controller.kycimg.path.isEmpty
                        ? MyTheme.hinttextColor
                        : MyTheme.hinttextchangeColor,
                  ),
                  // Container(
                  //   height: 45.68,
                  //   width: MediaQuery.of(context).size.width,
                  //   decoration: BoxDecoration(
                  //     border: Border.all(
                  //       width: 1,
                  //       color: controller.kycimg.path.isEmpty
                  //           ? MyTheme.borderColor
                  //           : MyTheme.borderchangeColor,
                  //       style: BorderStyle.solid,
                  //     ),
                  //     borderRadius: BorderRadius.all(
                  //       Radius.circular(6.0),
                  //     ),
                  //   ),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: [
                  //       Expanded(
                  //         child: Padding(
                  //           padding: const EdgeInsets.only(left: 12.5),
                  //           child: Text(
                  //            c
                  //                 ? 'Please upload [ “png”, “jpg”, “jpeg”] images'
                  //                 : '${controller.kycimg.path.split('/').last}',
                  //             style: TextStyle(
                  //               fontSize: 13,
                  //               fontFamily: 'Inter',
                  //               fontStyle: FontStyle.normal,
                  //               fontWeight: FontWeight.w500,
                  //               color: controller.kycimg.path.isEmpty
                  //                   ? MyTheme.hinttextColor
                  //                   : MyTheme.hinttextchangeColor,
                  //             ),
                  //             textAlign: TextAlign.left,
                  //           ),
                  //         ),
                  //       ),
                  //       InkWell(
                  //         onTap: () async {
                  //           final result = await FilePicker.platform
                  //               .pickFiles(allowMultiple: true);
                  //           if (result == null) return;
                  //           final file = result.files.first;
                  //           // openFile(file);

                  //           print('Name: ${file.name}');
                  //           print('Bytes: ${file.bytes}');
                  //           print('Size: ${file.size}');
                  //           print('Extension: ${file.extension}');
                  //           setState(() {
                  //             controller.kycimg = File(file.path!);
                  //           });
                  //         },
                  //         child: Container(
                  //           width: 45,
                  //           decoration: BoxDecoration(
                  //             color: Color(0xffEFEFEF),
                  //             borderRadius: BorderRadius.only(
                  //               topLeft: Radius.circular(0),
                  //               topRight: Radius.circular(6.0),
                  //               bottomLeft: Radius.circular(0),
                  //               bottomRight: Radius.circular(6.0),
                  //             ),
                  //           ),
                  //           child: Center(
                  //             child: Container(
                  //               width: 20,
                  //               height: 20,
                  //               child: Image(
                  //                 image: AssetImage(
                  //                   'assets/images/upload.png',
                  //                 ),
                  //               ),
                  //             ),
                  //           ),
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),

                  //

                  SizedBox(height: 26),
                  FieldTitle(
                    text: 'Upload GSTIN Certificate',
                    required: false,
                  ),

                  SizedBox(
                    height: 5,
                  ),
                  PickFiles(
                    uploadborderColor: controller.gstinimg.path.isEmpty
                        ? MyTheme.borderColor
                        : MyTheme.borderchangeColor,
                    uploadText: controller.gstinimg.path.isEmpty
                        ? 'Please upload [ “png”, “jpg”, “jpeg”, “pdf”] files'
                        : '${controller.gstinimg.path.split('/').last}',
                    uploadtextColor: controller.gstinimg.path.isEmpty
                        ? MyTheme.hinttextColor
                        : MyTheme.hinttextchangeColor,
                  ),
                  // Container(
                  //   height: 45.68,
                  //   // margin: EdgeInsets.only(
                  //   //   left: 17,
                  //   //   right: 17,
                  //   // ),
                  //   width: MediaQuery.of(context).size.width,
                  //   decoration: BoxDecoration(
                  //     border: Border.all(
                  //       width: 1,
                  //       color: controller.gstinimg.path.isEmpty
                  //           ? MyTheme.borderColor
                  //           : MyTheme.borderchangeColor,
                  //       style: BorderStyle.solid,
                  //     ),
                  //     borderRadius: BorderRadius.all(
                  //       Radius.circular(6.0),
                  //     ),
                  //   ),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: [
                  //       Expanded(
                  //         child: Padding(
                  //           padding: const EdgeInsets.only(left: 12.5),
                  //           child: Text(
                  //             controller.gstinimg.path.isEmpty
                  //                 ? 'Please upload [ “png”, “jpg”, “jpeg”, “pdf”] files'
                  //                 : '${controller.gstinimg.path.split('/').last}',
                  //             style: TextStyle(
                  //               fontSize: 13,
                  //               fontFamily: 'Inter',
                  //               fontStyle: FontStyle.normal,
                  //               fontWeight: FontWeight.w500,
                  //               color: controller.kycimg.path.isEmpty
                  //                   ? MyTheme.hinttextColor
                  //                   : MyTheme.hinttextchangeColor,
                  //             ),
                  //             textAlign: TextAlign.left,
                  //           ),
                  //         ),
                  //       ),
                  //       InkWell(
                  //         onTap: () async {
                  //           final result = await FilePicker.platform
                  //               .pickFiles(allowMultiple: false);
                  //           if (result == null) return;
                  //           final file = result.files.first;
                  //           // openFile(file);

                  //           print('Name: ${file.name}');
                  //           print('Bytes: ${file.bytes}');
                  //           print('Size: ${file.size}');
                  //           print('Extension: ${file.extension}');
                  //           setState(() {
                  //             controller.gstinimg = File(file.path!);
                  //           });
                  //         },
                  //         child: Container(
                  //           width: 45,
                  //           decoration: BoxDecoration(
                  //             color: Color(0xffEFEFEF),
                  //             borderRadius: BorderRadius.only(
                  //               topLeft: Radius.circular(0),
                  //               topRight: Radius.circular(6.0),
                  //               bottomLeft: Radius.circular(0),
                  //               bottomRight: Radius.circular(6.0),
                  //             ),
                  //           ),
                  //           child: Center(
                  //             child: Container(
                  //               width: 20,
                  //               height: 20,
                  //               child: Image(
                  //                 image: AssetImage(
                  //                   'assets/images/upload.png',
                  //                 ),
                  //               ),
                  //             ),
                  //           ),
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),

                  //
                  SizedBox(height: 26),
                  FieldTitle(
                    text: 'Upload FSSAI Certificate',
                    required: false,
                  ),

                  SizedBox(
                    height: 5.08,
                  ),
                  PickFiles(
                    uploadborderColor: controller.fssaiimg.path.isEmpty
                        ? MyTheme.borderColor
                        : MyTheme.borderchangeColor,
                    uploadText: controller.fssaiimg.path.isEmpty
                        ? 'Please upload [ “png”, “jpg”, “jpeg”, “pdf”] files'
                        : '${controller.fssaiimg.path.split('/').last}',
                    uploadtextColor: controller.fssaiimg.path.isEmpty
                        ? MyTheme.hinttextColor
                        : MyTheme.hinttextchangeColor,
                  ),
                  // Container(
                  //   height: 45.68,
                  //   // margin: EdgeInsets.only(
                  //   //   left: 17,
                  //   //   right: 17,
                  //   // ),
                  //   width: MediaQuery.of(context).size.width,
                  //   decoration: BoxDecoration(
                  //     border: Border.all(
                  //       width: 1,
                  //       color: controller.fssaiimg.path.isEmpty
                  //           ? Color(0xffE0E0E0)
                  //           : Color(0xff00ADB5),
                  //       style: BorderStyle.solid,
                  //     ),
                  //     borderRadius: BorderRadius.all(
                  //       Radius.circular(6.0),
                  //     ),
                  //   ),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: [
                  //       Expanded(
                  //         child: Padding(
                  //           padding: const EdgeInsets.only(left: 12.5),
                  //           child: Text(
                  //             controller.fssaiimg.path.isEmpty
                  //                 ? 'Please upload [ “png”, “jpg”, “jpeg”, “pdf”] files'
                  //                 : '${controller.fssaiimg.path.split('/').last}',
                  //             style: TextStyle(
                  //               fontSize: 13,
                  //               fontFamily: 'Inter',
                  //               fontStyle: FontStyle.normal,
                  //               fontWeight: FontWeight.w500,
                  //               letterSpacing: -0.264706,
                  //               color: controller.kycimg.path.isEmpty
                  //                   ? MyTheme.hinttextColor
                  //                   : MyTheme.hinttextchangeColor,
                  //             ),
                  //             textAlign: TextAlign.left,
                  //           ),
                  //         ),
                  //       ),
                  //       InkWell(
                  //         onTap: () async {
                  //           final result = await FilePicker.platform
                  //               .pickFiles(allowMultiple: true);
                  //           if (result == null) return;
                  //           final file = result.files.first;
                  //           // openFile(file);

                  //           print('Name: ${file.name}');
                  //           print('Bytes: ${file.bytes}');
                  //           print('Size: ${file.size}');
                  //           print('Extension: ${file.extension}');
                  //           print('Path: ${file.path}');

                  //           print('From Path: ${file.path!}');
                  //           setState(() {
                  //             controller.fssaiimg = File(file.path!);
                  //           });
                  //         },
                  //         child: Container(
                  //           width: 45,
                  //           decoration: BoxDecoration(
                  //             color: Color(0xffEFEFEF),
                  //             borderRadius: BorderRadius.only(
                  //               topLeft: Radius.circular(0),
                  //               topRight: Radius.circular(6.0),
                  //               bottomLeft: Radius.circular(0),
                  //               bottomRight: Radius.circular(6.0),
                  //             ),
                  //           ),
                  //           child: Center(
                  //             child: Container(
                  //               width: 20,
                  //               height: 20,
                  //               child: Image(
                  //                 image: AssetImage(
                  //                   'assets/images/upload.png',
                  //                 ),
                  //               ),
                  //             ),
                  //           ),
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),

                  //

                  SizedBox(height: 26),
                  SizedBox(
                    height: 45,
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: (controller
                                      .gstpresentController.text.isEmpty ||
                                  controller.gstnumController.text.isEmpty ||
                                  controller
                                      .fssaistatusController.text.isEmpty ||
                                  controller.expiry == DateTime(1900) ||
                                  controller.kycimg.path.isEmpty ||
                                  controller.gstinimg.path.isEmpty ||
                                  controller.fssaiimg.path.isEmpty)
                              ? MyTheme.buttonColor
                              : MyTheme.buttonchangeColor,
                          side: BorderSide(
                            width: 1.5,
                            color: Color.fromRGBO(255, 255, 255, 0.5),
                          ),
                        ),
                        onPressed: () async {
                          print(controller.expiry);
                          formKey.currentState!.save();
                          if (formKey.currentState!.validate())
                            controller.onboardingApi(OnBoardingMethod.api3);
                          //controller.onboardingApi(OnBoardingMethod.api3);
                        },
                        child: Text('CONTINUE',
                            style: TextStyle(
                              color: MyTheme.buttontextColor,
                              fontSize: 17,
                            ))),
                  ),
                  SizedBox(
                    height: 5.89,
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
