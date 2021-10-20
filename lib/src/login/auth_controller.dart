import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readyplates_restaurants/src/home/screens/home_screen.dart';
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
  int routeId = -1;
  String userId = "-1";

  void clearAll() {
    isLoggedIn.value = false;
    routeId = -1;
    userId = "-1";
    emailController.clear();
    password2Controller.clear();
    passwordController.clear();
  }

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> getSharedPref() async {
    await sfHelper.getLoggedIn().then((value) => isLoggedIn.value = value);
    print(isLoggedIn.value);
    await sfHelper.getUserId().then((value) => userId = value);
    print(userId);
  }

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
      String id = await services.signup(emailController.text,
          passwordController.text, password2Controller.text);

      sfHelper.setUserId(id);
      Get.find<OnboardingController>().uniqueId = id;
      Get.toNamed(OnboardingPage1.id);
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  Future<void> login() async {
    try {
      List<String> id = await services.login(
        emailController.text,
        passwordController.text,
      );
      sfHelper.setUserId(id[0]);
      sfHelper.setRestaurantId(id[1]);
      Get.find<OnboardingController>().uniqueId = id[0];

      /* int routeId = await getScreen(id);
      if (routeId >= 9) { */
      isLoggedIn.value = true;
      sfHelper.setLoggedIn(true);
      Get.offAllNamed(HomePage.id);
/*       } else {
        if (routeId == 1) {
          await Geolocator.requestPermission();
          ;
        }
        Get.toNamed(route(routeId + 1));
      } */
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
