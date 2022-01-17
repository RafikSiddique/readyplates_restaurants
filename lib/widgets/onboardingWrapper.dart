import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readyplates_restaurants/src/login/auth_controller.dart';
import 'package:readyplates_restaurants/src/onboarding/onboarding_controller.dart';
import 'package:readyplates_restaurants/src/staticscreens/opening_screen.dart';
import 'package:readyplates_restaurants/utils/my_color.dart';
import 'package:readyplates_restaurants/utils/shared_preference_helper.dart';
import 'package:readyplates_restaurants/widgets/onboardingbutton.dart';
import 'package:readyplates_restaurants/widgets/snackbar.dart';

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
        if (!onboardingController.isEditing) {
          Get.showSnackbar(
            GetBar(
              backgroundColor: MyTheme.verifyButtonColor,
              titleText: Text(
                "Warning",
                style: GoogleFonts.nunito(
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                  color: MyTheme.appbartextColor,
                ),
              ),
              messageText: Text(
                "You can't you back at this stage, if you want to edit, you can edit after logging in",
                style: GoogleFonts.nunito(
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.normal,
                  fontSize: 17,
                  color: MyTheme.appbartextColor,
                ),
              ),
              // title: "Warning",
              // message:
              //     "You can't you back at this stage, if you want to edit, you can edit after logging in",
              duration: Duration(seconds: 2),
              mainButton: TextButton(
                  onPressed: () {
                    Get.find<AuthController>().clearAll();
                    SharedPreferenceHelper().clear();
                    Get.offAllNamed(OpeningScreen.id);
                  },
                  child: Text(
                    "Logout?",
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w600,
                      fontSize: 17,
                      color: MyTheme.orangeColor,
                    ),
                  )),
            ),
          );
          return false;
        } else {
          Get.back();
          return true;
        }
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
                        color: appBarTitle == 'Table Configuration'
                            ? MyTheme.appbartextColor
                            : MyTheme.orangeColor,
                      ),
                      onPressed: () {
                        if (!onboardingController.isEditing) {
                          Get.showSnackbar(MySnackBar.myLoadingSnackBar(
                            color: MyTheme.verifyButtonColor,
                            title: 'Warning',
                            message:
                                "You can't you back at this stage, if you want to edit, you can edit after logging in",
                            icon: Icon(
                              Icons.warning_amber_rounded,
                              color: MyTheme.orangelightColor,
                            ),
                          ));
                        } else {
                          Get.back();
                        }
                      }),
                  centerTitle: true,
                  title: Text(
                    appBarTitle,
                    style: GoogleFonts.inter(
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w600,
                      fontSize: 17,
                      color: appBarTitle == 'Table Configuration'
                          ? MyTheme.appbartextColor
                          : MyTheme.orangeColor,
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
                      padding: const EdgeInsets.only(
                          bottom: 16, left: 16, right: 16),
                      child: AnimatedSwitcher(
                        duration: Duration(milliseconds: 300),
                        child: OnboardingButton(
                          key: ValueKey(textControllers
                                  .any((element) => element.text.isEmpty) ||
                              !enabled),
                          height: 50,
                          onTap: onTap,
                          buttonbackgroundColor: textControllers
                                      .any((element) => element.text.isEmpty) ||
                                  !enabled
                              ? MyTheme.verifyButtonColor
                              : MyTheme.orangeColor,
                          text: buttonText,
                          buttontextColor: textControllers
                                      .any((element) => element.text.isEmpty) ||
                                  !enabled
                              ? MyTheme.verifyTextColor
                              : MyTheme.appbackgroundColor,
                        ),
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
