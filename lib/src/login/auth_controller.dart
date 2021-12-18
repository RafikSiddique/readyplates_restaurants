import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:readyplates_restaurants/src/home/home_controller.dart';
import 'package:readyplates_restaurants/src/login/screens/login_page.dart';
import 'package:readyplates_restaurants/src/login/screens/otp_verify_page.dart';
import 'package:readyplates_restaurants/src/orders/order_controller.dart';
import 'package:readyplates_restaurants/src/home/screens/home_screen.dart';
import 'package:readyplates_restaurants/src/login/auth_services.dart';
import 'package:readyplates_restaurants/src/login/screens/changepassword_page1.dart';
import 'package:readyplates_restaurants/src/onboarding/onboarding_controller.dart';
import 'package:readyplates_restaurants/src/onboarding/screens/index.dart';
import 'package:readyplates_restaurants/utils/fcm_service.dart';
import 'package:readyplates_restaurants/utils/shared_preference_helper.dart';

String uid = '';

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

  late List<TextEditingController> otpText;
  String otp = '';
  late List<FocusNode> otpFields;

  RxString otpVerification = "".obs;

  String otpVerified = "OTP Verified";
  String incorrect = "Incorrect OTP";

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    password2 = TextEditingController();
    otpFields = List.generate(6, (index) => FocusNode());
    otpText = List.generate(6, (index) => TextEditingController());
    super.onInit();
  }

  Future<void> getSharedPref() async {
    isLoggedIn.value = await sfHelper.getLoggedIn();
    print(isLoggedIn.value);
    userId = await sfHelper.getUserId() ?? "-1";
    print(userId);
  }

  String route(int id) {
    final controller = Get.put(OnboardingController());
    controller.isEditing = false;
    switch (id) {
      case 1:
        controller.initControllers1();
        return OnboardingPage1.id;
      case 2:
        controller.init2();
        return OnboardingPage2.id;
      case 3:
        controller.init3();

        return OnboardingPage3.id;
      case 4:
        controller.init4();

        return OnboardingPage4.id;
      case 5:
        controller.init5();
        return OnboardingPage5.id;
      case 6:
        controller.init6();
        return OnboardingPage6.id;
      case 7:
        return OnboardingPage7.id;
      case 8:
        controller.init8();
        return OnboardingPage8.id;
      case 9:
        controller.pageIndex.value = 0;
        return OnboardingPage9.resId;
      case 10:
        controller.pageIndex.value = 1;
        return OnboardingPage9.resId;
      case 11:
        controller.pageIndex.value = 2;
        return OnboardingPage9.resId;
      case 12:
        controller.pageIndex.value = 3;
        return OnboardingPage9.resId;
      default:
        return OnboardingPage1.id;
    }
  }

  Future<void> signup() async {
    try {
      String id = await services.signup(
        email.text.toLowerCase(),
        password.text,
        password2.text,
      );
      await sfHelper.setUserId(id);
      uid = id;
      email.clear();
      password.clear();
      password2.clear();
      final oController = Get.put(OnboardingController());
      oController.isEditing = false;
      oController.uniqueId = id;
      Get.toNamed(OnboardingPage1.id);
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  Future<void> login(bool isChangePass) async {
    try {
      List<String> id = await services.login(
        email.text.toLowerCase(),
        password.text,
      );
      await sfHelper.setUserId(id[0]);
      await sfHelper.setRestaurantId(id[1]);
      FirebaseMessagingService().getToken();
      if (!isChangePass) {
        int routeId = await getScreen(id[0]);
        if (routeId >= 9) {
          isLoggedIn.value = true;
          sfHelper.setLoggedIn(true);

          final controller = Get.put(HomeController(selectedIndex: 0.obs));
          await controller.getFoodItems();
          final oController = Get.put(OrderController());
          await oController.getOrderItems();
          Get.offAllNamed(HomePage.id);
          email.clear();
          password.clear();
          password2.clear();
        } else {
          Get.put(OnboardingController());
          Get.find<OnboardingController>().uniqueId = id[0];

          if (routeId == 1) {
            await Geolocator.requestPermission();
            Position position = await Geolocator.getCurrentPosition();
            Get.toNamed(OnboardingPage2.id,
                arguments: LatLng(position.latitude, position.longitude));
          } else {
            Get.toNamed(route(routeId + 1));
          }
        }
      } else {
        print(isChangePass);
        Get.offNamed(ChangePasswordPage1.id);
        password.clear();
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  Future<void> changePassword() async {
    try {
      await services.changePassword(
        email.text.toLowerCase(),
        password.text,
      );
      if (uid != '') {
        final c = Get.find<HomeController>();
        Get.offAllNamed(HomePage.id);
        c.selectedIndex.value = 4;
      } else {
        email.clear();
        password.clear();
        password2.clear();
        for (var i = 0; i < otpText.length; i++) {
          otpText[i].clear();
        }
        otpVerification = "".obs;
        otp = "";
        Get.toNamed(LoginPage.id);
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  Future<void> forgotPassword() async {
    try {
      await services.forgotPassword(
        email.text.toLowerCase(),
      );

      Get.toNamed(VerifyOtpPage.id);
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
