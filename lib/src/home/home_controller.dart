import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:path_provider/path_provider.dart';
import 'package:readyplates_restaurants/models/feedback_model.dart';
import 'package:readyplates_restaurants/models/fooditem_model.dart';
import 'package:readyplates_restaurants/models/restaurant_model.dart';
import 'package:readyplates_restaurants/models/table_model.dart';
import 'package:readyplates_restaurants/src/home/home_services.dart';
import 'package:readyplates_restaurants/src/orders/order_controller.dart';
import 'package:readyplates_restaurants/src/login/auth_controller.dart';
import 'package:readyplates_restaurants/src/staticscreens/opening_screen.dart';
import 'package:readyplates_restaurants/utils/api_services.dart';
import 'package:readyplates_restaurants/utils/exception.dart';
import 'package:readyplates_restaurants/utils/my_color.dart';
import 'package:readyplates_restaurants/utils/shared_preference_helper.dart';
import 'package:readyplates_restaurants/widgets/snackbar.dart';

class HomeController extends GetxController {
  HomeController({required this.selectedIndex});

  Rx<Color> appBarColor = Colors.transparent.obs;
  RxString searchBy = "Table Capacity".obs;
  RxInt selectedIndex;
  bool isEditing = false;
  RxBool switchValue = true.obs;
  // late PageController pageController =
  //     PageController(initialPage: selectedIndex.value);
  FoodItemModel? foodItemModel;
  RestaurantModel? restaurantModel;
  final SharedPreferenceHelper sfHelper = Get.find();
  final HomeServices homeServices = HomeServices();
  final ApiServices s = ApiServices();
  DateTime? closeOrderTime;

  // List<String> bottomBarIcons = List.generate(1,
  //     (index) => "assets/images/bottombaar" + (index + 1).toString() + ".png");

  void setEditing() async {
    name.text = foodItemModel!.name;
    desc.text = foodItemModel!.description;
    cost.text = foodItemModel!.cost;
    Directory path = await getApplicationDocumentsDirectory();
    dietType.value = foodItemModel!.diet_type;
    servingSize = foodItemModel!.std_serving_size;
    category.value = foodItemModel!.category;
    spiceSlider.value = double.parse(foodItemModel!.spice_level);
    final folderPath = path.path + "/images";
    await Directory(folderPath).create();
    final res = await get(Uri.parse(getUrl(foodItemModel!.image1)));
    image1 = File(path.path + "/pic1.png");
    await image1.writeAsBytes(res.bodyBytes);
  }

  RxList<FoodItemModel> foodItems = <FoodItemModel>[
    FoodItemModel(
      id: -1,
      name: "name",
      description: "description",
      image1: "image1",
      diet_type: "diet_type",
      category: "category",
      std_serving_size: "std_serving_size",
      other_serving_size: "other_serving_size",
      other_serving_cost: "other_serving_cost",
      spice_level: "spice_level",
      cost: "cost",
      restaurant: "'restaurant'",
    ),
  ].obs;
  RxList<TableModel> getAvailTables = <TableModel>[
    TableModel(id: -1, capacity: 1, available: false, restaurant: 1)
  ].obs;
  RxList<TableModel> getUnavaailTables = <TableModel>[
    TableModel(id: -1, capacity: 1, available: false, restaurant: 1)
  ].obs;

  RxList<TableModel> allTables = <TableModel>[
    TableModel(id: -1, capacity: 1, available: false, restaurant: 1)
  ].obs;

  // Timer? timer;
  void onChanged(int i) {
    if (i == 3) {
      appBarColor.value = Colors.white;
      getAvailableTables();
    } else {
      appBarColor.value = Colors.transparent;
    }
    selectedIndex.value = i;
    title.value = getTitle(i);
    if (i == 1) {
      //   timer?.cancel();
      getFeedbacksFirst();
    } else if (i == 2) {
      //  timer?.cancel();
      Get.find<OrderController>().getOrderItems();
    } else if (i == 0) {
      getFoodItems();
    }
    ordersOnOff();

    // else {
    //   timer?.cancel();
    // }
  }

