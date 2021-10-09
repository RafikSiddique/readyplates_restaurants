import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readyplates_restaurants/src/onboarding/onboarding_services.dart';
import 'package:readyplates_restaurants/src/onboarding/screens/index.dart';
import 'package:readyplates_restaurants/utils/shared_preference_helper.dart';
import 'package:readyplates_restaurants/utils/utils.dart';

class OnboardingController extends GetxController {
  RxInt pageIndex = 0.obs;
  String uniqueId = "";

  OnboardingServices services = OnboardingServices();

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
  DateTime? expiry;
  File kycimg = File('');
  File gstinimg = File('');
  File fssaiimg = File('');

  RxInt startHour = 10.obs;
  RxInt startMinute = 00.obs;

  RxInt endHour = 10.obs;
  RxInt endMinute = 00.obs;

  List<String> amPm = ["AM", "PM"];
  RxString startAmPm = "AM".obs;
  RxString endAmPm = "PM".obs;

  @override
  void onInit() {
    SharedPreferenceHelper().getUserId().then((value) => uniqueId = value);
    super.onInit();
  }

  Future<void> onboardingapi1() async {
    String ownName = firstNameController.text + " " + lastNameController.text;
    try {
      await services.onboardingapi1(
        uniqueId,
        resNameController.text,
        ownName,
        ownMobileController.text,
        rescity,
        pocController.text,
        pocNumberController.text,
      );
      Get.toNamed(OnboardingPage2.id);
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
      await services.onboardingapi2(
        uniqueId,
        adress,
        postalcodeController.text,
        latitudeController.text,
        longitudeController.text,
      );
      Get.toNamed(OnboardingPage3.id);
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  Future<void> onboardingapi3() async {
    try {
      await services.onboardingapi3(
        uniqueId,
        gstpresentController.text,
        gstnumController.text,
        fssaistatusController.text,
        "${expiry!.year}-${expiry!.month}-${expiry!.day}",
        kycimg,
        gstinimg,
        fssaiimg,
      );
      Get.toNamed(Routes.onboarding4Route);
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  List<List<String>> allImages() => [
        demoFasciaImages, //0
        demoAmbienceImages,
        demoFoodImages,
        demoPrecautionImage
      ];

  List<List<String>> allNames() =>
      [demoFasciaNames, demoAmbienceName, demoFoodName, demoPrecautionName];

  List<List<String>> allSelectionImage() => [
        fasciaImages,
        ambienceImages,
        foodImages,
        covidProtocol,
      ];
  List<String> demoFasciaImages = [
    "assets/images/frontfascia.png", //0//0 ===
    "assets/images/StreetView.png", //0 //1 ===
    "assets/images/FrontFasciaDaytime.png", //0 //2
    "assets/images/RestaurantEntrance.png" //0 //3
  ];

  List<String> demoFasciaNames = [
    "Front Fascia (Night)",
    "Street View",
    "Front Fascia (Daytime)",
    "Restaurant Entrance",
  ];

  List<String> demoAmbienceImages = [
    "assets/images/ambience1.png", //1 //0 ===
    "assets/images/ambience2.png", //1 //1
    "assets/images/Restaurant ambience.png",
    "assets/images/ambience4.png",
  ];

  List<String> demoAmbienceName =
      List.generate(4, (index) => "Ambience ${index + 1}");

  List<String> demoFoodImages = List.generate(
    4,
    (index) => "assets/images/Food${index + 1}.png",
  );

  List<String> demoFoodName = List.generate(4, (index) => "Food ${index + 1}");

  List<String> demoPrecautionImage =
      List.generate(4, (index) => "assets/images/covid${index + 1}.png");

  List<String> selectedImages = [
    "assets/images/frontfascia.png", //0
    "assets/images/ambience1.png", //1
    "assets/images/Food1.png",
    "assets/images/covid1.png",
  ];

  List<String> demoPrecautionName =
      List.generate(4, (index) => "Covid-19 Precautions ${index + 1}");

  List<String> fasciaImages = List.generate(4, (index) => "");
  List<String> ambienceImages = List.generate(4, (index) => "");
  List<String> foodImages = List.generate(4, (index) => "");
  List<String> covidProtocol = List.generate(4, (index) => "");

  List<String> titleText = [
    'Restaurant Fascia Images', //0
    "Restaurant Ambience Images", //1
    'Food Dishes Images', //2
    'Restaurant COVID-19 protocol Images' //3
  ];

  RxBool imageLoading = false.obs;
  Future<void> uploadImage(List<String> files) async {
    try {
      imageLoading.value = true;
      await services.uploadImages(files, pageIndex.value);
      imageLoading.value = false;
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }
}
