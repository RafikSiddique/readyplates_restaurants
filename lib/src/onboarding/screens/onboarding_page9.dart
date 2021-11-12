import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_card_swipper/flutter_card_swiper.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:readyplates_restaurants/src/onboarding/onboarding_controller.dart';
import 'package:readyplates_restaurants/utils/my_color.dart';
import 'package:readyplates_restaurants/widgets/onboardingWrapper.dart';
import 'package:readyplates_restaurants/widgets/onboardingbutton.dart';

class OnboardingPage9 extends StatefulWidget {
  static const resId = "/onboarding9";
  const OnboardingPage9({Key? key}) : super(key: key);

  @override
  _OnboardingPage9State createState() => _OnboardingPage9State();
}

class _OnboardingPage9State extends State<OnboardingPage9> {
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
      appBarTitle: 'Restaurant Bio',
      child: Padding(
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
                                onBoardingController.pageIndex.value][0] = path;
                            setState(() {});
                          }),
                      ImageUploadCard(
                          path: onBoardingController.allSelectionImage()[
                              onBoardingController.pageIndex.value][1],
                          name: onBoardingController.allNames()[
                              onBoardingController.pageIndex.value][1],
                          selectImage: (path) {
                            onBoardingController.allSelectionImage()[
                                onBoardingController.pageIndex.value][1] = path;
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
                                onBoardingController.pageIndex.value][2] = path;
                            setState(() {});
                          }),
                      ImageUploadCard(
                          path: onBoardingController.allSelectionImage()[
                              onBoardingController.pageIndex.value][3],
                          name: onBoardingController.allNames()[
                              onBoardingController.pageIndex.value][3],
                          selectImage: (path) {
                            onBoardingController.allSelectionImage()[
                                onBoardingController.pageIndex.value][3] = path;
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
                await onBoardingController.onboardingApi(OnBoardingMethod.api7);
              },
              buttonbackgroundColor: onBoardingController.loading.value
                  ? MyTheme.buttonchangeColor
                  : MyTheme.buttonColor,
              text: 'CONTINUE',
              buttontextColor: onBoardingController.loading.value
                  ? MyTheme.buttontextchangeColor
                  : MyTheme.buttontextColor,
            ),

            SizedBox(
              height: 16,
            ),
          ],
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

class ImageUploadCard extends StatefulWidget {
  final String path;
  final void Function(String) selectImage;
  final String name;
  ImageUploadCard({
    Key? key,
    required this.path,
    required this.name,
    required this.selectImage,
  }) : super(key: key);

  @override
  State<ImageUploadCard> createState() => _ImageUploadCardState();
}

class _ImageUploadCardState extends State<ImageUploadCard> {
  final ImagePicker imagePicker = ImagePicker();

  Future<void> pickImage({
    required void Function(File) imageFile,
  }) async {
    XFile? file = await imagePicker.pickImage(source: ImageSource.gallery);

    if (file != null) {
      File? croppedFile = await ImageCropper.cropImage(
        sourcePath: file.path,
        aspectRatio: CropAspectRatio(ratioX: 4, ratioY: 3),
        aspectRatioPresets: [CropAspectRatioPreset.square],
        cropStyle: CropStyle.rectangle,
      );
      if (croppedFile != null) {
        imageFile(croppedFile);
        setState(() {
          fileName = file.name;
        });
      }
    }
  }

  String fileName = "";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () async {
        await pickImage(
          imageFile: (p0) {
            widget.selectImage(p0.path);
          },
        );
      },
      child: Container(
        width: size.width * 0.42,
        height: size.height * 0.20,
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
            Expanded(
              child: Container(
                width: widget.path == "" ? 38 : size.width * 0.42,
                height: widget.path == "" ? 38 : (size.height * 0.17) - 30,
                alignment: Alignment.center,
                child: widget.path == ""
                    ? Image(
                        image: AssetImage(
                          'assets/images/imglogo.png',
                        ),
                      )
                    : Image.file(
                        File(widget.path),
                        fit: BoxFit.cover,
                      ),
              ),
            ),
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
                        widget.path == "" ? widget.name : fileName,
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                          overflow: TextOverflow.ellipsis,
                          fontSize: 9,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.normal,
                          color: MyTheme.bottomtextColor,
                        )),
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
                          child: Image(
                            image: AssetImage(
                              'assets/images/upload.png',
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
