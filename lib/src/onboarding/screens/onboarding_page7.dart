import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:readyplates_restaurants/src/onboarding/onboarding_controller.dart';
import 'package:readyplates_restaurants/utils/my_color.dart';
import 'package:readyplates_restaurants/widgets/field_title.dart';
import 'package:readyplates_restaurants/widgets/onboardingWrapper.dart';

class OnboardingPage7 extends StatefulWidget {
  static const resId = "/onboarding7";
  const OnboardingPage7({Key? key}) : super(key: key);

  @override
  _OnboardingPage7State createState() => _OnboardingPage7State();
}

class _OnboardingPage7State extends State<OnboardingPage7> {
  final OnboardingController onBoardingController = Get.find();
  List<Widget> images(Size size) {
    return [
      for (int o = 0; o < onBoardingController.allImages().length; o++)
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            FieldTitle(
              text: '${onBoardingController.titleText[o]}',
              fontFamily: 'Inter-Regular',
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
            SizedBox(
              height: 5,
            ),
            ImageCard(
              path: onBoardingController.selectedImages[o],
              width: size.width,
              height: size.height * 0.2,
            ),
            SizedBox(
              height: 7,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              for (int i = 0;
                  i < onBoardingController.allImages()[o].length;
                  i++)
                ImageCard(
                  path: onBoardingController.allImages()[o][i],
                  name: onBoardingController.allNames()[o][i],
                  height: size.height * 0.07,
                  onSelect: (selectedPath) {
                    setState(() {
                      onBoardingController.selectedImages[o] = selectedPath;
                    });
                  },
                )
            ]),
          ],
        ),
    ];
  }

  void onPageChange(int i) {
    setState(() {
      onBoardingController.pageIndex.value = i;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return OnBoardingWrapper(
      onboardingController: onBoardingController,
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
                switch (onBoardingController.pageIndex.value) {
                  case 0:
                    Get.back();
                    break;
                  case 1:
                    onBoardingController.pageController.animateToPage(0,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.ease);
                    break;
                  case 2:
                    onBoardingController.pageController.animateToPage(1,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.ease);
                    break;
                  case 3:
                    onBoardingController.pageController.animateToPage(2,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.ease);
                    break;
                  case 4:
                    onBoardingController.pageController.animateToPage(3,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.ease);
                    break;
                  default:
                }
              }),
          centerTitle: true,
          title: Text(
            'Restaurant Bio',
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
          padding: const EdgeInsets.only(
            left: 16,
            right: 16,
          ),
          child: Column(
            children: [
              Container(
                height: size.height * 0.33,
                child: PageView(
                  controller: onBoardingController.pageController,
                  physics: NeverScrollableScrollPhysics(),
                  allowImplicitScrolling: false,
                  onPageChanged: onPageChange,
                  children: images(size),
                ),
              ),
              Obx(() => Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: List.generate(
                          4,
                          (index) => Container(
                                height: 5,
                                width: 5,
                                margin: EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  color: index ==
                                          onBoardingController.pageIndex.value
                                      ? Color(0xff00ADB5)
                                      : Color(0xffE0E0E0),
                                  shape: BoxShape.circle,
                                ),
                              )),
                    ),
                  )),
              SizedBox(
                height: size.height * 0.015,
              ),
              Container(
                height: size.height * 0.38,
                child: Wrap(
                  alignment: WrapAlignment.spaceBetween,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  runAlignment: WrapAlignment.spaceBetween,
                  children: [
                    for (int i = 0;
                        i < onBoardingController.allSelectionImage().length;
                        i++)
                      ImageUploadCard(
                          name: onBoardingController.allNames()[
                              onBoardingController.pageIndex.value][i],
                          path: onBoardingController.allSelectionImage()[
                              onBoardingController.pageIndex.value][i],
                          selectImage: (path) {
                            onBoardingController.allSelectionImage()[
                                onBoardingController.pageIndex.value][i] = path;
                            setState(() {});
                          }),
                  ],
                ),
              ),
              // SizedBox(
              //   height: size.height * 0.05,
              // ),
              Spacer(),
              InkWell(
                onTap: () async {
                  await onBoardingController
                      .onboardingApi(OnBoardingMethod.api7);
                },
                child: InkWell(
                  child: Container(
                    height: 40.11,
                    decoration: BoxDecoration(
                      color: MyTheme.buttonColor,
                      borderRadius: BorderRadius.all(Radius.circular(6)),
                    ),
                    child: Obx(() => Center(
                          child: onBoardingController.loading.value
                              ? CircularProgressIndicator()
                              : Text(
                                  'CONTINUE',
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
                        )),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ImageCard extends StatelessWidget {
  final String path;
  final String? name;
  final double width;
  final double height;
  final void Function(String)? onSelect;
  const ImageCard(
      {Key? key,
      required this.path,
      this.onSelect,
      this.name,
      this.width = 80,
      this.height = 70})
      : assert(name != null ? onSelect != null : true),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: InkWell(
        onTap: () {
          if (name != null) {
            onSelect!(path);
          }
        },
        child: Container(
          height: height,
          width: width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Container(
                  decoration: BoxDecoration(),
                  child: Image.asset(
                    path,
                    height: name != null ? height - 15 : height,
                    width: width,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              if (name != null)
                FittedBox(
                    child: Text(
                  name!,
                  style: TextStyle(fontSize: 10),
                )),
            ],
          ),
        ),
      ),
    );
  }
}

class ImageUploadCard extends StatelessWidget {
  final String path;
  final void Function(String) selectImage;
  final String name;
  ImageUploadCard({
    Key? key,
    required this.path,
    required this.name,
    required this.selectImage,
  }) : super(key: key);
  final ImagePicker imagePicker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.42,
      height: size.width * 0.4,
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: MyTheme.borderColor,
          style: BorderStyle.solid,
        ),
        borderRadius: BorderRadius.all(Radius.circular(6)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Spacer(),
          Container(
            width: path == "" ? 38 : size.width * 0.45,
            height: path == "" ? 38 : size.width * 0.32,
            alignment: Alignment.center,
            child: path == ""
                ? Image(
                    image: AssetImage(
                      'assets/images/imglogo.png',
                    ),
                  )
                : Image.file(
                    File(path),
                    fit: BoxFit.contain,
                  ),
          ),
          Spacer(),
          Container(
            height: 27,
            decoration: BoxDecoration(
              color: Color(0xffFFFFFF),
              border: Border.all(
                width: 1,
                color: MyTheme.borderColor,
                style: BorderStyle.solid,
              ),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(6),
                  bottomRight: Radius.circular(6)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 12.5),
                  child: Text(
                    name,
                    style: TextStyle(
                      fontSize: 9,
                      fontFamily: 'Poppins',
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.normal,
                      letterSpacing: -0.229412,
                      color: MyTheme.bottomtextColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                InkWell(
                  onTap: () async {
                    XFile? file = await imagePicker.pickImage(
                        source: ImageSource.gallery);
                    if (file != null) {
                      selectImage(file.path);
                    }
                  },
                  child: Container(
                    width: 27,
                    height: 27,
                    decoration: BoxDecoration(
                      color: Color(0xffEFEFEF),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(0),
                        topRight: Radius.circular(0),
                        bottomLeft: Radius.circular(0),
                        bottomRight: Radius.circular(6.0),
                      ),
                    ),
                    child: Center(
                      child: Container(
                          width: 16,
                          height: 16,
                          child: Image(
                            image: AssetImage(
                              'assets/images/upload.png',
                            ),
                          )),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
