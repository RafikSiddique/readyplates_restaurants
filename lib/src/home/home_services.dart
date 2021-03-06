import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:readyplates_restaurants/models/feedback_model.dart';
import 'package:readyplates_restaurants/models/fooditem_model.dart';
import 'package:readyplates_restaurants/models/restaurant_model.dart';
import 'package:readyplates_restaurants/models/table_model.dart';

import 'package:readyplates_restaurants/utils/api_services.dart';
import 'package:readyplates_restaurants/utils/exception.dart';

class HomeServices extends ApiServices {
  Future<void> addfooditem(
    String restaurant,
    String name,
    String description,
    File image1,
    String diet_type,
    String category,
    String std_serving_size,
    String other_serving_cost,
    String other_serving_size,
    String spice_level,
    String cost,
  ) async {
    try {
      MultipartRequest request = MultipartRequest('POST', menu);
      MultipartFile image1M =
          await MultipartFile.fromPath('image1', image1.path);

      request.files.addAll([image1M]);
      request.fields.addAll({
        'restaurant': restaurant,
        'name': name,
        'description': description,
        'diet_type': diet_type,
        'category': category,
        'std_serving_size': std_serving_size,
        'spice_level': spice_level,
        'cost': cost,
      });
      if (other_serving_cost.isNotEmpty && other_serving_size.isNotEmpty) {
        request.fields.addAll({
          "other_serving_cost": other_serving_cost.isEmpty
              ? "other_serving_cost"
              : other_serving_cost,
          "other_serving_size": other_serving_size.isEmpty
              ? "other_serving_size"
              : other_serving_size,
        });
      }
      StreamedResponse response = await request.send();

      String body = await response.stream.bytesToString();
      print(body);
      if (response.statusCode != 201) {
        throw AppException(
            code: response.statusCode, message: response.reasonPhrase);
      }
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<RestaurantModel> getRes(int id) async {
    try {
      Response response =
          await get(singleRestaurantUri(id), headers: contentTypeJsonHeader);
      if (response.statusCode == 200) {
        print(response.request);
        Map<String, dynamic> data = jsonDecode(response.body).first;
        return RestaurantModel.fromMap(data);
      } else {
        throw AppException(
            code: response.statusCode, message: response.reasonPhrase);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> editFoodItem(
    int id,
    String restaurant,
    String name,
    String description,
    File image1,
    String diet_type,
    String category,
    String std_serving_size,
    String other_serving_cost,
    String other_serving_size,
    String spice_level,
    String cost,
  ) async {
    try {
      MultipartRequest request = MultipartRequest('PUT', updateMenu(id));
      MultipartFile image1M =
          await MultipartFile.fromPath('image1', image1.path);

      request.files.addAll([image1M]);
      request.fields.addAll({
        'restaurant': restaurant,
        'name': name,
        'description': description,
        'diet_type': diet_type,
        'category': category,
        'std_serving_size': std_serving_size,
        'spice_level': spice_level,
        'cost': cost,
      });
      if (other_serving_cost.isNotEmpty && other_serving_size.isNotEmpty) {
        request.fields.addAll({
          "other_serving_cost": other_serving_cost,
          "other_serving_size": other_serving_size,
        });
      }
      StreamedResponse response = await request.send();
      String body = await response.stream.bytesToString();
      print(body);
      if (response.statusCode != 201) {
        throw AppException(
            code: response.statusCode, message: response.reasonPhrase);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> deleteFoodItem(int id) async {
    try {
      Response res = await delete(updateMenu(id));
      if (res.statusCode != 200) {
        throw AppException(code: res.statusCode, message: res.reasonPhrase);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<FeedbackModel>> getFeedbacks(String id) async {
    try {
      Response response = await get(feedbacks(id));
      print(response.body);
      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body);
        return data.map((e) => FeedbackModel.fromMap(e)).toList();
      } else {
        throw AppException(
            message: response.reasonPhrase, code: response.statusCode);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<FoodItemModel>> getMenu(String id) async {
    try {
      Response response = await get(
        menuList(id),
      );

      if (response.statusCode == 200) {
        List<dynamic> list = jsonDecode(response.body);

        List<FoodItemModel> foodItems =
            list.map((e) => FoodItemModel.fromMap(e)).toList();
        print(foodItems);
        return foodItems;
      } else {
        throw AppException(
            code: response.statusCode, message: response.reasonPhrase);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> switchAvailability(int id, bool availability) async {
    try {
      //Request request = Request("POST", setAvailability);

      Response response = await post(setAvailability,
          body: jsonEncode({
            "id": id,
            "available": availability,
          }),
          headers: contentTypeJsonHeader);
      if (response.statusCode != 200) {
        throw AppException(
            code: response.statusCode, message: response.reasonPhrase);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<TableModel>> getAvailableTable(String id) async {
    try {
      Response response = await get(
        availableTable(id),
      );

      if (response.statusCode == 200) {
        List<dynamic> list = (jsonDecode(response.body) as Map)['data'];

        List<TableModel> tables =
            list.map((e) => TableModel.fromMap(e)).toList();
        print(tables);
        return tables;
      } else {
        throw AppException(
            code: response.statusCode, message: response.reasonPhrase);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> getAutoOrder(String resid) async {
    try {
      Response res = await get(autoOrders(resid));
      if (res.statusCode == 200) {
        Map data = jsonDecode(res.body);
        return data['Auto-Order-On'];
      } else {
        return false;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> setAutoOrder(String resid, String flag) async {
    try {
      Response response = await post(setAutoOrders, body: {
        'restaurant': resid,
        'auto_on': flag,
      });
      if (response.statusCode != 200) {
        throw AppException();
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<String> openCloseOrders(
    String restaurant,
    String open_orders,
  ) async {
    try {
      Response response = await post(openCloseOrderUri,
          body: jsonEncode(
            {
              'restaurant': restaurant,
              'open_orders': open_orders,
            },
          ),
          headers: contentTypeJsonHeader);
      print(response.statusCode);
      print(response.body);
      if (response.statusCode == 200) {
        print(response.statusCode);
        print(response.body);
        return response.body;
      } else {
        throw AppException(code: response.statusCode, message: response.body);
      }
    } catch (e) {
      rethrow;
    }
  }
}
