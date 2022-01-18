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
        Map resp1 = json.decode(response.body);

        String resid = resp1['Restaurant ID'].toString();
        print('Restaurant Id is ---->' + resid);
        return resid;
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
      if (response.statusCode != 201) {
        throw AppException(code: response.statusCode, message: response.body);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> onboardingapi3(
    String user,
    String ac_number,
    String ac_name,
    String business_address,
    String phone_num,
    String time_zone,
  ) async {
    try {
      Response response = await post(
        onboarding(3),
        body: jsonEncode(
          {
            'user': user,
            'ac_number': ac_number,
            'ac_name': ac_name,
            'business_address': business_address,
            'phone_num': phone_num,
            'time_zone': time_zone,
          },
        ),
        headers: contentTypeJsonHeader,
      );

      if (response.statusCode != 201) {
        throw AppException(
            code: response.statusCode, message: response.reasonPhrase);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> onboardingapi4(
    String user,
    String business_name,
    String support_email,
    String support_num,
    String support_add,
  ) async {
    try {
      Response response = await post(
        onboarding(4),
        body: jsonEncode(
          {
            'user': user,
            'business_name': business_name,
            'support_email': support_email,
            'support_num': support_num,
            'support_add': support_add,
          },
        ),
        headers: contentTypeJsonHeader,
      );

      if (response.statusCode != 201) {
        throw AppException(code: response.statusCode, message: response.body);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> onboardingapi5(
    String user,
    String statement_desc,
    String short_desc,
    String business_website,
    String support_website,
    String privacy_policy,
    String terms_of_service,
    String fsol_license,
  ) async {
    try {
      Response response = await post(
        onboarding(5),
        body: jsonEncode(
          {
            'user': user,
            'statement_desc': statement_desc,
            'short_desc': short_desc,
            'business_website': business_website,
            'support_website': support_website,
            'privacy_policy': privacy_policy,
            'terms_of_service': terms_of_service,
            'fsol_license': fsol_license,
          },
        ),
        headers: contentTypeJsonHeader,
      );

      if (response.statusCode != 201) {
        throw AppException(
            code: response.statusCode, message: response.reasonPhrase);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> onboardingapi6(
    String user,
    String type_of_business,
    String name_of_business,
    String ein,
    File ss4_letter,
    File c147_letter,
  ) async {
    try {
      MultipartRequest request = MultipartRequest('POST', onboarding(6));
      //TODO: Uncomment
      /*  MultipartFile ss4_letters =
          await MultipartFile.fromPath('ss4_letter', ss4_letter.path);
      MultipartFile c147_letters =
          await MultipartFile.fromPath('c147_letter', c147_letter.path); */

      //request.files.addAll([ss4_letters, c147_letters]);
      request.fields.addAll({
        'user': user,
        'type_of_business': type_of_business,
        'name_of_business': name_of_business,
        'ein': ein,
      });

      StreamedResponse response = await request.send();

      if (response.statusCode != 201) {
        throw AppException(
            code: response.statusCode, message: response.reasonPhrase);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> onboardingapi7(
    String user,
    String type_of_estd,
    String type_of_cusine,
    String start_time,
    String end_time,
    String open_days,
  ) async {
    try {
      Response response = await post(
        onboarding(7),
        body: jsonEncode(
          {
            'user': user,
            'type_of_estd': type_of_estd,
            'types_of_cusine': type_of_cusine,
            'start_time': start_time,
            'end_time': end_time,
            'open_days': open_days,
          },
        ),
        headers: contentTypeJsonHeader,
      );

      if (response.statusCode != 201) {
        throw AppException(code: response.statusCode, message: response.body);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> onboardingapi8(
    String user,
    String description,
    String serving_time,
    String no_of_orders,
    String advance_orders,
    String recurring_event_date,
    String event_name,
    String event_start,
    String event_end,
    String event_desc,
  ) async {
    try {
      Response response = await post(
        onboarding(8),
        body: jsonEncode(
          {
            'user': user,
            'description': description,
            'serving_time': serving_time,
            'no_of_orders': no_of_orders,
            'advance_orders': advance_orders,
            'recurring_event_date': recurring_event_date,
            'event_name': event_name,
            'event_start': event_start,
            'event_end': event_end,
            'event_desc': event_desc,
          },
        ),
        headers: contentTypeJsonHeader,
      );
      if (response.statusCode != 201) {
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
        print("File:$i");
        File file = File(files[i]);
        List<int> bytes = await file.readAsBytes();
        print(bytes);
        print(bytes.length);
        MultipartFile multipartFile =
            await MultipartFile.fromBytes(fields[i], bytes);
        multipartFiles.add(multipartFile);
      }
      MultipartRequest request =
          MultipartRequest('POST', onboarding(index + 9));
      request.fields.addAll({'user': user});
      request.files.addAll(multipartFiles);
      print(user);
      StreamedResponse response = await request.send();
      print(request.fields);
      print(request.files);
      if (response.statusCode == 201) {
        String body = await response.stream.bytesToString();
        print(body);
        return true;
      } else {
        print(response.reasonPhrase);
        String body = await response.stream.bytesToString();
        print(body);
        throw AppException();
      }
    } catch (e) {
      throw AppException(message: e.toString());
    }
  }

  Future<void> tableConfig(
    String restaurant,
    List<int> capacity,
  ) async {
    try {
      Response response = await post(
        table,
        body: jsonEncode(
          {
            'restaurant': restaurant,
            'capacity': capacity,
          },
        ),
        headers: contentTypeJsonHeader,
      );
      if (response.statusCode != 200) {
        throw AppException(code: response.statusCode, message: response.body);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> tableConfigEdit(
      String restaurant, List<int> capacity, List<String> available) async {
    try {
      Response response = await post(
        table,
        body: jsonEncode(
          {
            'restaurant': restaurant,
            'capacity': capacity,
            'available': available
          },
        ),
        headers: contentTypeJsonHeader,
      );
      if (response.statusCode != 200) {
        throw AppException(code: response.statusCode, message: response.body);
      }
    } catch (e) {
      rethrow;
    }
  }
}
