import 'dart:convert';
// import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:readyplates_restaurants/utils/api_services.dart';
import 'package:readyplates_restaurants/utils/exception.dart';
import 'package:readyplates_restaurants/utils/shared_preference_helper.dart';

String uniqueId = '';

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
        uniqueId = id;
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
        onboarding1Uri,
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
        print('User Id is ---->' + uniqueId);
        print(response.body);
        return id;
      } else {
        throw AppException(code: response.statusCode, message: response.body);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<String> onboardingapi2(
    String user,
    String address,
    String postal_code,
    String latitude,
    String longitude,
  ) async {
    try {
      http.Response response = await http.post(
        onboarding2Uri,
        body: jsonEncode(
          {
            'user': user,
            'address': address,
            'postal_code': postal_code,
            'latitude': latitude,
            'longitude': longitude,
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
        print('User Id is ---->' + uniqueId);
        print(response.body);
        return id;
      } else {
        throw AppException(code: response.statusCode, message: response.body);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<String> onboardingapi3(
    String user,
    String gstin_present,
    String gstin_num,
    String fssai_status,
    String fssai_expiry,
    String kyc_image,
    String gstin_image,
    String fssai_image,
  ) async {
    /* ('user','gstin_present','gstin_num','fssai_status','fssai_expiry','kyc_image','gstin_image','fssai_image') */
    try {
      http.Response response = await http.post(
        onboarding3Uri,
        body: jsonEncode(
          {
            'user': user,
            'gstin_present': gstin_present,
            'gstin_num': gstin_num,
            'fssai_status': fssai_status,
            'fssai_expiry': fssai_expiry,
            'kyc_image': kyc_image,
            'gstin_image': gstin_image,
            'fssai_image': fssai_image,
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
        print('User Id is ---->' + uniqueId);
        print(response.body);
        return id;
      } else {
        throw AppException(code: response.statusCode, message: response.body);
      }
    } catch (e) {
      rethrow;
    }
  }
// Future<Onboarding1?> onboardingapi1(
//     String user,
//     String res_name,
//     String own_name,
//     String own_mobile,
//     String res_city,
//     String poc,
//     String poc_number,
//   ) async {
//     http.Response response;
//     response = await http.post(
//       Uri.parse('https://readyplates.herokuapp.com/restaurants/s1/'),
//       body: jsonEncode({
//         'user': user,
//         'res_name': res_name,
//         'own_name': own_name,
//         'own_mobile': own_mobile,
//         'res_city': res_city,
//         'poc': poc,
//         'poc_number': poc_number,
//       }),
//       headers: {
//         'Content-Type': 'application/json; charset=UTF-8',
//       },
//     );
//     if (response.statusCode == 201) {
//       print('object');
//       print(response.body);
//     } else {
//       throw Exception('Failed to create User.');
//     }
//   }

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
