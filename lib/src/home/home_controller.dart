import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:path_provider/path_provider.dart';
import 'package:readyplates_restaurants/models/fooditem_model.dart';
import 'package:readyplates_restaurants/src/home/home_services.dart';
import 'package:readyplates_restaurants/src/home/screens/add_food_item.dart';
import 'package:readyplates_restaurants/src/login/auth_controller.dart';
import 'package:readyplates_restaurants/src/onboarding/onboarding_controller.dart';
import 'package:readyplates_restaurants/utils/shared_preference_helper.dart';
import 'package:readyplates_restaurants/utils/utils.dart';

class HomeController extends GetxController {
  RxInt selectedIndex = 0.obs;
  bool isEditing = false;
  final pageController = PageController();
  FoodItemModel? foodItemModel;

  final SharedPreferenceHelper sfHelper = Get.find();
  final HomeServices homeServices = HomeServices();

  void setEditing() async {
    nameController.text = foodItemModel!.name;
    descController.text = foodItemModel!.description;
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

    final res2 = await get(Uri.parse(getUrl(foodItemModel!.image2)));
    image2 = File(path.path + "/pic2.png");
    await image2.writeAsBytes(res2.bodyBytes);
  }

  RxList<FoodItemModel> foodItems = <FoodItemModel>[
    FoodItemModel(
        id: -1,
        name: "name",
        description: "description",
        image1: "image1",
        image2: "image2",
        diet_type: "diet_type",
        category: "category",
        std_serving_size: "std_serving_size",
        other_serving_size: "other_serving_size",
        other_serving_cost: "other_serving_cost",
        spice_level: "spice_level",
        cost: "cost",
        restaurant: "'restaurant'"),
  ].obs;
  void onChanged(int i) {
    selectedIndex.value = i;
    pageController.animateToPage(i,
        duration: Duration(milliseconds: 500), curve: Curves.ease);
    title.value = getTitle(i);
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
        return "Profile";
      default:
        return "";
    }
  }

  @override
  void onInit() {
    getFoodItems();
    super.onInit();
  }

  void clearController() {
    nameController.clear();
    descController.clear();
    cost.clear();
    image1 = File("");
    image2 = File("");
    spiceSlider.value = 1;
  }

  RxDouble spiceSlider = 1.0.obs;

  final nameController = TextEditingController();
  final descController = TextEditingController();

  File image1 = File("");
  File image2 = File("");
  RxString dietType = "".obs;
  final cost = TextEditingController();
  RxString category = "".obs;
  String servingSize = "";

  Future<void> addFoodItem() async {
    try {
      String resId = await sfHelper.getRestaurantId();
      await homeServices.addfooditem(
          resId,
          nameController.text,
          descController.text,
          image1,
          image2,
          dietType.value,
          category.value,
          servingSize,
          "other_cost",
          "other_serving_size",
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
          nameController.text,
          descController.text,
          image1,
          image2,
          dietType.value,
          category.value,
          servingSize,
          "other_cost",
          "other_serving_size",
          spiceSlider.value.toString(),
          cost.text);
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
    }
  }

  Future<void> logout() async {
    await sfHelper.clear();
    Get.find<AuthController>().clearAll();

    Get.find<OnboardingController>().clear();

    Get.offAllNamed(Routes.openingscreenRoute);
  }
}
