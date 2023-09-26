import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:finaldemo/keka_project/screens/employee_screen/employee_screen_login/shardpref.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'employee_login_state.dart';

class EmployeeLoginCubit extends Cubit<EmployeeLoginState> {
  EmployeeLoginCubit(super.initialState);

  void visibility() {
    emit(state.copyWith(iconShowHide: !state.iconShowHide));
  }

  void validation(context) {
    if (state.emailController.text.toString().isEmpty || state.passwordController.text.toString().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          duration: Duration(seconds: 1),
          padding: EdgeInsets.all(3),
          backgroundColor: Colors.red,
          content: Text(
            "Please fill all the fields",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
            textScaleFactor: 1.3,
            textAlign: TextAlign.center,
          ),
        ),
      );
    }
  }

  Future loginPostDio(String email, String password) async {
    await SharedPreferences.getInstance();
    Map<String,dynamic> data = {
      "email": email,
      "password": password,
    };
    print("Login Data =====${data}");
    var response = await Dio().post(
      "https://e3e8-136-232-118-126.ngrok-free.app/api/login",
      data: data,
      options: Options(
        headers: {
          HttpHeaders.authorizationHeader: "Bearer",
        },
        contentType: Headers.jsonContentType,
      ),
    );
    Helper().saveToken(response.data["token"]);
    // UserPreferences().setToken(response.data["token"]);
    print("token================${response.data["token"]}");

    return null;
    // return response;
  }

// Future<void> onLogIn(context) async {
//   await loginPostDio(state.emailController.text, state.passwordController.text).then(
//     (v) {
//       if (v["token"] == null) {
//         UserPreferences().setToken(v["token"]);
//         // print(v["token"]);
//         showDialog(
//           context: context,
//           builder: (context) => AlertDialog(
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(20),
//             ),
//             alignment: Alignment.bottomCenter,
//             title: Text(v["message"]),
//             actions: [
//               TextButton(
//                 onPressed: () => Navigator.pop(context),
//                 child: const Text("Oky"),
//               ),
//             ],
//           ),
//         );
//       } else {
//         Navigator.of(context).pushNamed(
//           '/Employee_Screen_View',
//           // (route) => false,
//         );
//       }
//     },
//   );
// }
}
