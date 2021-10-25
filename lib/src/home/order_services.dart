import 'dart:convert';
import 'package:http/http.dart';
import 'package:readyplates_restaurants/models/fooditem_model.dart';
import 'package:readyplates_restaurants/utils/api_services.dart';
import 'package:readyplates_restaurants/utils/exception.dart';

class OrderServices extends ApiServices {
  Future<List<FoodItemModel>> getOrder(String id) async {
    Response response = await get(resOrders(id));

    if (response.statusCode == 200) {
      List<dynamic> list = jsonDecode(response.body);
      List<FoodItemModel> orders =
          list.map((e) => FoodItemModel.fromMap(e)).toList();
      return orders;
    } else {
      throw AppException(
          code: response.statusCode, message: response.reasonPhrase);
    }
  }
}
