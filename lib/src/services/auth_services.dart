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
        loginUri,
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

  // Future<bool> uploadImage(File file) async {
  //   try {
  //     String id = await sharedPreferenceHelper.getUserId();
  //     http.MultipartRequest request = http.MultipartRequest('POST', image);
  //     request.fields.addAll({"id": id});
  //     http.MultipartFile multipartFile =
  //         await http.MultipartFile.fromPath('image', file.path);
  //     request.files.add(multipartFile);
  //     http.StreamedResponse response = await request.send();
  //     if (response.statusCode == 200) {
  //       print("success");
  //       String body = await response.stream.bytesToString();
  //       print(body);
  //       return true;
  //     } else {
  //       throw AppException(
  //           code: response.statusCode, message: response.reasonPhrase);
  //     }
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

}
