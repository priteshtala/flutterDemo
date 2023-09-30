import 'package:shared_preferences/shared_preferences.dart';

class Helper {
  static String valueSharedPreferences = "userToken";
  static String sharedPreferences = "leaveRequest";

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

  //Remove token

  void remove() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(valueSharedPreferences);
  }

  // save DATA
  Future<void> saveInt(int token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(sharedPreferences, token);
  }

// get Data
  getInt() async {
    final prefs = await SharedPreferences.getInstance();
    final value = await prefs.getInt(sharedPreferences) ?? '';
    return value;
  }

  //Remove token

  void removeInt() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(sharedPreferences);
  }
}