  RxString title = "Menu".obs;

  String getTitle(int page) {
    switch (page) {
      case 0:
        return "Menu";
      case 1:
        return "Performance";
      case 2:
        return "Orders";
      case 3:
        return "Table Status";
      case 4:
        return "Profile";
      default:
        return "";
    }
  }

  @override
  void onInit() {
    name = TextEditingController();
    desc = TextEditingController();
    cost = TextEditingController();
    servingname = TextEditingController();
    servingcost = TextEditingController();
    feedback = TextEditingController();
    getFoodItems();
    ordersOnOff();
    super.onInit();
  }

  void clearController() {
    name.clear();
    desc.clear();
    cost.clear();
    servingname.clear();
    servingcost.clear();
    feedback.clear();
    image1 = File("");
    spiceSlider.value = 1;
    servingSize = '';
    category.value = '';
    dietType.value = '';
  }

  RxDouble spiceSlider = 1.0.obs;
  late TextEditingController name;
  late TextEditingController desc;
  late TextEditingController cost;
  late TextEditingController servingname;
  late TextEditingController servingcost;
  late TextEditingController feedback;
  // final nameController = TextEditingController();
  //final descController = TextEditingController();

  File image1 = File("");
  RxString dietType = "".obs;
  RxString category = "".obs;
  String servingSize = "";

  Future<void> getRestaurant() async {
    if (await s.isConnected()) {
      try {
        String resId = await sfHelper.getRestaurantId();

        restaurantModel = await homeServices.getRes(int.parse(resId));
      } catch (e) {
        if (e.runtimeType != SocketException) {
          Get.showSnackbar(MySnackBar.myLoadingSnackBar(
            title: 'Error',
            message: e.toString(),
            icon: FaIcon(
              FontAwesomeIcons.timesCircle,
              color: MyTheme.redColor,
            ),
          ));
          // Get.snackbar("Error", e.toString());
        } else {
          Get.showSnackbar(MySnackBar.myLoadingSnackBar(
            title: 'Error',
            message:
                "There seems to be a server/internet connectivity issue. Please check the same",
            icon: FaIcon(
              FontAwesomeIcons.timesCircle,
              color: MyTheme.redColor,
            ),
          ));
        }
      }
    } else {
      Get.showSnackbar(MySnackBar.myLoadingSnackBar(
        title: 'Error',
        message:
            "There seems to be a internet connectivity issue. Please check your connection",
        icon: FaIcon(
          FontAwesomeIcons.timesCircle,
          color: MyTheme.redColor,
        ),
      ));
    }
  }

  Future<void> setAutoOrder(String resid, int flag) async {
    if (await s.isConnected()) {
      try {
        await homeServices.setAutoOrder(resid.toString(), flag.toString());
      } catch (e) {
        if (e.runtimeType != SocketException) {
          Get.showSnackbar(MySnackBar.myLoadingSnackBar(
            title: 'Error',
            message: e.toString(),
            icon: FaIcon(
              FontAwesomeIcons.timesCircle,
              color: MyTheme.redColor,
            ),
          ));
          // Get.snackbar("Error", e.toString());
        } else {
          Get.showSnackbar(MySnackBar.myLoadingSnackBar(
            title: 'Error',
            message:
                "There seems to be a server/internet connectivity issue. Please check the same",
            icon: FaIcon(
              FontAwesomeIcons.timesCircle,
              color: MyTheme.redColor,
            ),
          ));
        }
      }
    } else {
      Get.showSnackbar(MySnackBar.myLoadingSnackBar(
        title: 'Error',
        message:
            "There seems to be a internet connectivity issue. Please check your connection",
        icon: FaIcon(
          FontAwesomeIcons.timesCircle,
          color: MyTheme.redColor,
        ),
      ));
    }
  }

