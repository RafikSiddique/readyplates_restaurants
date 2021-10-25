import 'package:get/get.dart';
import 'package:readyplates_restaurants/src/home/order_services.dart';
import 'package:readyplates_restaurants/utils/shared_preference_helper.dart';

class OrderController extends GetxController {
  final SharedPreferenceHelper sfHelper = Get.find();
  final OrderServices homeServices = OrderServices();

  Future<void> getOrderItems() async {
    try {
      String id = await sfHelper.getRestaurantId();
      //  order  = await homeServices.resOrders(id); // TODO: orderitemmodel
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }
}
