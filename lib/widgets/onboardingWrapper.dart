import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readyplates_restaurants/src/onboarding/onboarding_controller.dart';
import 'package:readyplates_restaurants/utils/my_color.dart';
import 'package:readyplates_restaurants/widgets/onboardingbutton.dart';

class OnBoardingWrapper extends StatelessWidget {
  final OnboardingController onboardingController;
  final Widget child;
  final String appBarTitle;
  final String buttonText;
  final String? bottomText;
  final List<TextEditingController> textControllers;
  final Function() onTap;
  final bool enabled;
  OnBoardingWrapper(
      {Key? key,
      required this.onboardingController,
      required this.child,
      required this.appBarTitle,
      required this.buttonText,
      required this.onTap,
      this.bottomText,
      required this.textControllers,
      this.enabled = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.showSnackbar(
          GetBar(
            title: "Warning",
            message:
                "You can't you back at this stage, if you want to edit, you can edit after logging in",
            duration: Duration(seconds: 2),
          ),
        );
        return false;
      },
      child: Obx(() => Stack(
            alignment: Alignment.center,
            children: [
              Scaffold(
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
                        Get.showSnackbar(GetBar(
                          title: "Warning",
                          duration: Duration(seconds: 2),
                          message:
                              "You can't you back at this stage, if you want to edit, you can edit after logging in",
                        ));
                      }),
                  centerTitle: true,
                  title: Text(
                    appBarTitle,
                    style: GoogleFonts.inter(
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w500,
                      fontSize: 17,
                      color: MyTheme.appbartextColor,
                    ),
                  ),
                ),
                body: child,
                bottomNavigationBar: AnimatedBuilder(
                  animation: Listenable.merge(
                    textControllers,
                  ),
                  builder: (context, child) {
                    return Padding(
                      padding:
                          const EdgeInsets.only(bottom: 8.0, left: 8, right: 8),
                      child: AnimatedSwitcher(
                        duration: Duration(milliseconds: 300),
                        child: OnboardingButton(
                            key: ValueKey(textControllers
                                    .any((element) => element.text.isEmpty) ||
                                !enabled),
                            height: 50,
                            onTap: onTap,
                            buttonbackgroundColor: textControllers.any(
                                        (element) => element.text.isEmpty) ||
                                    !enabled
                                ? MyTheme.buttonColor
                                : MyTheme.buttonchangeColor,
                            text: buttonText,
                            buttontextColor: textControllers.any(
                                        (element) => element.text.isEmpty) ||
                                    !enabled
                                ? MyTheme.buttontextColor
                                : MyTheme.buttontextchangeColor),
                      ),
                    );
                  },
                ),
              ),
              if (onboardingController.loading.value)
                IgnorePointer(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                    child: Center(child: CircularProgressIndicator()),
                  ),
                )
            ],
          )),
    );
  }
}
