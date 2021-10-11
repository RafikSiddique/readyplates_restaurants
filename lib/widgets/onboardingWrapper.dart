import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:readyplates_restaurants/src/onboarding/onboarding_controller.dart';

class OnBoardingWrapper extends StatelessWidget {
  final OnboardingController onboardingController;
  final Widget child;
  OnBoardingWrapper(
      {Key? key, required this.onboardingController, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Stack(
          alignment: Alignment.center,
          children: [
            child,
            if (onboardingController.loading.value)
              IgnorePointer(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                  child: Center(child: CircularProgressIndicator()),
                ),
              )
          ],
        ));
  }
}