  Future<bool> getAutoOrder(String resid) async {
    if (await s.isConnected()) {
      try {
        bool data = await homeServices.getAutoOrder(resid.toString());
        return data;
      } catch (e) {
        if (e.runtimeType != SocketException) {
          Get.showSnackbar(MySnackBar.myLoadingSnackBar(
            title: 'Error',
            message: e.toString(),
            icon: FaIcon(
              FontAwesomeIcons.timesCircle,
              color: MyTheme.redColor,
            ),
          ));
          // Get.snackbar("Error", e.toString());
        } else {
          Get.showSnackbar(MySnackBar.myLoadingSnackBar(
            title: 'Error',
            message:
                "There seems to be a server/internet connectivity issue. Please check the same",
            icon: FaIcon(
              FontAwesomeIcons.timesCircle,
              color: MyTheme.redColor,
            ),
          ));
        }
        return false;
      }
    } else {
      Get.showSnackbar(MySnackBar.myLoadingSnackBar(
        title: 'Error',
        message:
            "There seems to be a internet connectivity issue. Please check your connection",
        icon: FaIcon(
          FontAwesomeIcons.timesCircle,
          color: MyTheme.redColor,
        ),
      ));
      return false;
    }
  }

  Future<void> addFoodItem() async {
    if (await s.isConnected()) {
      try {
        String resId = await sfHelper.getRestaurantId();
        await homeServices.addfooditem(
            resId,
            name.text,
            desc.text,
            image1,
            dietType.value,
            category.value,
            servingSize,
            servingcost.text,
            servingname.text,
            spiceSlider.value.toString(),
            cost.text);
        await getFoodItems();
        clearController();
        Get.back();
      } catch (e) {
        if (e.runtimeType != SocketException) {
          Get.showSnackbar(MySnackBar.myLoadingSnackBar(
            title: 'Error',
            message: e.toString(),
            icon: FaIcon(
              FontAwesomeIcons.timesCircle,
              color: MyTheme.redColor,
            ),
          ));
          // Get.snackbar("Error", e.toString());
        } else {
          Get.showSnackbar(MySnackBar.myLoadingSnackBar(
            title: 'Error',
            message:
                "There seems to be a server/internet connectivity issue. Please check the same",
            icon: FaIcon(
              FontAwesomeIcons.timesCircle,
              color: MyTheme.redColor,
            ),
          ));
        }
      }
    } else {
      Get.showSnackbar(MySnackBar.myLoadingSnackBar(
        title: 'Error',
        message:
            "There seems to be a internet connectivity issue. Please check your connection",
        icon: FaIcon(
          FontAwesomeIcons.timesCircle,
          color: MyTheme.redColor,
        ),
      ));
    }
  }

  Future<void> delete(int id) async {
    if (await s.isConnected()) {
      try {
        await homeServices.deleteFoodItem(id);
        getFoodItems();
      } catch (e) {
        if (e.runtimeType != SocketException) {
          Get.showSnackbar(MySnackBar.myLoadingSnackBar(
            title: 'Error',
            message: e.toString(),
            icon: FaIcon(
              FontAwesomeIcons.timesCircle,
              color: MyTheme.redColor,
            ),
          ));
          // Get.snackbar("Error", e.toString());
        } else {
          Get.showSnackbar(MySnackBar.myLoadingSnackBar(
            title: 'Error',
            message:
                "There seems to be a server/internet connectivity issue. Please check the same",
            icon: FaIcon(
              FontAwesomeIcons.timesCircle,
              color: MyTheme.redColor,
            ),
          ));
        }
      }
    } else {
      Get.showSnackbar(MySnackBar.myLoadingSnackBar(
        title: 'Error',
        message:
            "There seems to be a internet connectivity issue. Please check your connection",
        icon: FaIcon(
          FontAwesomeIcons.timesCircle,
          color: MyTheme.redColor,
        ),
      ));
    }
  }

