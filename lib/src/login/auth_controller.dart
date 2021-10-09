import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readyplates_restaurants/src/login/screens/login_page.dart';
import 'package:readyplates_restaurants/src/login/screens/signup_page.dart';
import 'package:readyplates_restaurants/src/login/auth_services.dart';
import 'package:readyplates_restaurants/src/onboarding/screens/onboarding_page1.dart';
import 'package:readyplates_restaurants/utils/shared_preference_helper.dart';

class AuthController extends GetxController {
  final AuthenticationServices services = AuthenticationServices();
  final SharedPreferenceHelper sfHelper = Get.find();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final password2Controller = TextEditingController();

  final usernameController = TextEditingController();
  final loginpasswordController = TextEditingController();

  final resNameController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final ownMobileController = TextEditingController();
  String rescity = '';
  final pocController = TextEditingController();
  final pocNumberController = TextEditingController();
  // RxString dob = "".obs;

  String? id;
  Future<void> signup() async {
    try {
      id = await services.signup(emailController.text, passwordController.text,
          password2Controller.text);
      sfHelper.setUserId(id!);
      Get.toNamed(SignupPage.id);
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  Future<void> login() async {
    try {
      id = await services.login(
        usernameController.text,
        loginpasswordController.text,
      );
      sfHelper.setUserId(id!);
      Get.toNamed(LoginPage.id);
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  Future<void> onboardingapi1() async {
    String ownName = firstNameController.text + " " + lastNameController.text;
    try {
      id = await services.onboardingapi1(
        id!,
        resNameController.text,
        ownName,
        ownMobileController.text,
        rescity,
        pocController.text,
        pocNumberController.text,
      );
      sfHelper.setUserId(id!);
      sfHelper.getUserId();
      Get.toNamed(OnboardingPage1.id);
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

}