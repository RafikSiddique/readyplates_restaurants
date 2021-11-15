import 'package:get/get.dart';
import 'package:readyplates_restaurants/utils/exception.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceHelper {
  final String _isLoggedIn = "loggedin";
  final String _userId = "userId";
  final String _resId = "resId";
  final String _onBoardingNumber = "onboarding";
  // final String _restaurantName = "resName";
  Future<bool> setUserId(String id) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    bool success = await sharedPreferences.setString(_userId, id);
    return success;
  }

  Future<String?> getUserId() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? id = sharedPreferences.getString(_userId);
    return id;
  }

  Future<bool> setRestaurantId(String resId) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    bool success = await sharedPreferences.setString(_resId, resId);
    return success;
  }

  Future<String> getRestaurantId() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? resId = sharedPreferences.getString(_resId);
    if (resId == null) {
      throw AppException(message: "No such user found", code: 100);
    } else
      return resId;
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

  Future<bool> setOnBoarding(int screen) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    bool? success = await sharedPreferences.setInt(_onBoardingNumber, screen);
    return success;
  }

  Future<int> getOnboarding() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    int? screen = sharedPreferences.getInt(_onBoardingNumber);
    screen ??= 1;
    return screen;
  }

/*   Future<bool> setRestaurantName(String name) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    bool success = await sharedPreferences.setString(_restaurantName, name);
    return success;
  }

  Future<String> getRestaurantName() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? success = sharedPreferences.getString(_restaurantName);
    if (success != null) {
      return success;
    } else {
      throw AppException(message: "Restaurant Name not found");
    }
  } */

  Future<void> clear() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.clear();
  }
}