  Future<void> editFoodItem(int id) async {
    if (await s.isConnected()) {
      try {
        String resname = await sfHelper.getRestaurantId();
        await homeServices.editFoodItem(
          id,
          resname,
          name.text,
          desc.text,
          image1,
          dietType.value,
          category.value,
          servingSize,
          servingcost.text,
          servingname.text,
          spiceSlider.value.toString(),
          cost.text,
        );
        await getFoodItems();
        Get.back();
      } catch (e) {
        if (e.runtimeType != SocketException) {
          Get.showSnackbar(MySnackBar.myLoadingSnackBar(
            title: 'Error',
            message: e.toString(),
            icon: FaIcon(
              FontAwesomeIcons.timesCircle,
              color: MyTheme.redColor,
            ),
          ));
          // Get.snackbar("Error", e.toString());
        } else {
          Get.showSnackbar(MySnackBar.myLoadingSnackBar(
            title: 'Error',
            message:
                "There seems to be a server/internet connectivity issue. Please check the same",
            icon: FaIcon(
              FontAwesomeIcons.timesCircle,
              color: MyTheme.redColor,
            ),
          ));
        }
      }
    } else {
      Get.showSnackbar(MySnackBar.myLoadingSnackBar(
        title: 'Error',
        message:
            "There seems to be a internet connectivity issue. Please check your connection",
        icon: FaIcon(
          FontAwesomeIcons.timesCircle,
          color: MyTheme.redColor,
        ),
      ));
    }
  }

  Future<void> getFoodItems() async {
    if (await s.isConnected()) {
      try {
        String id = await sfHelper.getRestaurantId();
        foodItems.value = await homeServices.getMenu(id);
      } catch (e) {
        if (e.runtimeType != SocketException) {
          Get.showSnackbar(MySnackBar.myLoadingSnackBar(
            title: 'Error',
            message: e.toString(),
            icon: FaIcon(
              FontAwesomeIcons.timesCircle,
              color: MyTheme.redColor,
            ),
          ));
          // Get.snackbar("Error", e.toString());
        } else {
          Get.showSnackbar(MySnackBar.myLoadingSnackBar(
            title: 'Error',
            message:
                "There seems to be a server/internet connectivity issue. Please check the same",
            icon: FaIcon(
              FontAwesomeIcons.timesCircle,
              color: MyTheme.redColor,
            ),
          ));
        }

        //timer?.cancel();
      }
    } else {
      Get.showSnackbar(MySnackBar.myLoadingSnackBar(
        title: 'Error',
        message:
            "There seems to be a internet connectivity issue. Please check your connection",
        icon: FaIcon(
          FontAwesomeIcons.timesCircle,
          color: MyTheme.redColor,
        ),
      ));
    }
  }

//
  Future<void> getAvailableTables() async {
    if (await s.isConnected()) {
      try {
        String id = await sfHelper.getRestaurantId();
        List<TableModel> tables = await homeServices.getAvailableTable(id);
        allTables.value = tables;
        getAvailTables.value =
            tables.where((element) => element.available).toList();
        getUnavaailTables.value =
            tables.where((element) => !element.available).toList();
        getAvailTables.sort((a, b) => a.capacity.compareTo(b.capacity));
        getUnavaailTables.sort((a, b) => a.capacity.compareTo(b.capacity));
      } catch (e) {
        getAvailTables.value = getAvailTables.length != 0
            ? getAvailTables.first.id == -1
                ? []
                : getAvailTables
            : [];
        getUnavaailTables.value = getUnavaailTables.length != 0
            ? getUnavaailTables.first.id == -1
                ? []
                : getUnavaailTables
            : [];
        if (e.runtimeType != SocketException) {
          Get.showSnackbar(MySnackBar.myLoadingSnackBar(
            title: 'Error',
            message: e.toString(),
            icon: FaIcon(
              FontAwesomeIcons.timesCircle,
              color: MyTheme.redColor,
            ),
          ));
          // Get.snackbar("Error", e.toString());
        } else {
          Get.showSnackbar(MySnackBar.myLoadingSnackBar(
            title: 'Error',
            message:
                "There seems to be a server/internet connectivity issue. Please check the same",
            icon: FaIcon(
              FontAwesomeIcons.timesCircle,
              color: MyTheme.redColor,
            ),
          ));
        }
      }
    } else {
      Get.showSnackbar(MySnackBar.myLoadingSnackBar(
        title: 'Error',
        message:
            "There seems to be a internet connectivity issue. Please check your connection",
        icon: FaIcon(
          FontAwesomeIcons.timesCircle,
          color: MyTheme.redColor,
        ),
      ));
    }
  }

