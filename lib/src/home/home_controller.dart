import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:path_provider/path_provider.dart';
import 'package:readyplates_restaurants/models/feedback_model.dart';
import 'package:readyplates_restaurants/models/fooditem_model.dart';
import 'package:readyplates_restaurants/models/table_model.dart';
import 'package:readyplates_restaurants/src/home/home_services.dart';
import 'package:readyplates_restaurants/src/orders/order_controller.dart';
import 'package:readyplates_restaurants/src/home/screens/add_food_item.dart';
import 'package:readyplates_restaurants/src/login/auth_controller.dart';
import 'package:readyplates_restaurants/src/staticscreens/opening_screen.dart';
import 'package:readyplates_restaurants/utils/exception.dart';
import 'package:readyplates_restaurants/utils/shared_preference_helper.dart';

class HomeController extends GetxController {
  HomeController({required this.selectedIndex});

  Rx<Color> appBarColor = Colors.transparent.obs;
  RxString searchBy = "Table Capacity".obs;
  RxInt selectedIndex;
  bool isEditing = false;
  // late PageController pageController =
  //     PageController(initialPage: selectedIndex.value);
  FoodItemModel? foodItemModel;

  final SharedPreferenceHelper sfHelper = Get.find();
  final HomeServices homeServices = HomeServices();

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

  Timer? timer;
  void onChanged(int i) {
    if (i == 3) {
      appBarColor.value = Colors.white;
      getAvailableTables();
    } else {
      appBarColor.value = Colors.transparent;
    }
    selectedIndex.value = i;

    // pageController.animateToPage(i,
    //     duration: Duration(milliseconds: 500), curve: Curves.ease);
    title.value = getTitle(i);
    if (i == 1) {
      timer?.cancel();
      getFeedbacksFirst();
      timer = Timer.periodic(Duration(seconds: 5), (t) async {
        await getFeedbacks();
        timer = t;
      });
    } else if (i == 2) {
      timer?.cancel();
      Get.find<OrderController>().getOrderItems();
      timer = Timer.periodic(Duration(seconds: 2), (t) async {
        await Get.find<OrderController>().getOrderItemsWithoutLoad();

        timer = t;
      });
    } else if (i == 0) {
      timer?.cancel();

      timer = Timer.periodic(Duration(seconds: 2), (t) async {
        await getFoodItems();

        timer = t;
      });
    } else {
      timer?.cancel();
    }
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

  Future<void> addFoodItem() async {
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
      Get.snackbar("Error", e.toString());
    }
  }

  Future<void> editFoodItem(int id) async {
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
      Get.snackbar("Error", e.toString());
    }
  }

  Future<void> getFoodItems() async {
    try {
      String id = await sfHelper.getRestaurantId();
      foodItems.value = await homeServices.getMenu(id);
    } catch (e) {
      foodItems.value = foodItems.length != 0
          ? foodItems.first.id == -1
              ? []
              : foodItems
          : [];
      Get.snackbar("Error", e.toString());
      timer?.cancel();
    }
  }

//
  Future<void> getAvailableTables() async {
    try {
      String id = await sfHelper.getRestaurantId();
      List<TableModel> tables = await homeServices.getAvailableTable(id);
      getAvailTables.value =
          tables.where((element) => element.available).toList();
      getUnavaailTables.value =
          tables.where((element) => !element.available).toList();
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
      Get.snackbar("Error", e.toString());
      timer?.cancel();
    }
  }

  Future<void> switchTableAvailability(int id, bool availability) async {
    try {
      await homeServices.switchAvailability(id, availability);
      await getAvailableTables();
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  RxList<FeedbackModel> feedbacks = <FeedbackModel>[].obs;
  RxBool feedbackLoading = false.obs;
  Future<void> getFeedbacksFirst() async {
    try {
      feedbackLoading.value = true;
      String id = await sfHelper.getRestaurantId();
      feedbacks.value = await homeServices.getFeedbacks(id);
      feedbackLoading.value = false;
    } catch (e) {
      Get.snackbar("Error", e.toString());
      feedbackLoading.value = false;
    }
  }

  Future<void> getFeedbacks() async {
    try {
      String id = await sfHelper.getRestaurantId();
      feedbacks.value = await homeServices.getFeedbacks(id);
    } catch (e) {
      if (e is AppException) {
//        Get.snackbar("Error", e.toString());

      } else {}
      timer?.cancel();
    }
  }

  Future<void> logout() async {
    await sfHelper.clear();
    timer?.cancel();
    Get.find<AuthController>().clearAll();
    selectedIndex.value = 0;
    final c = Get.find<OrderController>();
    c.inProgress.clear();
    c.ended.clear();
    c.active.clear();
    foodItems.value = [];
    Get.offAllNamed(OpeningScreen.id);
  }
}
