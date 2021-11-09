import 'dart:io';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:readyplates_restaurants/src/home/screens/home_screen.dart';
import 'package:readyplates_restaurants/src/login/auth_controller.dart';
import 'package:readyplates_restaurants/src/onboarding/onboarding_services.dart';
import 'package:readyplates_restaurants/src/onboarding/screens/index.dart';
import 'package:readyplates_restaurants/src/onboarding/screens/onboarding_page5.dart';
import 'package:readyplates_restaurants/src/onboarding/screens/onboarding_page6.dart';
import 'package:readyplates_restaurants/utils/shared_preference_helper.dart';

enum OnBoardingMethod { api1, api2, api3, api4, api5, api6, api7 }

class OnboardingController extends GetxController {
  RxInt pageIndex = 0.obs;
  String resId = "";
  String uniqueId = "";

  OnboardingServices services = OnboardingServices();
  final SharedPreferenceHelper sfHelper = Get.find();

  ///OnBoarding 1
  void initControllers1() {
    resName = TextEditingController();
    firstName = TextEditingController();
    lastName = TextEditingController();
    ownemail = TextEditingController();
    ownMobile = TextEditingController();
    poc = TextEditingController();
    pocNumber = TextEditingController();
  }

  late TextEditingController resName;
  late TextEditingController firstName;
  late TextEditingController lastName;
  late TextEditingController ownemail;
  late TextEditingController ownMobile;
  late TextEditingController poc;
  late TextEditingController pocNumber;
  String rescity = '';

  ///OnBoarding 2
  void dispose1() {
    resName.dispose();
    firstName.dispose();
    lastName.dispose();
    ownemail.dispose();
    ownMobile.dispose();
    poc.dispose();
    pocNumber.dispose();

    address1 = TextEditingController();
    address2 = TextEditingController();
    nearbylandnark = TextEditingController();
    postalcode = TextEditingController();
    latitude = TextEditingController();
    longitude = TextEditingController();
    gstpresent = TextEditingController();
    gstnum = TextEditingController();
    fssaistatus = TextEditingController();
  }

  late TextEditingController address1;
  late TextEditingController address2;
  late TextEditingController nearbylandnark;
  late TextEditingController postalcode;
  late TextEditingController latitude;
  late TextEditingController longitude;
  late TextEditingController gstpresent;
  late TextEditingController gstnum;
  late TextEditingController fssaistatus;

  void dispose2() {}

  DateTime expiry = DateTime(1900);
  String startTime = '';
  String endTime = '';
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
  late TextEditingController ac_number;
  late TextEditingController reac_number;
  late TextEditingController ifsc_code;
  late TextEditingController pan_num;
  late TextEditingController pan_name;
  File pan_image = File('');
  RxString businesstype = "".obs;
  RxString timezone = "".obs;
  void clear() {
    resName.clear();
    firstName.clear();
    lastName.clear();
    ownMobile.clear();
    poc.clear();
    pocNumber.clear();
    address1.clear();
    address2.clear();
    nearbylandnark.clear();
    postalcode.clear();
    latitude.clear();
    longitude.clear();

    gstpresent.clear();
    gstnum.clear();
    fssaistatus.clear();
    ac_number.clear();
    reac_number.clear();
    ifsc_code.clear();
    pan_num.clear();
    pan_name.clear();
    eventDesc.clear();
  }

  @override
  void dispose() {
    super.dispose();
  }

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

  List<String> typeOfEsts = ["US", "United Kingdom", "Swizerland", "Finland"];

  RxDouble value = 1.0.obs;

  @override
  void onInit() {
    SharedPreferenceHelper().getUserId().then((value) => uniqueId = value);
    SharedPreferenceHelper()
        .getRestaurantId()
        .then((value) => resId = value.toString());
    resName = TextEditingController();
    firstName = TextEditingController();
    lastName = TextEditingController();
    ownemail = TextEditingController();
    ownMobile = TextEditingController();
    poc = TextEditingController();
    pocNumber = TextEditingController();
    address1 = TextEditingController();
    address2 = TextEditingController();
    nearbylandnark = TextEditingController();
    postalcode = TextEditingController();
    latitude = TextEditingController();
    longitude = TextEditingController();
    gstpresent = TextEditingController();
    gstnum = TextEditingController();
    fssaistatus = TextEditingController();
    ac_number = TextEditingController();
    reac_number = TextEditingController();
    ifsc_code = TextEditingController();
    pan_num = TextEditingController();
    pan_name = TextEditingController();
    super.onInit();
  }

  final PageController pageController = PageController();

