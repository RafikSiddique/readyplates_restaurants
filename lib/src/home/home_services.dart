import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:readyplates_restaurants/models/fooditem_model.dart';
// import 'package:readyplates_restaurants/src/onboarding/onboarding_controller.dart';
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
        "other_serving_cost": other_serving_cost,
        "other_serving_size": other_serving_size,
        'cost': cost,
      });
      StreamedResponse response = await request.send();
      if (response.statusCode == 201) {
        String body = await response.stream.bytesToString();
        print(body);
      } else {
        String body = await response.stream.bytesToString();
        print(body);
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
        "other_serving_cost": other_serving_cost,
        "other_serving_size": other_serving_size,
        'cost': cost,
      });
      StreamedResponse response = await request.send();
      if (response.statusCode == 201) {
        String body = await response.stream.bytesToString();
        print(body);
      } else {
        String body = await response.stream.bytesToString();
        print(body);
        throw AppException(
            code: response.statusCode, message: response.reasonPhrase);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Map<String, dynamic>>> getFeedbacks(String id) async {
    try {
      Response response = await get(feedbacks(id));
      if (response.statusCode == 201) {
        return jsonDecode(response.body);
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

      print(response.body);
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
}
