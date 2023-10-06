import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Helper {
  static String valueSharedPreferences = "userToken";
  static String roles = "roleName";

//   final SharedPreferences _preferences;
//
//   Helper(this._preferences);
//
//   int get notificationLength => _preferences.getInt("roles") ?? 0;
//
// //
//   set notificationLength(int value) => _preferences.setInt("roles", value);

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

  // Remove TOKEN
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
    return pref.getInt(roles) ?? 0;
  }
}

// @lazySingleton
// class AppPreference {
//   final SharedPreferences _preference;
//
//   AppPreference(this._preference);
//
//   @preResolve
//   @factoryMethod
//   static Future<AppPreference> getInstance() {
//     return SharedPreferences.getInstance().then(AppPreference.new);
//   }
//
//   int get notificationLength => _preference.getInt("roles") ?? 0;
//
//   set notificationLength(int value) => _preference.setInt("roles", value);
//
//   // _setData(String key, Map<String, dynamic>? json) {
//   //   if (json == null || json.isEmpty) {
//   //     _preference.remove(key);
//   //     return;
//   //   }
//   //   _preference.setString(key, jsonEncode(json));
//   // }
//   //
//   // T? _getData<T extends Object>(String key, T Function(Map<String, dynamic> json) parser) {
//   //   if (_preference.containsKey(key)) {
//   //     var value = _preference.get(key);
//   //     if (value is String && value.isNotEmpty) {
//   //       return parser(jsonDecode(value));
//   //     }
//   //   }
//   //   return null;
//   // }
// }
