import 'dart:convert';
// import 'dart:io';

import 'package:http/http.dart';
import 'package:readyplates_restaurants/utils/api_services.dart';
import 'package:readyplates_restaurants/utils/exception.dart';
import 'package:readyplates_restaurants/utils/shared_preference_helper.dart';

String respOtp = '';

class AuthenticationServices extends ApiServices {
  SharedPreferenceHelper sharedPreferenceHelper = SharedPreferenceHelper();
  Future<String> signup(
    String email,
    String password,
    String password2,
  ) async {
    try {
      Response response = await post(
        registerUri,
        body: jsonEncode(
          {
            'email': email,
            'password': password,
            'password2': password2,
          },
        ),
        headers: contentTypeJsonHeader,
      );
      if (response.statusCode == 201) {
        Map resp = json.decode(response.body);

        return resp['Id'].toString();
      } else {
        throw AppException(code: response.statusCode, message: response.body);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<String>> login(
    String username,
    String password,
  ) async {
    try {
      Response response = await post(
        loginUri,
        body: jsonEncode(
          {
            'username': username,
            'password': password,
          },
        ),
        headers: contentTypeJsonHeader,
      );
      if (response.statusCode == 200) {
        Map resp = json.decode(response.body);
        print(resp["ID"]);
        String id = resp["ID"].toString();
        String resid = resp["Restaurant ID"].toString();
        print('User Id is ---->' + id);
        print(response.body);
        return [id, resid];
      } else {
        throw AppException(code: response.statusCode, message: response.body);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> changePassword(
    String email,
    String password,
  ) async {
    try {
      Response response = await post(
        changePass,
        body: jsonEncode(
          {
            'email': email,
            'password': password,
          },
        ),
        headers: contentTypeJsonHeader,
      );
      if (response.statusCode == 200) {
        Map resp = json.decode(response.body);
        print(resp["Success"].toString());

        print(response.body);
      } else {
        throw AppException(code: response.statusCode, message: response.body);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> forgotPassword(
    String email,
  ) async {
    try {
      Response response = await post(
        forgotUri,
        body: jsonEncode(
          {
            'email': email,
          },
        ),
        headers: contentTypeJsonHeader,
      );

      if (response.statusCode == 200) {
        Map resp = json.decode(response.body);
        respOtp = resp["OTP"].toString();
        print("${respOtp} bvc");

        print(response.body);
      } else {
        throw AppException(code: response.statusCode, message: response.body);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<int> getOnboardingScreen(String id) async {
    try {
      Response response = await post(screenStat,
          body: jsonEncode(
            {
              'user': id,
            },
          ),
          headers: contentTypeJsonHeader);
      if (response.statusCode == 200) {
        Map data = jsonDecode(response.body);
        return data.entries.first.value as int;
      } else {
        throw AppException(code: response.statusCode, message: response.body);
      }
    } catch (e) {
      rethrow;
    }
  }
}
