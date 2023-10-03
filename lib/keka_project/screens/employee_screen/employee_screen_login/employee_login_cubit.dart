import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:finaldemo/keka_project/screens/employee_screen/employee_screen_login/sharedpref.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'employee_login_state.dart';

class EmployeeLoginCubit extends Cubit<EmployeeLoginState> {
  EmployeeLoginCubit(super.initialState);

  String baseurl = "https://1f35-136-232-118-126.ngrok-free.app";

  void visibility() {
    emit(state.copyWith(iconShowHide: !state.iconShowHide));
  }

  Future loginPostDio(String email, String password) async {
    Response? response;
    await SharedPreferences.getInstance();
    Map<String, dynamic> data = {
      "email": email,
      "password": password,
    };
    print("Login Data =====${data}");
    try {
      response = await Dio().post(
        "$baseurl/api/login",
        data: data,
        options: Options(
          headers: {
            HttpHeaders.authorizationHeader: "Bearer",
          },
          contentType: Headers.jsonContentType,
        ),
      );
      Helper().saveToken(response.data["token"]);
      print("token================${response.data["token"]}");
      return response.data;
    } on DioException catch (e) {
      print("object::${e.response}");
      return e;
    }
  }
}
