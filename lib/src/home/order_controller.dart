import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:readyplates_restaurants/models/orderitem_model.dart';
import 'package:readyplates_restaurants/src/home/order_services.dart';
import 'package:readyplates_restaurants/utils/shared_preference_helper.dart';

class OrderController extends GetxController {
  final SharedPreferenceHelper sfHelper = Get.find();
  final OrderServices services = OrderServices();
  RxList<OrderModelApi> orderList = <OrderModelApi>[].obs;

  late List<TextEditingController> otpText;
  String otp = '';
  late List<FocusNode> otpFields;
  @override
  void onInit() {
    getOrderItems();
    otpFields = List.generate(6, (index) => FocusNode());
    otpText = List.generate(6, (index) => TextEditingController());
    super.onInit();
  }

  RxString otpVerification = "".obs;

  String otpVerified = "OTP Verified";
  String incorrect = "Incorrect OTP";

  Future<void> getOrderItems() async {
    try {
      String id = await sfHelper.getRestaurantId();
      orderList.value = await services.getOrder(id);
      orderList.sort((a, b) => a.status.index.compareTo(b.status.index));
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  Future<void> updateStatus(int id, int status) async {
    try {
      await services.updateStatus(id, status);
      await getOrderItems();
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }
}
