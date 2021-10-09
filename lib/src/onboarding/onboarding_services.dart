import 'dart:convert';
import 'dart:io';

import 'package:readyplates_restaurants/utils/api_services.dart';
import 'package:readyplates_restaurants/utils/exception.dart';
import 'package:http/http.dart';

class OnboardingServices extends ApiServices {
  Future<void> onboardingapi1(
    String user,
    String res_name,
    String own_name,
    String own_mobile,
    String res_city,
    String poc,
    String poc_number,
  ) async {
    try {
      Response response = await post(onboarding(1),
          body: jsonEncode(
            {
              'user': user,
              'res_name': res_name,
              'own_name': own_name,
              'own_mobile': own_mobile,
              'res_city': res_city,
              'poc': poc,
              'poc_number': poc_number,
            },
          ),
          headers: contentTypeJsonHeader);
      if (response.statusCode == 201) {
        Map resp = json.decode(response.body);
        print(resp);
      } else {
        throw AppException(code: response.statusCode, message: response.body);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> onboardingapi2(
    String user,
    String address,
    String postal_code,
    String latitude,
    String longitude,
  ) async {
    try {
      Response response = await post(
        onboarding(2),
        body: jsonEncode(
          {
            'user': user,
            'address': address,
            'postal_code': postal_code,
            'latitude': latitude,
            'longitude': longitude,
          },
        ),
        headers: contentTypeJsonHeader,
      );
      if (response.statusCode == 201) {
        print(response.body);
      } else {
        throw AppException(code: response.statusCode, message: response.body);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> onboardingapi3(
    String user,
    String gstin_present,
    String gstin_num,
    String fssai_status,
    String fssai_expiry,
    File kyc_image,
    File gstin_image,
    File fssai_image,
  ) async {
    try {
      MultipartRequest request = MultipartRequest('POST', onboarding(3));
      MultipartFile kycImage =
          await MultipartFile.fromPath('kyc_image', kyc_image.path);
      MultipartFile gstin_Image =
          await MultipartFile.fromPath('gstin_image', gstin_image.path);
      MultipartFile fssaiImage =
          await MultipartFile.fromPath('fssai_image', fssai_image.path);
      request.files.addAll([kycImage, fssaiImage, gstin_Image]);
      request.fields.addAll({
        'user': user,
        'gstin_present': gstin_present,
        'gstin_num': gstin_num,
        'fssai_status': fssai_status,
        'fssai_expiry': fssai_expiry,
      });
      StreamedResponse response = await request.send();
      if (response.statusCode == 201) {
        String body = await response.stream.bytesToString();
        print(body);
      } else {
        throw AppException(
            code: response.statusCode, message: response.reasonPhrase);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> uploadImages(List<String> files, int index) async {
    try {
      List<List<String>> fields = [
        ["front_fascia_day", "front_fascia_night", "street_view", "entrance"],
        ["ambience1", "ambience2", "ambience3", "ambience4"],
        ["food1", "food2", "food3", "food4"],
        ["cv19prec1", "cv19prec2", "cv19prec3", "cv19prec4"]
      ];
      List<MultipartFile> multipartFiles = [];

      for (int i = 0; i < files.length; i++) {
        MultipartFile multipartFile =
            await MultipartFile.fromPath(fields[index][i], files[i]);
        multipartFiles.add(multipartFile);
      }
      MultipartRequest request =
          MultipartRequest('POST', onboarding(index + 7));
      request.files.addAll(multipartFiles);
      request.fields.addAll({'user': "31"});
      StreamedResponse response = await request.send();
      if (response.statusCode == 201) {
        String body = await response.stream.bytesToString();
        print(body);
        return true;
      } else {
        throw AppException();
      }
    } catch (e) {
      throw AppException(message: e.toString());
    }
  }
}
