import 'dart:convert';
import 'package:http/http.dart';
import 'package:readyplates_restaurants/models/orderitem_model.dart';
import 'package:readyplates_restaurants/utils/api_services.dart';
import 'package:readyplates_restaurants/utils/exception.dart';

class OrderServices extends ApiServices {
  Future<List<OrderItemModel>> getOrder(String id) async {
    Response response = await get(resOrders(id));

    if (response.statusCode == 200) {
      List<dynamic> list = jsonDecode(response.body);
      List<OrderItemModel> orders = list
          .map((e) => OrderItemModel.fromJson(e))
          .cast<OrderItemModel>()
          .toList();
      return orders;
    } else {
      throw AppException(
          code: response.statusCode, message: response.reasonPhrase);
    }
  }
}
