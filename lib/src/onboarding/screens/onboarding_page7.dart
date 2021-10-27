import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_card_swipper/flutter_card_swiper.dart';
// import 'package:flutter_swiper/flutter_swiper.dart';
// import 'package:flutter_swiper/flutter_swiper.dart';

// import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:readyplates_restaurants/src/onboarding/onboarding_controller.dart';
import 'package:readyplates_restaurants/utils/my_color.dart';
// import 'package:readyplates_restaurants/widgets/field_title.dart';
import 'package:readyplates_restaurants/widgets/onboardingWrapper.dart';
import 'package:readyplates_restaurants/widgets/onboardingbutton.dart';

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
        new Swiper(
//class ImageUploadCard extends StatelessWidget {

            itemWidth: MediaQuery.of(context).size.width,
            autoplay: true,
            itemBuilder: (context, index) {
              return ImageCard(
                path: onBoardingController.allImages()[o][index],
                width: size.width,
                height: null,
              );

              // Center(
              //   child: Image.asset(
              //     "assets/images/frontfascia.png",
              //     fit: BoxFit.contain,
              //   ),
              // );
            },
            itemCount: 4),
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
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: size.height * 0.3,
                child: PageView(
                  controller: onBoardingController.pageController,
                  physics: NeverScrollableScrollPhysics(),
                  allowImplicitScrolling: false,
                  onPageChanged: onPageChange,
                  children: images(size),
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
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
                height: size.height * 0.02,
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ImageUploadCard(
                            path: onBoardingController.allSelectionImage()[
                                onBoardingController.pageIndex.value][0],
                            name: onBoardingController.allNames()[
                                onBoardingController.pageIndex.value][0],
                            selectImage: (path) {
                              onBoardingController.allSelectionImage()[
                                      onBoardingController.pageIndex.value][0] =
                                  path;
                              setState(() {});
                            }),
                        ImageUploadCard(
                            path: onBoardingController.allSelectionImage()[
                                onBoardingController.pageIndex.value][1],
                            name: onBoardingController.allNames()[
                                onBoardingController.pageIndex.value][1],
                            selectImage: (path) {
                              onBoardingController.allSelectionImage()[
                                      onBoardingController.pageIndex.value][1] =
                                  path;
                              setState(() {});
                            }),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ImageUploadCard(
                            path: onBoardingController.allSelectionImage()[
                                onBoardingController.pageIndex.value][2],
                            name: onBoardingController.allNames()[
                                onBoardingController.pageIndex.value][2],
                            selectImage: (path) {
                              onBoardingController.allSelectionImage()[
                                      onBoardingController.pageIndex.value][2] =
                                  path;
                              setState(() {});
                            }),
                        ImageUploadCard(
                            path: onBoardingController.allSelectionImage()[
                                onBoardingController.pageIndex.value][3],
                            name: onBoardingController.allNames()[
                                onBoardingController.pageIndex.value][3],
                            selectImage: (path) {
                              onBoardingController.allSelectionImage()[
                                      onBoardingController.pageIndex.value][3] =
                                  path;
                              setState(() {});
                            }),
                      ],
                    ),
                  ],
                ),
              ),
              // SizedBox(
              //   height: size.height * 0.26,
              // ),
              //Spacer(),
              OnboardingButton(
                onTap: () async {
                  await onBoardingController
                      .onboardingApi(OnBoardingMethod.api7);
                },
                buttonbackgroundColor: onBoardingController.loading.value
                    ? MyTheme.buttonchangeColor
                    : MyTheme.buttonColor,
                text: 'CONTINUE',
                buttontextColor: onBoardingController.loading.value
                    ? MyTheme.buttontextchangeColor
                    : MyTheme.buttontextColor,
              ),
              // InkWell(
              //   onTap: () async {
              //     await onBoardingController
              //         .onboardingApi(OnBoardingMethod.api7);
              //   },
              //   child: InkWell(
              //     child: Container(
              //       height: 40.11,
              //       decoration: BoxDecoration(
              //         color: MyTheme.buttonColor,
              //         borderRadius: BorderRadius.all(Radius.circular(6)),
              //       ),
              //       child: Obx(() => Center(
              //             child: onBoardingController.loading.value
              //                 ? CircularProgressIndicator()
              //                 : Text(
              //                     'CONTINUE',
              //                     textAlign: TextAlign.center,
              //                     style: TextStyle(
              //                       fontSize: 17,
              //                       fontFamily: 'Inter',
              //                       fontStyle: FontStyle.normal,
              //                       fontWeight: FontWeight.w600,
              //                       letterSpacing: -0.28,
              //                       color: MyTheme.buttontextColor,
              //                     ),
              //                   ),
              //           )),
              //     ),
              //   ),
              // ),

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
  final double? height;
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
          child: ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Container(
              decoration: BoxDecoration(),
              child: Image.asset(
                path,
                height: name != null
                    ? (height != null ? height! - 15 : height)
                    : height,
                width: width,
                fit: BoxFit.cover,
              ),
            ),
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
    return InkWell(
      onTap: () async {
        print('object');

        XFile? file = await imagePicker.pickImage(source: ImageSource.gallery);
        if (file != null) {
          selectImage(file.path);
          print('gfdgggggdg${file.path.split('/').last}');
          print('gfdgggggdgrtetertet${path.split('/').last}');
        }
      },
      child: Container(
        width: size.width * 0.42,
        height: size.height * 0.17,
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
                      fit: BoxFit.fill,
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
                    padding: const EdgeInsets.only(left: 12),
                    child: Container(
                      width: 80,
                      child: Text(
                        path == "" ? name : path.split('/').last,
                        style: TextStyle(
                          overflow: TextOverflow.ellipsis,
                          fontSize: 9,
                          fontFamily: 'Poppins',
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.normal,
                          color: MyTheme.bottomtextColor,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Container(
                    width: 27,
                    height: 27,
                    decoration: BoxDecoration(
                      color: Color(0xffEFEFEF),
                      // color: Colors.amber,
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
                          // color: Colors.red,
                          child: InkWell(
                            onTap: () async {
                              print('object');

                              XFile? file = await imagePicker.pickImage(
                                  source: ImageSource.gallery);
                              if (file != null) {
                                selectImage(file.path);
                                print('gfdgggggdg${file.path.split('/').last}');
                                print(
                                    'gfdgggggdgrtetertet${path.split('/').last}');
                              }
                            },
                            child: Image(
                              image: AssetImage(
                                'assets/images/upload.png',
                              ),
                            ),
                          )),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
