import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:finaldemo/keka_project/model/department_model/department_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'add_employee_state.dart';

class AddEmployeeCubit extends Cubit<AddEmployeeState> {
  AddEmployeeCubit(AddEmployeeState addEmployeeState)
      : super(AddEmployeeState(
          dateController: TextEditingController(),
          emailController: TextEditingController(),
          nameController: TextEditingController(),
          mobileController: TextEditingController(),
          passwordController: TextEditingController(),
          roleController: TextEditingController(),
          locationController: TextEditingController(),
          // token: dynamic,
          // departmentList: depList,
        ));

  void visibility() {
    emit(state.copyWith(iconShowHide: !state.iconShowHide));
  }

  void dateTime(context) async {
    DateTime? pikedDate = await showDatePicker(
        context: context, initialDate: DateTime.now(), firstDate: DateTime(2000), lastDate: DateTime(2025));

    if (pikedDate != null) {
      String formattedDate = DateFormat('yyyy-MM-dd').format(pikedDate);
      state.dateController.text = formattedDate;
    }
    emit(state.copyWith(dateController: state.dateController));
  }

  // Future dioPostApi() async {
  //   var response = await Dio().post(
  //     'https://5479-136-232-118-126.ngrok-free.app/api/user',
  //     data: {
  //       'name': state.nameController,
  //       'role': state.roleController,
  //       'location': state.locationController,
  //       'email': state.emailController,
  //       'password': state.passwordController,
  //       'mobile_no': state.mobileController,
  //       'department_id': state.selectedValue,
  //       'birth_date': state.dateController,
  //     },
  //     options: Options(
  //         headers: {"Accept": "application/json"},
  //         followRedirects: false,
  //         validateStatus: (status) {
  //           return status! < 500;
  //         }),
  //   );
  //   if (response.statusCode == 200) {
  //     var login = response.data;
  //     print("Status code======${response.statusCode}");
  //
  //     debugPrint("=========================${login["token"]}");
  //     state.token = login["token"];
  //     debugPrint('Login successfully');
  //   } else {
  //     debugPrint('failed');
  //   }
  // }

  Future AddEmployeePost(String name, String role, String email, String location, String password, String department,
      String mo_number, String birthdate) async {
    // final prefs = await SharedPreferences.getInstance();
    // debugPrint("pref====${prefs.getString('Token')}");

    var data =  {
      "name": name,
      "role": role,
      "location": location,
      "email": email,
      "password": password,
      "mobile_no": mo_number,
      "department_id": department,
      "birth_date": birthdate,
    };
 print(data);
    var response = await Dio().post(
      " https://e3e8-136-232-118-126.ngrok-free.app/api/user",
      data: data,
      options: Options(
        contentType: Headers.jsonContentType,
      ),

    );
    print("status code================${response.statusCode}");
    // switch (response.statusCode) {
    //   case 200:
    //     var responseJson = response.data;
    //     return responseJson;
    //   case 400: //Bad request
    //     throw response.data;
    //   case 401: //Unauthorized
    //     throw response.data;
    //   case 403: //Forbidden
    //     throw response.data;
    //   case 404: //Resource Not Found
    //     throw response.data;
    //   case 500: //Internal Server Error
    //   default:
    //     throw ('Something went wrong! ${response.statusCode}');
    // }
  }

  // Future<void> onLogIn() async {
  //   await ApiCallRepository().loginPostDio(state.emailController.text, state.passwordController.text).then(
  //         (v) {
  //       if (v["code"] == 0) {
  //         UserPreferences().setToken(v["data"]["Token"]);
  //         Navigator.of(context).pushNamed(
  //           '/mainView',
  //           // (route) => false,
  //         );
  //       } else {
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
  //       }
  //     },
  //   );
  // }

  void validation(context) {
    if (state.nameController.text.isEmpty ||
        state.emailController.text.isEmpty ||
        state.passwordController.text.isEmpty ||
        state.selectedValue.toString().isEmpty ||
        state.mobileController.text.isEmpty ||
        state.dateController.text.isEmpty) {
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

  void getDepartmentApi() async {
    final response = await Dio().get(" https://e3e8-136-232-118-126.ngrok-free.app/api/department");
    var DepartmentListData = List<Department>.from(state.departmentList);
    if (response.statusCode == 200) {
      var data = response.data;
      for (var entry in data) {
        DepartmentListData.add(Department.fromJson(entry));
      }
    } else {
      Text("No-Data");
    }
    emit(state.copyWith(departmentList: DepartmentListData));
  }

  void dropdownSelected(Department value) {
    List<Department> department = List<Department>.from(state.departmentList);
    emit(state.copyWith(departmentList: department, selectedValue: value));
  }

  String formatDate(DateTime date) {
    final formatter = DateFormat('d MMMM, y', 'en_US');
    return formatter.format(date);
  }
}
