import 'package:shared_preferences/shared_preferences.dart';

class Helper {
  static String valueSharedPreferences = "userToken";
  static String roles = "roleName";

// save TOKEN
  Future<void> saveToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(valueSharedPreferences, token);
  }

// get TOKEN
  Future<String> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    final value = await prefs.getString(valueSharedPreferences) ?? '';
    return value;
  }

  //Remove TOKEN
  void remove() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(valueSharedPreferences);
  }

  Future<void> saveRole(int role) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setInt(roles, role);
  }

  Future<int> getRole() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    final value = await pref.getInt(roles) ?? 0;
    return value;
  }
}
