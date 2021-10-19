import 'dart:convert';
import 'dart:io';

import 'package:readyplates_restaurants/utils/api_services.dart';
import 'package:readyplates_restaurants/utils/exception.dart';
import 'package:http/http.dart';

class OnboardingServices extends ApiServices {
  Future<String> onboardingapi1(
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
        print(resp["Id"]);
        String id = resp["Restaurant ID"].toString();
        print('User Id is ---->' + id);
        print(response.body);

        return id;
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

  Future<void> onboardingapi4(
    String user,
    String type_of_estd,
    String type_of_cusine,
    String start_time,
    String end_time,
    String open_days,
  ) async {
    try {
      Response response = await post(
        onboarding(2),
        body: jsonEncode(
          {
            'user': user,
            'type_of_estd': type_of_estd,
            'type_of_cusine': type_of_cusine,
            'start_time': start_time,
            'end_time': end_time,
            'open_days': open_days,
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

  Future<void> onboardingapi5(
    String user,
    String ac_number,
    String type_of_ac,
    String ifsc_code,
    String pan_num,
    String pan_name,
    File pan_image,
  ) async {
    try {
      MultipartRequest request = MultipartRequest('POST', onboarding(5));

      MultipartFile panImage =
          await MultipartFile.fromPath('pan_image', pan_image.path);

      request.files.addAll([panImage]);
      request.fields.addAll({
        'user': user,
        'ac_number': ac_number,
        'type_of_ac': type_of_ac,
        'ifsc_code': ifsc_code,
        'pan_num': pan_num,
        'pan_name': pan_name,
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

  Future<void> onboardingapi6(
    String user,
    String description,
    String no_of_tables,
    String max_table_size,
    String cost_for_two,
    String serving_time,
    String recurring_event_date,
    String recur_freq,
    String event_start,
    String event_end,
    String event_desc,
  ) async {
    try {
      Response response = await post(
        onboarding(6),
        body: jsonEncode(
          {
            'user': user,
            'description': description,
            'no_of_tables': no_of_tables,
            'max_table_size': max_table_size,
            'cost_for_two': cost_for_two,
            'serving_time': serving_time,
            'recurring_event_date': recurring_event_date,
            'recur_freq': recur_freq,
            'event_start': event_start,
            'event_end': event_end,
            'event_desc': event_desc,
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

  Future<bool> uploadImages(
      List<String> files, int index, List<String> fields, String user) async {
    try {
      List<MultipartFile> multipartFiles = [];

      for (int i = 0; i < files.length; i++) {
        MultipartFile multipartFile =
            await MultipartFile.fromPath(fields[i], files[i]);
        multipartFiles.add(multipartFile);
      }
      MultipartRequest request =
          MultipartRequest('POST', onboarding(index + 7));
      request.files.addAll(multipartFiles);
      request.fields.addAll({'user': user});
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