  Future<void> onboardingApi(OnBoardingMethod method) async {
    loading.value = true;
    switch (method) {
      case OnBoardingMethod.api1:
        await _onboardingapi1();
        break;
      case OnBoardingMethod.api2:
        await _onboardingapi2();
        break;
      case OnBoardingMethod.api3:
        await _onboardingapi3();
        break;
      case OnBoardingMethod.api4:
        await _onboardingapi4();
        break;
      case OnBoardingMethod.api5:
        await _onboardingapi5();
        break;
      case OnBoardingMethod.api6:
        await _onboardingApi6();
        break;
      case OnBoardingMethod.api7:
        await _uploadImage();
        break;
    }
    loading.value = false;
  }

  Future<void> _onboardingapi1() async {
    String ownName = firstName.text + " " + lastName.text;
    try {
      resId = await services.onboardingapi1(
        uniqueId,
        resName.text,
        ownName,
        ownMobile.text,
        rescity,
        poc.text,
        pocNumber.text,
      );
      this.resId = resId;
      //sfHelper.setRestaurantName(resNameController.text);
      sfHelper.setRestaurantId(resId);
      sfHelper.getRestaurantId();
      print('ID:1232323$resId');
      await Geolocator.requestPermission();

      Get.toNamed(OnboardingPage2.id);
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  Future<void> _onboardingapi2() async {
    String adress =
        address1.text + " " + address2.text + " " + nearbylandnark.text;

    try {
      await services.onboardingapi2(
        uniqueId,
        adress,
        postalcode.text,
        latitude.text,
        longitude.text,
      );
      Get.toNamed(OnboardingPage3.id);
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  Future<void> _onboardingapi3() async {
    try {
      await services.onboardingapi3(
        uniqueId,
        gstpresent.text,
        gstnum.text,
        fssaistatus.text,
        "${expiry.year}-${expiry.month}-${expiry.day}",
        kycimg,
        gstinimg,
        fssaiimg,
      );
      Get.toNamed(OnboardingPage4.id);
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  Future<void> _onboardingapi4() async {
    try {
      await services.onboardingapi4(
        uniqueId,
        typeOfEstablishment.value,
        chooseCategory.toString(),
        startTime,
        endTime,
        // "${startHour.value}:${startMinute.value}${startAmPm}",
        // "${endHour.value}:${endMinute.value}${endAmPm}",
        chooseDays.toList().toString(),
      );
      sfHelper.getRestaurantId();
      Get.toNamed(OnboardingPage5.id);
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  Future<void> _onboardingapi5() async {
    try {
      if (resId == "") {
        resId = await sfHelper.getRestaurantId();
      }
      await services.onboardingapi5(
        resId,
        ac_number.text,
        typeOfAcc,
        ifsc_code.text,
        pan_num.text,
        pan_name.text,
        pan_image,
      );
      Get.toNamed(OnboardingPage6.id);
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  Future<void> _onboardingApi6() async {
    try {
      if (resId == "") {
        resId = await sfHelper.getRestaurantId();
      }
      await services.onboardingapi6(
        resId,
        resDescript.text,
        noOfTables.toString(),
        noOfSeats.toString(),
        costFor2.toString(),
        servingTime.toString(),
        "${recurrenceTime.year}-${recurrenceTime.month}-${recurrenceTime.day}",
        selectedRecurrence.value,
        startTime,
        endTime,
        // "${eventstartHour.value}:${eventstartMinute.value}${eventstartAmPm}",
        // "${eventendHour.value}:${eventendMinute.value}${eventendAmPm}",
        eventDesc.text,
      );
      Get.toNamed(OnboardingPage7.id);
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

  List<dynamic> selectedImages = [
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

  RxBool loading = false.obs;

  bool isImagesUploaded(List<String> list) {
    return list[0] != "" && list[1] != "" && list[2] != "" && list[3] != "";
  }

  Future<void> _uploadImage() async {
    try {
      if (resId == "") {
        resId = await sfHelper.getRestaurantId();
      }
      List<String> fields = [];
      List<String> files = [];

      switch (pageIndex.value) {
        case 0:
          fields = [
            "front_fascia_day",
            "front_fascia_night",
            "street_view",
            "entrance"
          ];
          files = fasciaImages;
          break;
        case 1:
          fields = ["ambience1", "ambience2", "ambience3", "ambience4"];
          files = ambienceImages;
          break;
        case 2:
          fields = ["food1", "food2", "food3", "food4"];
          files = foodImages;
          break;
        default:
          fields = ["cv19prec1", "cv19prec2", "cv19prec3", "cv19prec4"];
          files = covidProtocol;
          break;
      }
      if (isImagesUploaded(files)) {
        await services.uploadImages(files, pageIndex.value, fields, resId);

        if (pageIndex.value == 3) {
          Get.find<SharedPreferenceHelper>().setLoggedIn(true);
          Get.find<AuthController>().isLoggedIn.value = true;
          Get.offAllNamed(HomePage.id);
        } else {
          pageController.animateToPage(pageIndex.value + 1,
              duration: Duration(milliseconds: 500), curve: Curves.ease);
        }
      } else {
        Get.snackbar("Error", "Uplaod All the Images");
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }
}
