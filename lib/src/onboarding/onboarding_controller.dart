import 'dart:io';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:readyplates_restaurants/models/restaurant_model.dart';
import 'package:readyplates_restaurants/src/home/home_controller.dart';
import 'package:readyplates_restaurants/src/home/screens/home_screen.dart';
import 'package:readyplates_restaurants/src/login/auth_controller.dart';
import 'package:readyplates_restaurants/src/onboarding/onboarding_services.dart';
import 'package:readyplates_restaurants/src/onboarding/screens/index.dart';
import 'package:readyplates_restaurants/src/onboarding/screens/table_config_page.dart';
import 'package:readyplates_restaurants/src/orders/order_controller.dart';
import 'package:readyplates_restaurants/utils/cities.dart';
import 'package:readyplates_restaurants/utils/city.dart';
import 'package:readyplates_restaurants/utils/fcm_service.dart';
import 'package:readyplates_restaurants/utils/shared_preference_helper.dart';

enum OnBoardingMethod {
  api1,
  api2,
  api3,
  api4,
  api5,
  api6,
  api7,
  api8,
  api9,
  api13
}

class OnboardingController extends GetxController {
  RxInt pageIndex = 0.obs;
  String resId = "";
  String uniqueId = "";

  OnboardingServices services = OnboardingServices();
  final SharedPreferenceHelper sfHelper = Get.find();

  bool isEditing = false;

  Future<void> onboardingApi(
    OnBoardingMethod method,
  ) async {
    loading.value = true;
    switch (method) {
      case OnBoardingMethod.api1:
        if (!isEditing) {
          init2();
        }
        await _onboardingapi1();
        break;
      case OnBoardingMethod.api2:
        init3();
        await _onboardingapi2();
        break;
      case OnBoardingMethod.api3:
        init4();
        await _onboardingapi3();
        break;
      case OnBoardingMethod.api4:
        init5();
        await _onboardingapi4();

        break;
      case OnBoardingMethod.api5:
        init6();
        await _onboardingapi5();

        break;
      case OnBoardingMethod.api6:
        await _onboardingapi6();

        break;
      case OnBoardingMethod.api7:
        if (!isEditing) init8();
        await _onboardingapi7();
        break;
      case OnBoardingMethod.api8:
        await _onboardingapi8();
        break;
      case OnBoardingMethod.api9:
        await _uploadImage();
        break;
      case OnBoardingMethod.api13:
        await _tableconfig();
        break;
    }
    loading.value = false;
  }

  late TextEditingController resName;
  late TextEditingController firstName;
  late TextEditingController lastName;
  late TextEditingController ownemail;
  late TextEditingController ownMobile;
  late TextEditingController poc;
  late TextEditingController pocNumber;
  String rescity = '';

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

