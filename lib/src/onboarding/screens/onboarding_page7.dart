import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:readyplates_restaurants/src/home/screens/add_menu_page.dart';
import 'package:readyplates_restaurants/src/home/screens/home_screen.dart';
import 'package:readyplates_restaurants/src/onboarding/onboarding_controller.dart';

class OnboardingPage7 extends StatefulWidget {
  const OnboardingPage7({Key? key}) : super(key: key);

  @override
  _OnboardingPage7State createState() => _OnboardingPage7State();
}

class _OnboardingPage7State extends State<OnboardingPage7> {
  final PageController pageController = PageController();
  final OnboardingController onBoardingController = Get.find();
  List<Widget> images(Size size) {
    return [
      for (int o = 0; o < onBoardingController.allImages().length; o++)
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            RichText(
              text: TextSpan(
                  text: onBoardingController.titleText[o],
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
              height: size.height * 0.001,
            ),
            ImageCard(
              path: onBoardingController.selectedImages[o],
              width: size.width,
              height: size.height * 0.24,
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              for (int i = 0;
                  i < onBoardingController.allImages()[o].length;
                  i++)
                ImageCard(
                  path: onBoardingController.allImages()[o][i],
                  name: onBoardingController.allNames()[o][i],
                  height: size.height * 0.079,
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

  bool isImagesUploaded(List<String> list) {
    return list[0] != "" && list[1] != "" && list[2] != "" && list[3] != "";
  }

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
                switch (onBoardingController.pageIndex.value) {
                  case 0:
                    Get.back();
                    break;
                  case 1:
                    pageController.animateToPage(0,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.ease);
                    break;
                  case 2:
                    pageController.animateToPage(1,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.ease);
                    break;
                  case 3:
                    pageController.animateToPage(2,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.ease);
                    break;
                  case 4:
                    pageController.animateToPage(3,
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
              letterSpacing: -0.226667,
              color: Color(0xff393E46),
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
                Expanded(
                  child: PageView(
                    controller: pageController,
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
                  height: size.height * 0.42,
                  child: Wrap(
                    runSpacing: 5,
                    spacing: 5,
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
                                      onBoardingController.pageIndex.value][i] =
                                  path;
                              setState(() {});
                            })
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                InkWell(
                  onTap: () async {
                    switch (onBoardingController.pageIndex.value) {
                      case 0:
                        if (isImagesUploaded(
                            onBoardingController.fasciaImages)) {
                          await onBoardingController
                              .uploadImage(onBoardingController.fasciaImages);
                          pageController.animateToPage(1,
                              duration: Duration(milliseconds: 500),
                              curve: Curves.ease);
                        } else {
                          Get.snackbar("Error", "Upload all the images");
                        }
                        break;
                      case 1:
                        if (isImagesUploaded(
                            onBoardingController.ambienceImages)) {
                          await onBoardingController
                              .uploadImage(onBoardingController.ambienceImages);
                          pageController.animateToPage(2,
                              duration: Duration(milliseconds: 500),
                              curve: Curves.ease);
                        } else {
                          Get.snackbar("Error", "Upload all the images");
                        }
                        break;
                      case 2:
                        if (isImagesUploaded(onBoardingController.foodImages)) {
                          await onBoardingController
                              .uploadImage(onBoardingController.foodImages);
                          pageController.animateToPage(3,
                              duration: Duration(milliseconds: 500),
                              curve: Curves.ease);
                        } else {
                          Get.snackbar("Error", "Upload all the images");
                        }
                        break;
                      case 3:
                        if (isImagesUploaded(
                            onBoardingController.covidProtocol)) {
                          await onBoardingController
                              .uploadImage(onBoardingController.covidProtocol);

                          Get.offAllNamed(HomePage.id);
                        } else {
                          Get.snackbar("Error", "Upload all the images");
                        }
                        break;
                      default:
                    }
                  },
                  child: InkWell(
                    child: Container(
                      // width: 343,
                      height: 40.11,
                      decoration: BoxDecoration(
                        color: Color(0xff7A7E83),
                        borderRadius: BorderRadius.all(Radius.circular(6)),
                      ),
                      child: Center(
                        child: onBoardingController.imageLoading.value
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
                                  color: Color(0xffE5E5E5),
                                ),
                              ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
              ],
            )),
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
  const ImageUploadCard({
    Key? key,
    required this.path,
    required this.name,
    required this.selectImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.45,
      height: size.width * 0.4,
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: Color(0xffE0E0E0),
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
                color: Color(0xffE0E0E0),
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
                      color: Color(0xff6E6D7A),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                InkWell(
                  onTap: () async {
                    ImagePicker imagePicker = ImagePicker();
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
