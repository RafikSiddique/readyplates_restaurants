import 'package:readyplates_restaurants/utils/exception.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceHelper {
  final String _isLoggedIn = "loggedin";
  final String _userId = "userId";

  Future<bool> setUserId(String id) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    bool success = await sharedPreferences.setString(_userId, id);
    return success;
  }

  Future<String> getUserId() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? id = sharedPreferences.getString(_userId);
    if (id == null) {
      throw AppException(message: "No such user found");
    } else
      return id;
  }

  Future<bool> setLoggedIn(bool loggedIn) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    bool success = await sharedPreferences.setBool(_isLoggedIn, loggedIn);
    return success;
  }

  Future<bool> getLoggedIn() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    bool? success = sharedPreferences.getBool(_isLoggedIn);
    if (success == null) {
      return false;
    } else {
      return success;
    }
  }
}