  void initEditControllers1n2(RestaurantModel restaurantModel) {
    resName = TextEditingController(text: restaurantModel.resName);
    firstName =
        TextEditingController(text: restaurantModel.own_name.split(' ').first);
    lastName =
        TextEditingController(text: restaurantModel.own_name.split(' ').last);
    ownemail = TextEditingController();
    ownMobile = TextEditingController(text: restaurantModel.own_mobile);
    poc = TextEditingController(text: restaurantModel.poc);
    pocNumber = TextEditingController(text: restaurantModel.poc_number);
    address1 =
        TextEditingController(text: restaurantModel.address.split(' ').first);
    address2 =
        TextEditingController(text: restaurantModel.address.split(' ')[1]);
    nearbylandnark =
        TextEditingController(text: restaurantModel.address.split(' ').last);
    postalcode = TextEditingController(text: restaurantModel.postal_code);
    latitude = TextEditingController(text: restaurantModel.latitude);
    longitude = TextEditingController(text: restaurantModel.longitude);
    rescity = restaurantModel.res_city;
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

      await sfHelper.setRestaurantId(resId);

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
      if (query.trim() == "") {
        int i = rxStates.indexWhere((element) => element.id == stateId);
        List<City> city =
            states.firstWhere((element) => element.id == stateId).city;
        city.sort((a, b) => a.name.compareTo(b.name));
        rxStates[i].city.value = city;
      } else {
        int i = rxStates.indexWhere((element) => element.id == stateId);

        States state = states.firstWhere((element) => element.id == stateId);

        List<City> city = state.city
            .where((p0) => p0.name.toLowerCase().contains(query.toLowerCase()))
            .toList();
        city.sort((a, b) => a.name.compareTo(b.name));

        rxStates[i].city.value = city;
      }
    } catch (e) {
      print(e);
    }
  }

  void dispose1() {
    resName.dispose();
    firstName.dispose();
    lastName.dispose();
    ownemail.dispose();
    ownMobile.dispose();
    poc.dispose();
    pocNumber.dispose();
    rescity = "";
  }

  ///OnBoarding 2
  late TextEditingController address1;
  late TextEditingController address2;
  late TextEditingController nearbylandnark;
  late TextEditingController postalcode;
  late TextEditingController latitude;
  late TextEditingController longitude;

  void init2() {
    address1 = TextEditingController();
    address2 = TextEditingController();
    nearbylandnark = TextEditingController();
    postalcode = TextEditingController();
    latitude = TextEditingController();
    longitude = TextEditingController();
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
      if (!isEditing)
        Get.toNamed(OnboardingPage3.id);
      else {
        final c = Get.find<HomeController>();
        Get.offAllNamed(HomePage.id);
        c.selectedIndex.value = 4;
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  void dispose2() {
    address1.dispose();
    address2.dispose();
    nearbylandnark.dispose();
    postalcode.dispose();
    latitude.dispose();
    longitude.dispose();
  }

  late TextEditingController accNumber;
  late TextEditingController accName;
  late TextEditingController addline1;
  late TextEditingController addline2;
  late TextEditingController addline3;
  late TextEditingController state;
  late TextEditingController city;
  late TextEditingController pincode;
  late TextEditingController phoneveify;
  RxString timezone = "".obs;

  void init3() {
    accNumber = TextEditingController();
    accName = TextEditingController();
    addline1 = TextEditingController();
    addline2 = TextEditingController();
    addline3 = TextEditingController();
    state = TextEditingController();
    city = TextEditingController();
    pincode = TextEditingController();
    phoneveify = TextEditingController();
    businessaddline1 = TextEditingController();
    businessaddline2 = TextEditingController();
    businessaddline3 = TextEditingController();
    businessstate = TextEditingController();
    businesscity = TextEditingController();
    businesspincode = TextEditingController();
    supportNumber = TextEditingController();
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

  void dispose3() {
    accNumber.dispose();
    accName.dispose();
    phoneveify.dispose();
    timezone.value = "";
  }

//Onboarding 4
  late TextEditingController pubbusinessName;
  late TextEditingController supportEmail;
  late TextEditingController supportNumber;
  late TextEditingController businessaddline1;
  late TextEditingController businessaddline2;
  late TextEditingController businessaddline3;
  late TextEditingController businessstate;
  late TextEditingController businesscity;
  late TextEditingController businesspincode;

  void init4() {
    pubbusinessName = TextEditingController();
    supportEmail = TextEditingController();
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

  void dispose4() {
    pubbusinessName.dispose();
    supportEmail.dispose();
    supportNumber.dispose();
    businessaddline1.dispose();
    businessaddline2.dispose();
    businessaddline3.dispose();
    businessstate.dispose();
    businesscity.dispose();
    businesspincode.dispose();
    addline1.dispose();
    addline2.dispose();
    addline3.dispose();
    state.dispose();
    city.dispose();
    pincode.dispose();
  }

  //Onboarding 5
  late TextEditingController statementDescriptor;
  late TextEditingController shortenedDescriptor;
  late TextEditingController businessWeb;
  late TextEditingController supportWeb;
  late TextEditingController privacy;
  late TextEditingController termServices;
  late TextEditingController fsolNumber;
  void init5() {
    statementDescriptor = TextEditingController();
    shortenedDescriptor = TextEditingController();
    businessWeb = TextEditingController();
    supportWeb = TextEditingController();
    privacy = TextEditingController();
    termServices = TextEditingController();
    fsolNumber = TextEditingController();
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

  void dispose5() {
    statementDescriptor.dispose();
    shortenedDescriptor.dispose();
    businessWeb.dispose();
    supportWeb.dispose();
    privacy.dispose();
    termServices.dispose();
    fsolNumber.dispose();
  }

//OnBoarding6
  late TextEditingController nameOfBusiness;
  late TextEditingController eiNumber;
  late File confirmLetter;
  late File uploadLetter;
  RxString businesstype = "".obs;
  void init6() {
    nameOfBusiness = TextEditingController();
    eiNumber = TextEditingController();
    confirmLetter = File('');
    uploadLetter = File('');
  }

  Future<void> _onboardingapi6() async {
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
      else {
        final c = Get.find<HomeController>();

        Get.offAllNamed(HomePage.id);
        c.selectedIndex.value = 4;
        // c.pageController.animateToPage(3,
        //     duration: Duration(microseconds: 200), curve: Curves.ease);
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  void dispose6() {
    nameOfBusiness.dispose();
    eiNumber.dispose();
    confirmLetter.delete();
    uploadLetter.delete();
  }

  //onboarding 7
  List<String> selectCategory = [
    'Hawaiian',
    'Burgers',
    'Pan-Asian',
    'Continental',
    'Malay',
    'Seafood',
    'Steak',
    'Pizza',
    'Arab',
    'Fast Food',
    'Pan-Indian',
    'Barbeque',
    'Japanese',
    'Chinese',
    'Italian',
    'Drinks',
    'Indonesian',
    'Vegan',
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

  void initEditing7n8(RestaurantModel restaurantModel) async {
    chooseDays.value = restaurantModel.open_days;
    typeOfEstablishment.value = restaurantModel.type_of_estd;
    chooseCategory.value = restaurantModel.types_of_cusine;
    startTime = restaurantModel.start_time;
    endTime = restaurantModel.end_time;
    List<String> startTimes = restaurantModel.start_time.split(':');
    List<String> endTimes = restaurantModel.end_time.split(':');
    int start = (int.parse(startTimes.first) +
        (startTimes.last.toLowerCase().contains('a')
            ? 0
            : startTimes.last.toLowerCase().contains('p')
                ? 12
                : 0));
    int end = int.parse(endTimes.first) +
        (endTimes.last.toLowerCase().contains('a')
            ? 0
            : endTimes.last.toLowerCase().contains('p')
                ? 12
                : 0);
    int startMin = int.parse(startTimes.last.split(' ').first);
    int endMin = int.parse(endTimes.last.split(' ').first);
    startTimeTod = TimeOfDay(hour: start, minute: startMin);
    endTimeTod = TimeOfDay(hour: end, minute: endMin);
    resDescript =
        TextEditingController(text: restaurantModel.bio.first.description);
    eventDesc =
        TextEditingController(text: restaurantModel.bio.first.event_desc);
    servingTime.value = int.parse(restaurantModel.bio.first.servingTime);
    List<String> dates = restaurantModel.bio[0].recurring_event_date.split('-');
    String month = dates[1].length == 1 ? "0${dates[1]}" : dates[1];
    String day = dates[2].length == 1 ? "0${dates[2]}" : dates[2];
    DateTime eventDate = DateTime.parse(dates[0] + month + day);
    recurrenceTime = eventDate;
    estartTime = restaurantModel.start_time;
    eendTime = restaurantModel.end_time;
    List<String> estartTimes = restaurantModel.start_time.split(':');
    List<String> eendTimes = restaurantModel.end_time.split(':');
    int estart = (int.parse(estartTimes.first) +
        (estartTimes.last.toLowerCase().contains('a')
            ? 0
            : estartTimes.last.toLowerCase().contains('p')
                ? 12
                : 0));
    int eend = int.parse(eendTimes.first) +
        (eendTimes.last.toLowerCase().contains('a')
            ? 0
            : eendTimes.last.toLowerCase().contains('p')
                ? 12
                : 0);
    int estartMin = int.parse(estartTimes.last.split(' ').first);
    int eendMin = int.parse(eendTimes.last.split(' ').first);
    estartTimeTod = TimeOfDay(hour: estart, minute: estartMin);
    eendTimeTod = TimeOfDay(hour: eend, minute: eendMin);
    //estartTimeTod =
    selectedRecurrence.value = restaurantModel.bio.first.recur_freq;
  }

  TimeOfDay? startTimeTod;
  TimeOfDay? endTimeTod;
  String startTime = '';
  String endTime = '';
  RxList<String> chooseDays = <String>[].obs;
  List<String> typeOfEsts = [
    "Dine In",
    "Dine In & Delivery Both",
  ];
  RxString typeOfEstablishment = "".obs;

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

  //Onboarding 8
  late TextEditingController resDescript;
  late TextEditingController maxOrder;
  late TextEditingController allowOrders;
  late TextEditingController eventName;
  late TextEditingController eventDesc;
  DateTime? recurrenceTime;
  RxString selectedRecurrence = "".obs;
  RxInt servingTime = 0.obs;
  TimeOfDay? estartTimeTod;
  TimeOfDay? eendTimeTod;
  String estartTime = '';
  String eendTime = '';

  void init8() {
    resDescript = TextEditingController();
    maxOrder = TextEditingController();
    allowOrders = TextEditingController();
    eventName = TextEditingController();
    eventDesc = TextEditingController();
  }

  Future<void> _onboardingapi8() async {
    try {
      if (resId == "") {
        resId = await sfHelper.getRestaurantId();
      }
      if (recurrenceTime == null) {
        recurrenceTime = DateTime.now();
      }
      if (selectedRecurrence.value == "") {
        selectedRecurrence.value = "Monthly";
      }
      await services.onboardingapi8(
        resId,
        resDescript.text,
        servingTime.toString(),
        "${recurrenceTime!.year}-${recurrenceTime!.month}-${recurrenceTime!.day}",
        'Monthly',
        estartTime,
        eendTime,
        eventDesc.text,
      );

      Get.toNamed(OnboardingPage9.resId);
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  void dispose8() {
    resDescript.clear();
    maxOrder.clear();
    allowOrders.clear();
    eventName.clear();
    eventDesc.clear();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void onInit() {
    SharedPreferenceHelper()
        .getUserId()
        .then((value) => uniqueId = value ?? "-1");
    SharedPreferenceHelper()
        .getRestaurantId()
        .then((value) => resId = value.toString());
    initControllers1();
    super.onInit();
  }

//Onboarding9
  PageController pageController = PageController();
  List<List<String>> allImages() => [
        demoFasciaImages,
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
    "assets/images/frontfascia.png",
    "assets/images/StreetView.png",
    "assets/images/FrontFasciaDaytime.png",
    "assets/images/RestaurantEntrance.png"
  ];

  List<String> demoFasciaNames = [
    "Front Fascia (Night)",
    "Street View",
    "Front Fascia (Daytime)",
    "Restaurant Entrance",
  ];

  List<String> demoAmbienceImages = [
    "assets/images/ambience1.png",
    "assets/images/ambience2.png",
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
          if (isEditing) {
            final c = Get.find<HomeController>();
            Get.offAllNamed(HomePage.id);
            c.selectedIndex.value = 4;
          } else {
            Get.toNamed(TableConfig.id);
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

//
  RxList<int> tables = <int>[].obs;
  RxList<bool> edit = <bool>[].obs;
  RxList<int> capacities = <int>[].obs;
  List<bool> available = [];

  Future<void> _tableconfig() async {
    String getValues(bool value) {
      switch (value) {
        case true:
          return "True";
        case false:
          return "False";
        default:
          return "True";
      }
    }

    try {
      if (resId == "") {
        resId = await sfHelper.getRestaurantId();
      }

      if (!isEditing) {
        await services.tableConfig(
          resId,
          capacities,
        );
        Get.find<SharedPreferenceHelper>().setLoggedIn(true);
        Get.find<AuthController>().isLoggedIn.value = true;
        Get.put(HomeController(selectedIndex: 0.obs));
        Get.put(OrderController());
        FirebaseMessagingService().getToken();
        Get.offAllNamed(HomePage.id);
      } else {
        if (available.isEmpty) {
          available = List.generate(capacities.length, (index) => true);
        }

        while (available.length < capacities.length) {
          available.add(true);
        }
        await services.tableConfigEdit(
            resId, capacities, available.map((e) => getValues(e)).toList());
        final c = Get.find<HomeController>();
        Get.offAllNamed(HomePage.id);
        c.selectedIndex.value = 4;
      }

      // dispose();
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }
}
