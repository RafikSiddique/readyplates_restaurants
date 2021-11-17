import 'dart:io';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:readyplates_restaurants/src/home/screens/home_screen.dart';
import 'package:readyplates_restaurants/src/login/auth_controller.dart';
import 'package:readyplates_restaurants/src/onboarding/onboarding_services.dart';
import 'package:readyplates_restaurants/src/onboarding/screens/index.dart';
import 'package:readyplates_restaurants/src/onboarding/screens/onboarding_page6.dart';
import 'package:readyplates_restaurants/utils/cities.dart';
import 'package:readyplates_restaurants/utils/city.dart';
import 'package:readyplates_restaurants/utils/shared_preference_helper.dart';

enum OnBoardingMethod { api1, api2, api3, api4, api5, api6, api7, api8, api9 }

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
    //
    accNumber = TextEditingController();
    accName = TextEditingController();
    addline1 = TextEditingController();
    addline2 = TextEditingController();
    addline3 = TextEditingController();
    state = TextEditingController();
    city = TextEditingController();
    pincode = TextEditingController();
    phoneveify = TextEditingController();
    pubbusinessName = TextEditingController();
    supportEmail = TextEditingController();
    supportNumber = TextEditingController();
    statementDescriptor = TextEditingController();
    shortenedDescriptor = TextEditingController();
    businessWeb = TextEditingController();
    supportWeb = TextEditingController();
    privacy = TextEditingController();
    termServices = TextEditingController();
    fsolNumber = TextEditingController();
    nameOfBusiness = TextEditingController();
    eiNumber = TextEditingController();
    businessaccNumber = TextEditingController();
    businessaccName = TextEditingController();
    businessaddline1 = TextEditingController();
    businessaddline2 = TextEditingController();
    businessaddline3 = TextEditingController();
    businessstate = TextEditingController();
    businesscity = TextEditingController();
    businesspincode = TextEditingController();
  }

  late TextEditingController resName;

  late TextEditingController firstName;
  late TextEditingController lastName;
  late TextEditingController ownemail;
  late TextEditingController ownMobile;
  late TextEditingController poc;
  late TextEditingController pocNumber;
  late TextEditingController accNumber;
  late TextEditingController accName;
  late TextEditingController addline1;
  late TextEditingController addline2;
  late TextEditingController addline3;
  late TextEditingController state;
  late TextEditingController city;
  late TextEditingController pincode;
  late TextEditingController phoneveify;
  late TextEditingController pubbusinessName;
  late TextEditingController supportEmail;
  late TextEditingController supportNumber;

  late TextEditingController statementDescriptor;
  late TextEditingController shortenedDescriptor;
  late TextEditingController businessWeb;
  late TextEditingController supportWeb;
  late TextEditingController privacy;
  late TextEditingController termServices;
  late TextEditingController fsolNumber;
  late TextEditingController nameOfBusiness;
  late TextEditingController eiNumber;

  late TextEditingController businessaccNumber;
  late TextEditingController businessaccName;
  late TextEditingController businessaddline1;
  late TextEditingController businessaddline2;
  late TextEditingController businessaddline3;
  late TextEditingController businessstate;
  late TextEditingController businesscity;
  late TextEditingController businesspincode;

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
    accNumber.dispose();
    accName.dispose();
    addline1.dispose();
    addline2.dispose();
    addline3.dispose();
    state.dispose();
    city.dispose();
    pincode.dispose();
    phoneveify.dispose();
    pubbusinessName.dispose();
    supportEmail.dispose();
    supportNumber.dispose();
    statementDescriptor.dispose();
    shortenedDescriptor.dispose();
    businessWeb.dispose();
    supportWeb.dispose();
    privacy.dispose();
    termServices.dispose();
    fsolNumber.dispose();
    nameOfBusiness.dispose();
    eiNumber.dispose();
    businessaccNumber.dispose();
    businessaccName.dispose();
    businessaddline1.dispose();
    businessaddline2.dispose();
    businessaddline3.dispose();
    businessstate.dispose();
    businesscity.dispose();
    businesspincode.dispose();

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
  File confirmLetter = File('');
  File uploadLetter = File('');
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
    //
    accNumber.clear();
    accName.clear();
    addline1.clear();
    addline2.clear();
    addline3.clear();
    state.clear();
    city.clear();
    pincode.clear();
    phoneveify.clear();
    pubbusinessName.clear();
    supportEmail.clear();
    supportNumber.clear();
    statementDescriptor.clear();
    shortenedDescriptor.clear();
    businessWeb.clear();
    supportWeb.clear();
    privacy.clear();
    termServices.clear();
    fsolNumber.clear();
    nameOfBusiness.clear();
    eiNumber.clear();
    businessaccNumber.clear();
    businessaccName.clear();
    businessaddline1.clear();
    businessaddline2.clear();
    businessaddline3.clear();
    businessstate.clear();
    businesscity.clear();
    businesspincode.clear();
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
  RxString supportCountry = "".obs;
  List<String> typeOfEsts = [
    "Dine In",
    "Dine In & Delivery Both",
  ];

  RxDouble value = 1.0.obs;

  @override
  void onInit() {
    SharedPreferenceHelper()
        .getUserId()
        .then((value) => uniqueId = value ?? "-1");
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
    //
    accNumber = TextEditingController();
    accName = TextEditingController();
    addline1 = TextEditingController();
    addline2 = TextEditingController();
    addline3 = TextEditingController();
    state = TextEditingController();
    city = TextEditingController();
    pincode = TextEditingController();
    phoneveify = TextEditingController();
    pubbusinessName = TextEditingController();
    supportEmail = TextEditingController();
    supportNumber = TextEditingController();
    statementDescriptor = TextEditingController();
    shortenedDescriptor = TextEditingController();
    businessWeb = TextEditingController();
    supportWeb = TextEditingController();
    privacy = TextEditingController();
    termServices = TextEditingController();
    fsolNumber = TextEditingController();
    nameOfBusiness = TextEditingController();
    eiNumber = TextEditingController();
    businessaccNumber = TextEditingController();
    businessaccName = TextEditingController();
    businessaddline1 = TextEditingController();
    businessaddline2 = TextEditingController();
    businessaddline3 = TextEditingController();
    businessstate = TextEditingController();
    businesscity = TextEditingController();
    businesspincode = TextEditingController();

    super.onInit();
  }

  final PageController pageController = PageController();

  Future<void> onboardingApi(OnBoardingMethod method,
      {bool isEditing = false}) async {
    loading.value = true;
    switch (method) {
      case OnBoardingMethod.api1:
        await _onboardingapi1();
        break;
      case OnBoardingMethod.api2:
        await _onboardingapi2(isEditing);
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
        await _onboardingapi6(isEditing);
        break;
      case OnBoardingMethod.api7:
        await _onboardingapi7();
        break;
      case OnBoardingMethod.api8:
        await _onboardingapi8();
        break;
      case OnBoardingMethod.api9:
        await _uploadImage(isEditing);
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

      await sfHelper.setRestaurantId(resId);
      print('ID:1232323$resId');
      await Geolocator.requestPermission();
      Position position = await Geolocator.getCurrentPosition();

      Get.toNamed(OnboardingPage2.id,
          arguments: LatLng(position.latitude, position.longitude));
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  RxList<States> rxStates =
      List<States>.from(details.map((e) => States.fromMap(e))).obs;

  void searchState(String query) {
    rxStates.value = List<States>.from(details.map((e) => States.fromMap(e)));
    if (query != "") {
      rxStates.value = rxStates
          .where((p0) => p0.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    rxStates.sort((a, b) => a.name.compareTo(b.name));
  }

  void search(int stateId, String query) {
    try {
      List<States> states =
          List<States>.from(details.map((e) => States.fromMap(e)));
      //  rxStates.value = states;
      if (query.trim() == "") {
        int i = rxStates.indexWhere((element) => element.id == stateId);
        List<City> city =
            states.firstWhere((element) => element.id == stateId).city;
        city.sort((a, b) => a.name.compareTo(b.name));
        rxStates[i].city.value = city;
      } else {
        int i = rxStates.indexWhere((element) => element.id == stateId);
        print(i);
        print("RX Things");
        print(rxStates[i]);
        print(rxStates[i].city);
        States state = states.firstWhere((element) => element.id == stateId);
        print("Original Things");
        print(state);
        print(state.city);
        List<City> city = state.city
            .where((p0) => p0.name.toLowerCase().contains(query.toLowerCase()))
            .toList();
        city.sort((a, b) => a.name.compareTo(b.name));
        print(city);
        rxStates[i].city.value = city;
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> _onboardingapi2(bool isEditing) async {
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
      if (!isEditing)
        Get.toNamed(OnboardingPage3.id);
      else
        Navigator.popUntil(
            Get.context!, (route) => route.settings.name == HomePage.id);
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  Future<void> _onboardingapi3() async {
    String business_add = addline1.text +
        " " +
        addline2.text +
        " " +
        addline3.text +
        " " +
        state.text +
        " " +
        city.text +
        " " +
        pincode.text;
    try {
      await services.onboardingapi3(
        resId,
        accNumber.text,
        accName.text,
        business_add,
        phoneveify.text,
        timezone.value,
      );
      Get.toNamed(OnboardingPage4.id);
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  Future<void> _onboardingapi4() async {
    String business_add = addline1.text +
        " " +
        addline2.text +
        " " +
        addline3.text +
        " " +
        state.text +
        " " +
        city.text +
        " " +
        pincode.text;
    try {
      await services.onboardingapi4(
        uniqueId,
        pubbusinessName.text,
        supportEmail.text,
        supportNumber.text,
        business_add,
      );
      //sfHelper.getRestaurantId();
      Get.toNamed(OnboardingPage5.id);
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  Future<void> _onboardingapi5() async {
    try {
      await services.onboardingapi5(
          uniqueId,
          statementDescriptor.text,
          shortenedDescriptor.text,
          businessWeb.text,
          supportWeb.text,
          privacy.text,
          termServices.text,
          fsolNumber.text);
      Get.toNamed(OnboardingPage6.id);
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  Future<void> _onboardingapi6(bool isEditing) async {
    try {
      await services.onboardingapi6(
        uniqueId,
        businesstype.value,
        nameOfBusiness.text,
        eiNumber.text,
        confirmLetter,
        uploadLetter,
      );
      if (!isEditing)
        Get.toNamed(OnboardingPage7.id);
      else
        Navigator.popUntil(
            Get.context!, (route) => route.settings.name == HomePage.id);
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  Future<void> _onboardingapi7() async {
    try {
      await services.onboardingapi7(
        uniqueId,
        typeOfEstablishment.value,
        chooseCategory.toList().toString(),
        startTime,
        endTime,
        chooseDays.toList().toString(),
      );
      Get.toNamed(OnboardingPage8.id);
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  Future<void> _onboardingapi8() async {
    try {
      if (resId == "") {
        resId = await sfHelper.getRestaurantId();
      }
      await services.onboardingapi8(
        resId,
        resDescript.text,
        noOfTables.toString(),
        noOfSeats.toString(),
        servingTime.toString(),
        "${recurrenceTime.year}-${recurrenceTime.month}-${recurrenceTime.day}",
        selectedRecurrence.value,
        startTime,
        endTime,
        eventDesc.text,
      );

      Get.toNamed(OnboardingPage9.resId);
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

  Future<void> _uploadImage(bool isEditing) async {
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
          if (isEditing) {
            Get.toNamed(OnboardingPage9.resId);
          } else {
            Get.find<SharedPreferenceHelper>().setLoggedIn(true);
            Get.find<AuthController>().isLoggedIn.value = true;
            Get.offAllNamed(HomePage.id);
          }
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
