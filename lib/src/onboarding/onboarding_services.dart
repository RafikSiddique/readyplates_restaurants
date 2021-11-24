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
        print(resp1["Restaurant ID"]);
        print('ID!!!!!!!!!!!!!!!!!!!');
        String resid = resp1['Restaurant ID'].toString();
        print('User Id is ---->' + resid);
        print(response.body);
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
      print('ID!!!!!!!!!!!!!!!!!5454545!!');
      print(response.body);
      print(response.statusCode);
      if (response.statusCode == 201) {
        print('ID!!!!!!!!!!!!!!!!!!!');
        print(response.body);
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
      print('ID!!!!!!!!!!!!!!!!!5454545!!');
      print(response.body);
      print(response.statusCode);
      if (response.statusCode == 201) {
        print('ID!!!!!!!!!!!!!!!!!!!');
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

      print('body1');
      print('body2');
      print('ID!!!!!!!!!!!!!!!!!5454545!!');
      print(response.body);
      print(response.statusCode);

      if (response.statusCode == 201) {
        print('body3');
        print('body4');
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
    String type_of_business,
    String name_of_business,
    String ein,
    File ss4_letter,
    File c147_letter,
  ) async {
    print('body1');
    print('body2');
    print('ID!!!!!!!!!!!!!!!!!5454545!!');
    try {
      MultipartRequest request = MultipartRequest('POST', onboarding(6));
      MultipartFile ss4_letters =
          await MultipartFile.fromPath('ss4_letter', ss4_letter.path);
      MultipartFile c147_letters =
          await MultipartFile.fromPath('c147_letter', c147_letter.path);
      print('body3');
      print('body4');
      print('ID!!!!!!!!!!!!!!!!!5454545!!');
      request.files.addAll([ss4_letters, c147_letters]);
      request.fields.addAll({
        'user': user,
        'type_of_business': type_of_business,
        'name_of_business': name_of_business,
        'ein': ein,
      });

      StreamedResponse response = await request.send();
      print(response);
      print(response.statusCode);
      if (response.statusCode == 201) {
        print(response);
        print(response.statusCode);
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

  Future<void> onboardingapi7(
    String user,
    String type_of_estd,
    String type_of_cusine,
    String start_time,
    String end_time,
    String open_days,
  ) async {
    print('body1');
    print('body2');
    print('ID!!!!!!!!!!!!!!!!!5454545!!');
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
      print('body3');
      print('body4');
      print('ID!!!!!!!!!!!!!!!!!5454545!!');
      print(response.body);
      print(response.statusCode);
      if (response.statusCode == 201) {
        print(response.body);
        print(response.statusCode);
        print(response.body);
      } else {
        throw AppException(code: response.statusCode, message: response.body);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> onboardingapi8(
    String user,
    String description,
    String no_of_tables,
    String max_table_size,
    String serving_time,
    String table_alloc_time,
    String recurring_event_date,
    String recur_freq,
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
            'no_of_tables': no_of_tables,
            'max_table_size': max_table_size,
            'serving_time': serving_time,
            'table_alloc_time': table_alloc_time,
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
          MultipartRequest('POST', onboarding(index + 9));
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
}
