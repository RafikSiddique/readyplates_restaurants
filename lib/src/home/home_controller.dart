import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:readyplates_restaurants/src/home/home_services.dart';
import 'package:readyplates_restaurants/utils/shared_preference_helper.dart';

class HomeController extends GetxController {
  RxInt selectedIndex = 0.obs;
  final pageController = PageController();
  final SharedPreferenceHelper sfHelper = Get.find();
  final HomeServices homeServices = HomeServices();

  void onChanged(int i) {
    selectedIndex.value = i;
    pageController.animateToPage(i,
        duration: Duration(milliseconds: 500), curve: Curves.ease);
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
      String resname = await sfHelper.getRestaurantName();
      await homeServices.addfooditem(
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
      Get.back();
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }
}
