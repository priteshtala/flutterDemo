import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
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
          token: dynamic,
          // departmentList: depList,
        ));

  void visibility() {
    emit(state.copyWith(iconShowHide: !state.iconShowHide));
  }

  void dateTime(context) async {
    DateTime? pikedDate = await showDatePicker(
        context: context, initialDate: DateTime.now(), firstDate: DateTime(2000), lastDate: DateTime(2025));

    if (pikedDate != null) {
      String formattedDate = DateFormat.yMMMMd('en_US').format(pikedDate);
      state.dateController.text = formattedDate;
    }
    emit(state.copyWith(dateController: state.dateController));
  }

  Future dioPostApi(String name, String role, String location, String email, String password, String mobile_no,
      String department_id, String birth_date) async {
    try {
      var response = await Dio().post(
        'https://89bd-136-232-118-126.ngrok-free.app/api/user',
        data: {
          'name': name,
          'role': role,
          'location': location,
          'email': email,
          'password': password,
          'mobile_no': mobile_no,
          'department_id': department_id,
          'birth_date': birth_date,
        },
      );

      if (response.statusCode == 200) {
        var login = response.data;
        debugPrint("=========================${login["token"]}");
        state.token = login["token"];
        debugPrint('Login successfully');
      } else {
        debugPrint('failed');
      }
    } catch (e) {
      debugPrint("Data Failed");
    }
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
}

// List<Department> depList = [
//   Department(department: "All"),
//   Department(department: "Flutter"),
//   Department(department: "Android"),
//   Department(department: "Laravel"),
//   Department(department: "PHP"),
//   Department(department: "NodeJs"),
//   Department(department: "IOS"),
//   Department(department: "ReactJS"),
// ];
