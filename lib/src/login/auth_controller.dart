import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readyplates_restaurants/pages/add_menu_page.dart';
import 'package:readyplates_restaurants/src/login/screens/login_page.dart';
import 'package:readyplates_restaurants/src/login/auth_services.dart';
import 'package:readyplates_restaurants/src/onboarding/onboarding_controller.dart';
import 'package:readyplates_restaurants/src/onboarding/screens/index.dart';
import 'package:readyplates_restaurants/utils/shared_preference_helper.dart';
import 'package:readyplates_restaurants/utils/utils.dart';

class AuthController extends GetxController {
  final AuthenticationServices services = AuthenticationServices();
  final SharedPreferenceHelper sfHelper = Get.find();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final password2Controller = TextEditingController();

  RxBool isLoggedIn = false.obs;

  String route(int id) {
    switch (id) {
      case 1:
        return OnboardingPage1.id;
      case 2:
        return OnboardingPage2.id;
      case 3:
        return OnboardingPage3.id;
      case 4:
        return Routes.onboarding4Route;
      case 5:
        return Routes.onboarding5Route;
      case 6:
        return Routes.onboarding6Route;
      case 7:
        return Routes.onboarding7Route;
      case 8:
        return Routes.onboarding8Route;
      case 9:
        return Routes.onboarding9Route;

      default:
        return OnboardingPage1.id;
    }
  }

  Future<void> signup() async {
    try {
      await services.signup(emailController.text, passwordController.text,
          password2Controller.text);

      await login(true);

      Get.toNamed(OnboardingPage1.id);
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  Future<void> login([bool isImplicit = false]) async {
    try {
      String id = await services.login(
        emailController.text,
        passwordController.text,
      );
      sfHelper.setUserId(id);
      Get.find<OnboardingController>().uniqueId = id;

      int routeId = await getScreen(id);
      if (routeId == 9) {
        isLoggedIn.value = true;
        sfHelper.setLoggedIn(true);
        //TODO push to home
      } else
        Get.toNamed(route(routeId + 1));
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  Future<int> getScreen(String uid) async {
    try {
      int id = await services.getOnboardingScreen(uid);
      return id;
    } catch (e) {
      Get.snackbar("Error", e.toString());
      return 0;
    }
  }
}
