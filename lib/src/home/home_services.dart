import 'dart:io';

import 'package:http/http.dart';
import 'package:readyplates_restaurants/utils/api_services.dart';
import 'package:readyplates_restaurants/utils/exception.dart';

class HomeServices extends ApiServices {
  Future<void> addfooditem(
    String restaurant,
    String name,
    String description,
    File image1,
    File image2,
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
      MultipartFile image2M =
          await MultipartFile.fromPath('image2', image2.path);

      request.files.addAll([image1M, image2M]);
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
}
