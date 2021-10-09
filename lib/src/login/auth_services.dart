import 'dart:convert';
// import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:readyplates_restaurants/utils/api_services.dart';
import 'package:readyplates_restaurants/utils/exception.dart';
import 'package:readyplates_restaurants/utils/shared_preference_helper.dart';

class AuthenticationServices extends ApiServices {
  SharedPreferenceHelper sharedPreferenceHelper = SharedPreferenceHelper();
  Future<String> signup(
    String email,
    String password,
    String password2,
  ) async {
    try {
      http.Response response = await http.post(
        registerUri,
        body: jsonEncode(
          {
            'email': email,
            'password': password,
            'password2': password2,
          },
        ),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      if (response.statusCode == 200) {
        Map resp = json.decode(response.body);
        print(resp["ID"]);
        String id = resp["ID"].toString();
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

  Future<String> login(
    String username,
    String password,
  ) async {
    try {
      http.Response response = await http.post(
        loginUri,
        body: jsonEncode(
          {
            'username': username,
            'password': password,
          },
        ),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      if (response.statusCode == 200) {
        Map resp = json.decode(response.body);
        print(resp["ID"]);
        String id = resp["ID"].toString();
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
      http.Response response = await http.post(
        onboarding as Uri,
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
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      if (response.statusCode == 201) {
        Map resp = json.decode(response.body);
        print(resp["ID"]);
        String id = resp["ID"].toString();
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
}
