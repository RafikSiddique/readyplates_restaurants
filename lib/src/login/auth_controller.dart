import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:readyplates_restaurants/src/home/home_controller.dart';
import 'package:readyplates_restaurants/src/home/order_controller.dart';
import 'package:readyplates_restaurants/src/home/screens/home_screen.dart';
import 'package:readyplates_restaurants/src/login/auth_services.dart';
import 'package:readyplates_restaurants/src/onboarding/onboarding_controller.dart';
import 'package:readyplates_restaurants/src/onboarding/screens/index.dart';
import 'package:readyplates_restaurants/utils/shared_preference_helper.dart';
import 'package:readyplates_restaurants/utils/utils.dart';

class AuthController extends GetxController {
  final AuthenticationServices services = AuthenticationServices();
  final SharedPreferenceHelper sfHelper = Get.find();

  late TextEditingController email;
  late TextEditingController password;
  late TextEditingController password2;

  RxBool isLoggedIn = false.obs;
  int routeId = -1;
  String userId = "-1";

  void clearAll() {
    isLoggedIn.value = false;
    routeId = -1;
    userId = "-1";
    email.clear();
    password2.clear();
    password.clear();
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    password2 = TextEditingController();
    super.onInit();
  }

  Future<void> getSharedPref() async {
    isLoggedIn.value = await sfHelper.getLoggedIn();
    print(isLoggedIn.value);
    userId = await sfHelper.getUserId() ?? "-1";
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

      default:
        return OnboardingPage1.id;
    }
  }

  Future<void> signup() async {
    try {
      String id =
          await services.signup(email.text, password.text, password2.text);
      await sfHelper.setUserId(id);
      Get.find<OnboardingController>().uniqueId = id;
      Get.toNamed(OnboardingPage1.id);
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  Future<void> login(bool isChangePass) async {
    try {
      List<String> id = await services.login(
        email.text,
        password.text,
      );
      await sfHelper.setUserId(id[0]);
      await sfHelper.setRestaurantId(id[1]);
      //   int routeId = 10; // await getScreen(id[0]);
      if (!isChangePass) {
        //if (routeId >= 9) {
        isLoggedIn.value = true;
        sfHelper.setLoggedIn(true);
        Get.put(HomeController());
        Get.put(OrderController());
        Get.offAllNamed(HomePage.id);
        /*        } else {
          if (routeId == 1) {
            await Geolocator.requestPermission();
            ;
          }
      Get.find<OnboardingController>().uniqueId = id[0];

          Get.toNamed(route(routeId + 1));
        } */
      } else {}
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