  Future<int> getSingleTable(String id, int tableId) async {
    if (await s.isConnected()) {
      try {
        List<TableModel> tables = await homeServices.getAvailableTable(id);
        int tableNo = tables.indexWhere((element) => element.id == tableId);
        return tableNo + 1;
      } catch (e) {
        if (e.runtimeType != SocketException) {
          Get.showSnackbar(MySnackBar.myLoadingSnackBar(
            title: 'Error',
            message: e.toString(),
            icon: FaIcon(
              FontAwesomeIcons.timesCircle,
              color: MyTheme.redColor,
            ),
          ));
          // Get.snackbar("Error", e.toString());
        } else {
          Get.showSnackbar(MySnackBar.myLoadingSnackBar(
            title: 'Error',
            message:
                "There seems to be a server/internet connectivity issue. Please check the same",
            icon: FaIcon(
              FontAwesomeIcons.timesCircle,
              color: MyTheme.redColor,
            ),
          ));
        }
        // Get.snackbar("Error", e.toString());

        return -1;
      }
    } else {
      Get.showSnackbar(MySnackBar.myLoadingSnackBar(
        title: 'Error',
        message:
            "There seems to be a internet connectivity issue. Please check your connection",
        icon: FaIcon(
          FontAwesomeIcons.timesCircle,
          color: MyTheme.redColor,
        ),
      ));
      return -1;
    }
  }

  Future<void> switchTableAvailability(int id, bool availability) async {
    if (await s.isConnected()) {
      try {
        await homeServices.switchAvailability(id, availability);
        await getAvailableTables();
      } catch (e) {
        if (e.runtimeType != SocketException) {
          Get.showSnackbar(MySnackBar.myLoadingSnackBar(
            title: 'Error',
            message: e.toString(),
            icon: FaIcon(
              FontAwesomeIcons.timesCircle,
              color: MyTheme.redColor,
            ),
          ));
          // Get.snackbar("Error", e.toString());
        } else {
          Get.showSnackbar(MySnackBar.myLoadingSnackBar(
            title: 'Error',
            message:
                "There seems to be a server/internet connectivity issue. Please check the same",
            icon: FaIcon(
              FontAwesomeIcons.timesCircle,
              color: MyTheme.redColor,
            ),
          ));
        }
      }
    } else {
      Get.showSnackbar(MySnackBar.myLoadingSnackBar(
        title: 'Error',
        message:
            "There seems to be a internet connectivity issue. Please check your connection",
        icon: FaIcon(
          FontAwesomeIcons.timesCircle,
          color: MyTheme.redColor,
        ),
      ));
    }
  }

  RxList<FeedbackModel> feedbacks = <FeedbackModel>[].obs;
  RxBool feedbackLoading = false.obs;
  Future<void> getFeedbacksFirst() async {
    if (await s.isConnected()) {
      try {
        feedbackLoading.value = true;
        String id = await sfHelper.getRestaurantId();
        feedbacks.value = await homeServices.getFeedbacks(id);
        feedbackLoading.value = false;
      } catch (e) {
        feedbackLoading.value = false;
      }
    } else {
      Get.showSnackbar(MySnackBar.myLoadingSnackBar(
        title: 'Error',
        message:
            "There seems to be a internet connectivity issue. Please check your connection",
        icon: FaIcon(
          FontAwesomeIcons.timesCircle,
          color: MyTheme.redColor,
        ),
      ));
    }
  }

