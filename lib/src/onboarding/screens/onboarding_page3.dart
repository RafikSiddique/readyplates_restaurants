import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readyplates_restaurants/src/onboarding/onboarding_controller.dart';
import 'package:readyplates_restaurants/utils/my_color.dart';
import 'package:readyplates_restaurants/widgets/field_title.dart';
import 'package:readyplates_restaurants/widgets/file_picker.dart';
import 'package:readyplates_restaurants/widgets/form_field.dart';
import 'package:readyplates_restaurants/widgets/onboardingWrapper.dart';
import 'package:readyplates_restaurants/widgets/onboardingbutton.dart';

class OnboardingPage3 extends StatefulWidget {
  static const id = "/onboarding3";
  const OnboardingPage3({Key? key}) : super(key: key);

  @override
  State<OnboardingPage3> createState() => _OnboardingPage3State();
}

class _OnboardingPage3State extends State<OnboardingPage3> {
  final controller = Get.find<OnboardingController>();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

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

  // @override
  // void initState() {
  //   controller.gstpresent.addListener(() {
  //     setState(() {});
  //   });
  //   controller.gstnum.addListener(() {
  //     setState(() {});
  //   });
  //   controller.fssaistatus.addListener(() {
  //     setState(() {});
  //   });

  //   super.initState();
  // }

  @override
  void dispose() {
    controller.gstpresent.dispose();
    controller.gstnum.dispose();
    controller.fssaistatus.dispose();

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
            style: GoogleFonts.inter(
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w500,
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
                    hintfontSize: 15,
                    controller: controller.gstpresent,
                  ),

                  SizedBox(height: 26),

                  SizedBox(
                    height: 5,
                  ),
                  AppFormField(
                    title: 'Restaurant GSTIN',
                    hintText: "Eg.22AABCU9603R1ZX",
                    hintfontSize: 15,
                    isRequired: false,
                    controller: controller.gstnum,
                  ),

                  SizedBox(
                    height: 26,
                  ),

                  AppFormField(
                    title: 'FSSAI License Status',
                    hintText: "Yes/No/Applied/Acknowledgement Received",
                    hintfontSize: 15,
                    isRequired: false,
                    controller: controller.fssaistatus,
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
                                ? 'yyyy/mm/dd'
                                : '${controller.expiry.year}/${controller.expiry.month}/${controller.expiry.day}',
                            style: GoogleFonts.inter(
                              fontSize:
                                  controller.expiry == DateTime(1900) ? 15 : 13,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w500,
                              color: controller.expiry == DateTime(1900)
                                  ? MyTheme.hinttextColor
                                  : MyTheme.hinttextchangeColor,
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
                    fontFamily: 'Inter-Regular',
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
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
                    fontSize: controller.kycimg.path.isEmpty ? 15 : 13,
                    onFilePicked: (p0) {
                      setState(() {
                        controller.kycimg = p0;
                      });
                    },
                  ),

                  SizedBox(height: 26),
                  FieldTitle(
                    text: 'Upload GSTIN Certificate',
                    required: false,
                    fontFamily: 'Inter-Regular',
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
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
                    fontSize: controller.gstinimg.path.isEmpty ? 15 : 13,
                    onFilePicked: (p0) {
                      setState(() {
                        controller.gstinimg = p0;
                      });
                    },
                  ),

                  //
                  SizedBox(height: 26),
                  FieldTitle(
                    text: 'Upload FSSAI Certificate',
                    required: false,
                    fontFamily: 'Inter-Regular',
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
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
                    fontSize: controller.fssaiimg.path.isEmpty ? 15 : 13,
                    onFilePicked: (p0) {
                      setState(() {
                        controller.fssaiimg = p0;
                      });
                    },
                  ),

                  //

                  SizedBox(height: 26),
                  OnboardingButton(
                    onTap: () {
                      print(controller.expiry);
                      formKey.currentState!.save();
                      if (formKey.currentState!.validate())
                        controller.onboardingApi(OnBoardingMethod.api3);
                    },
                    buttonbackgroundColor:
                        (controller.gstpresent.text.isEmpty ||
                                controller.gstnum.text.isEmpty ||
                                controller.fssaistatus.text.isEmpty ||
                                controller.expiry == DateTime(1900) ||
                                controller.kycimg.path.isEmpty ||
                                controller.gstinimg.path.isEmpty ||
                                controller.fssaiimg.path.isEmpty)
                            ? MyTheme.buttonColor
                            : MyTheme.buttonchangeColor,
                    text: 'CONTINUE',
                    buttontextColor: (controller.gstpresent.text.isEmpty ||
                            controller.gstnum.text.isEmpty ||
                            controller.fssaistatus.text.isEmpty ||
                            controller.expiry == DateTime(1900) ||
                            controller.kycimg.path.isEmpty ||
                            controller.gstinimg.path.isEmpty ||
                            controller.fssaiimg.path.isEmpty)
                        ? MyTheme.buttontextColor
                        : MyTheme.buttontextchangeColor,
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
