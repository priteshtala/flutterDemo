import 'package:shared_preferences/shared_preferences.dart';

class Helper {
  static String valueSharedPreferences = "userToken";

// save DATA
  Future<void> saveToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(valueSharedPreferences, token);
  }

// get Data
  Future<String> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    final value = await prefs.getString(valueSharedPreferences) ?? '';
    return value;
  }
}