  Future<void> getFeedbacks() async {
    if (await s.isConnected()) {
      try {
        String id = await sfHelper.getRestaurantId();
        feedbacks.value = await homeServices.getFeedbacks(id);
      } catch (e) {
        if (e is AppException) {
          //        Get.snackbar("Error", e.toString());

        } else {}
        //timer?.cancel();
      }
    } else {
      Get.showSnackbar(MySnackBar.myLoadingSnackBar(
        title: 'Error',
        message:
            "There seems to be a internet connectivity issue. Please check your connection",
        icon: FaIcon(
          FontAwesomeIcons.timesCircle,
          color: MyTheme.redColor,
        ),
      ));
    }
  }

  FutureOr<void> ordersOnOff() async {
    if (await s.isConnected()) {
      try {
        await getRestaurant();
        switchValue.value = restaurantModel!.open_orders;
      } catch (e) {
        if (e.runtimeType != SocketException) {
          Get.showSnackbar(MySnackBar.myLoadingSnackBar(
            title: 'Error',
            message: e.toString(),
            icon: FaIcon(
              FontAwesomeIcons.timesCircle,
              color: MyTheme.redColor,
            ),
          ));
          // Get.snackbar("Error", e.toString());
        } else {
          Get.showSnackbar(MySnackBar.myLoadingSnackBar(
            title: 'Error',
            message:
                "There seems to be a server/internet connectivity issue. Please check the same",
            icon: FaIcon(
              FontAwesomeIcons.timesCircle,
              color: MyTheme.redColor,
            ),
          ));
        }
      }
    } else {
      Get.showSnackbar(MySnackBar.myLoadingSnackBar(
        title: 'Error',
        message:
            "There seems to be a internet connectivity issue. Please check your connection",
        icon: FaIcon(
          FontAwesomeIcons.timesCircle,
          color: MyTheme.redColor,
        ),
      ));
    }
  }

  Future<void> openCloseOrders() async {
    if (await s.isConnected()) {
      try {
        String id = await sfHelper.getRestaurantId();
        id = await homeServices.openCloseOrders(
          id,
          switchValue.value ? '1' : '0',
        );
        ordersOnOff();
      } catch (e) {
        if (e.runtimeType != SocketException) {
          Get.showSnackbar(MySnackBar.myLoadingSnackBar(
            title: 'Error',
            message: e.toString(),
            icon: FaIcon(
              FontAwesomeIcons.timesCircle,
              color: MyTheme.redColor,
            ),
          ));
          // Get.snackbar("Error", e.toString());
        } else {
          Get.showSnackbar(MySnackBar.myLoadingSnackBar(
            title: 'Error',
            message:
                "There seems to be a server/internet connectivity issue. Please check the same",
            icon: FaIcon(
              FontAwesomeIcons.timesCircle,
              color: MyTheme.redColor,
            ),
          ));
        }
      }
    } else {
      Get.showSnackbar(MySnackBar.myLoadingSnackBar(
        title: 'Error',
        message:
            "There seems to be a internet connectivity issue. Please check your connection",
        icon: FaIcon(
          FontAwesomeIcons.timesCircle,
          color: MyTheme.redColor,
        ),
      ));
    }
  }

  Future<void> logout() async {
    await sfHelper.clear();

    Get.find<AuthController>().clearAll();
    selectedIndex.value = 0;
    final c = Get.find<OrderController>();
    c.inProgress.clear();
    c.ended.clear();
    c.active.clear();
    foodItems.value = [];
    // uid = '';
    Get.offAllNamed(OpeningScreen.id);
  }
}
