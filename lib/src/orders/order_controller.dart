import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:readyplates_restaurants/models/orderitem_model.dart';
import 'package:readyplates_restaurants/src/orders/order_services.dart';
import 'package:readyplates_restaurants/utils/api_services.dart';
import 'package:readyplates_restaurants/utils/my_color.dart';
import 'package:readyplates_restaurants/utils/shared_preference_helper.dart';
import 'package:readyplates_restaurants/widgets/snackbar.dart';

class OrderController extends GetxController {
  final SharedPreferenceHelper sfHelper = Get.find();
  final OrderServices services = OrderServices();
  final ApiServices s = ApiServices();
  RxList<OrderModelApi> active = <OrderModelApi>[].obs;
  RxList<OrderModelApi> inProgress = <OrderModelApi>[].obs;
  RxList<OrderModelApi> Served = <OrderModelApi>[].obs;
  RxList<OrderModelApi> ended = <OrderModelApi>[].obs;
  RxString searchByOrderState = "placed".obs;

  RxBool loading = false.obs;

  List<String> months() => [
        "January",
        "February",
        "March",
        "April",
        "May",
        "June",
        "July",
        "August",
        "September",
        "October",
        "November",
        "December",
      ];

  final List<String> weekos = [
    "Monday",
    "Tuesday",
    "Wednessday",
    "Thursday",
    "Friday",
    "Saturday",
    "Sunday",
  ];

  late List<TextEditingController> otpText;
  String otp = '';
  late List<FocusNode> otpFields;
  @override
  void onInit() {
    getOrderItems();
    otpFields = List.generate(4, (index) => FocusNode());
    otpText = List.generate(4, (index) => TextEditingController());
    super.onInit();
  }

  RxString otpVerification = "".obs;

  String otpVerified = "OTP Verified";
  String incorrect = "Incorrect OTP";

  Future<void> getOrderItems() async {
    if (await s.isConnected()) {
      try {
        loading.value = true;
        String id = await sfHelper.getRestaurantId();
        List<OrderModelApi> orderList = await services.getOrder(id);
        loading.value = false;
        active.value = orderList
            .where((element) => element.status == OrderState.placed)
            .toList();
        active.sort((a, b) => b.id.compareTo(a.id));

        inProgress.value = orderList
            .where((element) => element.status == OrderState.inProgress)
            .toList();
        inProgress.sort((a, b) => b.id.compareTo(a.id));

        Served.value = orderList
            .where((element) => element.status == OrderState.Served)
            .toList();
        Served.sort((a, b) => b.id.compareTo(a.id));

        ended.value =
            orderList.where((element) => element.status.index > 2).toList();
        ended.sort((a, b) => b.id.compareTo(a.id));

        update();
      } catch (e) {
        loading.value = false;
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

  Future<void> getOrderItemsWithoutLoad() async {
    if (await s.isConnected()) {
      try {
        String id = await sfHelper.getRestaurantId();
        final orderList = await services.getOrder(id);
        active.value = orderList
            .where((element) => element.status == OrderState.placed)
            .toList();
        active.sort((a, b) => b.id.compareTo(a.id));

        inProgress.value = orderList
            .where((element) => element.status == OrderState.inProgress)
            .toList();
        inProgress.sort((a, b) => b.id.compareTo(a.id));

        Served.value = orderList
            .where((element) => element.status == OrderState.Served)
            .toList();
        Served.sort((a, b) => b.id.compareTo(a.id));

        ended.value =
            orderList.where((element) => element.status.index > 2).toList();
        ended.sort((a, b) => b.id.compareTo(a.id));

        update();
      } catch (e) {
        loading.value = false;
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

  Future<void> updateStatus(int id, OrderState status,
      [int tableId = -1]) async {
    if (await s.isConnected()) {
      try {
        loading.value = true;
        await services.updateStatus(id, status.index, tableId);
        await getOrderItems();
        loading.value = false;
      } catch (e) {
        loading.value = false;
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
}
