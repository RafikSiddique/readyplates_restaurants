import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:readyplates_restaurants/models/feedback_model.dart';
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
        'cost': cost,
      });

      //if (other_serving_cost.isNotEmpty && other_serving_size.isNotEmpty) {
        request.fields.addAll({
          "other_serving_cost": other_serving_cost.isEmpty ? "other_serving_cost" : other_serving_cost,
          "other_serving_size": other_serving_size.isEmpty ? "other_serving_size" : other_serving_size ,
        });
      //}

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

  Future<List<FeedbackModel>> getFeedbacks(String id) async {
    try {
      print(id);
      Response response = await get(feedbacks(id));

      print(response.statusCode);
      print(response.reasonPhrase);
      print(response.body);
      if (response.statusCode == 200) {
        print(response.body);
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
