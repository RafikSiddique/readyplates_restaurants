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
  final SharedPreferenceHelper sfHelper = Get.find();

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
  DateTime expiry = DateTime.now();
  File kycimg = File('');
  File gstinimg = File('');
  File fssaiimg = File('');

  final resDescript = TextEditingController();

  RxInt startHour = 10.obs;
  RxInt startMinute = 00.obs;

  RxInt endHour = 10.obs;
  RxInt endMinute = 00.obs;

  List<String> amPm = ["AM", "PM"];
  RxString startAmPm = "AM".obs;
  RxString endAmPm = "PM".obs;

  RxInt eventstartHour = 10.obs;
  RxInt eventstartMinute = 00.obs;
  RxInt eventendHour = 10.obs;
  RxInt eventendMinute = 00.obs;
  RxString eventstartAmPm = "AM".obs;
  RxString eventendAmPm = "PM".obs;
  final eventDesc = TextEditingController();
  DateTime recurrenceTime = DateTime.now();

  RxString selectedRecurrence = "Monthly".obs;

  RxInt costFor2 = 0.obs;
  RxInt servingTime = 0.obs;

  RxInt noOfTables = 0.obs;
  RxInt noOfSeats = 0.obs;

  final ac_numberController = TextEditingController();
  final reac_numberController = TextEditingController();
  final ifsc_codeController = TextEditingController();
  final pan_numController = TextEditingController();
  final pan_nameController = TextEditingController();
  File pan_image = File('');

  List<String> selectCategory = [
    'Burgers',
    'Pan-Asian',
    'Continental',
    'Malay',
    'Seafood',
    'South Indian',
    'Pizza',
    'Arab',
    'Fast Food',
    'Korean',
    'Barbeque',
    'North Indian',
    'Chinese',
    'Italian',
    'Japanese',
    'Indonesian',
    'Vegan',
    'Pan-Indian',
  ];

  RxList<String> chooseCategory = <String>[].obs;
  List<String> selectDays = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday',
  ];
  RxList<String> chooseDays = <String>[].obs;
  bool isChecked = false;
  bool isDays = false;

  String typeOfAcc = "";
  List<String> accType = ["Saving", "Current"];
  RxString typeOfEstablishment = "".obs;

  List<String> typeOfEsts = ["Dineout only", "Take Away"];

  RxDouble value = 1.0.obs;

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
      sfHelper.setRestaurantName(resNameController.text);
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
        "${expiry.year}-${expiry.month}-${expiry.day}",
        kycimg,
        gstinimg,
        fssaiimg,
      );
      Get.toNamed(Routes.onboarding4Route);
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  Future<void> onboardingapi4() async {
    try {
      await services.onboardingapi4(
        uniqueId,
        typeOfEstablishment.value,
        chooseCategory.toString(),
        "${startHour.value}:${startMinute.value}${startAmPm}",
        "${endHour.value}:${endMinute.value}${endAmPm}",
        chooseDays.toList().toString(),
      );
      Get.toNamed(Routes.onboarding5Route);
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  Future<void> onboardingapi5() async {
    try {
      await services.onboardingapi5(
        uniqueId,
        ac_numberController.text,
        typeOfAcc,
        ifsc_codeController.text,
        pan_numController.text,
        pan_nameController.text,
        pan_image,
      );
      Get.toNamed(Routes.onboarding6Route);
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  Future<void> onboardingApi6() async {
    try {
      await services.onboardingapi6(
          uniqueId,
          resDescript.text,
          noOfTables.toString(),
          noOfSeats.toString(),
          costFor2.toString(),
          servingTime.toString(),
          "${recurrenceTime.year}-${recurrenceTime.month}-${recurrenceTime.day}",
          selectedRecurrence.value,
          "${eventstartHour.value}:${eventstartMinute.value}${eventstartAmPm}",
          "${eventendHour.value}:${eventendMinute.value}${eventendAmPm}",
          eventDesc.text);
      Get.toNamed(Routes.onboarding7Route);
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
      await services.uploadImages(files, pageIndex.value, uniqueId);
      imageLoading.value = false;
      if (pageIndex.value == 3) {
        Get.find<SharedPreferenceHelper>().setLoggedIn(true);
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }
}
