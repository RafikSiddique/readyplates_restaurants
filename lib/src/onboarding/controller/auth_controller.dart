import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readyplates_restaurants/src/onboarding/screens/onboarding_page1.dart';
import 'package:readyplates_restaurants/src/onboarding/screens/onboarding_page2.dart';
import 'package:readyplates_restaurants/src/onboarding/screens/onboarding_page3.dart';
import 'package:readyplates_restaurants/src/screens/login_page.dart';
import 'package:readyplates_restaurants/src/screens/signup_page.dart';
import 'package:readyplates_restaurants/src/onboarding/services/auth_services.dart';
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

  final address1Controller = TextEditingController();
  final address2Controller = TextEditingController();
  final nearbylandnarkController = TextEditingController();
  final postalcodeController = TextEditingController();
  final latitudeController = TextEditingController();
  final longitudeController = TextEditingController();

  final gstpresentController = TextEditingController();
  final gstnumController = TextEditingController();
  final fssaistatusController = TextEditingController();
  String expiry = '';
  String kycimg = '';
  String gstinimg = '';
  String fssaiimg = '';
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
        uniqueId,
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

  Future<void> onboardingapi2() async {
    String adress = address1Controller.text +
        " " +
        address2Controller.text +
        " " +
        nearbylandnarkController.text;

    try {
      id = await services.onboardingapi2(
        uniqueId,
        adress,
        postalcodeController.text,
        latitudeController.text,
        longitudeController.text,
      );
      sfHelper.setUserId(id!);
      sfHelper.getUserId();
      Get.toNamed(OnboardingPage2.id);
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  Future<void> onboardingapi3() async {
    try {
      id = await services.onboardingapi3(
        uniqueId,
        gstpresentController.text,
        gstnumController.text,
        fssaistatusController.text,
        expiry,
        kycimg,
        gstinimg,
        fssaiimg,
      );
      sfHelper.setUserId(id!);
      sfHelper.getUserId();
      Get.toNamed(OnboardingPage3.id);
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }
  // Future<void> register() async {
  //   try {
  //     await services.register(
  //         email: usernameController.text,
  //         password: passwordController.text,
  //         password2: password2Controller.text,
  //         fName: fNamController.text,
  //         lName: lNameController.text,
  //         gender: gender.value,
  //         dob: dob.value,
  //         mobNum: mobController.text);
  //     Get.toNamed(LoginPage.id);
  //   } catch (e) {
  //     Get.snackbar("Error", e.toString());
  //   }
  // }

  // Future<void> uploadImage(File file) async {
  //   try {
  //     bool success = await services.uploadImage(file);
  //     if (success) {
  //       Get.toNamed(MapPage.id);
  //     }
  //   } catch (e) {
  //     Get.snackbar("Error", e.toString());
  //   }
  // }

  // RxString gender = 'Male'.obs;
  // final items = ['Male', 'Female'];
}
