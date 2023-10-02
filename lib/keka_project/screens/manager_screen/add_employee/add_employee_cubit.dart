import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:finaldemo/keka_project/common/const.dart';
import 'package:finaldemo/keka_project/model/department_model/department_model.dart';
import 'package:finaldemo/keka_project/model/login_details/login_details.dart';
import 'package:finaldemo/keka_project/screens/employee_screen/employee_screen_login/shardpref.dart';
import 'package:finaldemo/keka_project/screens/manager_screen/employee_details/employee_details_view.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'add_employee_state.dart';

class AddEmployeeCubit extends Cubit<AddEmployeeState> {
  AddEmployeeCubit(this.context, super.initialState);

  final BuildContext context;

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

  Future<void> postEmployeeDetails(String name, String role, String email, String location, String password,
      String department, String mo_number, String birthdate) async {
    var data = {
      "name": name,
      "role": role,
      "location": location,
      "email": email,
      "password": password,
      "mobile_no": mo_number,
      "department_id": department,
      "birth_date": birthdate,
    };

    var response = await Dio().post(
      "https://19d1-136-232-118-126.ngrok-free.app/api/user",
      data: data,
      options: Options(
        headers: {"Accept": "application/json"},
        followRedirects: false,
        maxRedirects: 0,
        validateStatus: (status) => status! < 500,
        contentType: Headers.jsonContentType,
      ),
    );
    debugPrint("response ::${response.statusCode}");
    navigatorToEmployee(context);
    print("status code================${response.statusCode}");
  }

  Future updateEmployeeDetails(
      String name, String role, String location, String email, String number, String departmentId, String date) async {
    var data = {
      "name": name,
      "role": role,
      "location": location,
      "email": email,
      "mobile_no": number,
      "department_id": departmentId,
      "birth_date": date,
    };
    print("updateData::$data");
    final response = await Dio().put(
      "https://19d1-136-232-118-126.ngrok-free.app/api/user/${state.loginData?.id??""}",
      data: data,
      options: Options(
        contentType: Headers.jsonContentType,
      ),
    );
    navigatorToEmployee(context);
    print("status code================${response.data}");
  }

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

  void getEmployeeDetails() async {
    final response = await Dio().get('https://19d1-136-232-118-126.ngrok-free.app/api/login_details',
        options: Options(headers: {
          "authorization": "Bearer ${await Helper().getToken()}",
        }));
    if (response.statusCode == 200) {
      EmployeeLoginDetails employeeLoginDetails = EmployeeLoginDetails.fromJson(response.data);
      print(response.data);
      var selectedDepartment;

      if (state.profile == Profile.employee) {
        state.nameController.text = employeeLoginDetails.name;
        state.roleController.text = employeeLoginDetails.role.toString();
        state.emailController.text = employeeLoginDetails.email;
        state.locationController.text = employeeLoginDetails.location;
        state.mobileController.text = employeeLoginDetails.mobileNo;
        state.dateController.text = employeeLoginDetails.birthDate;
        selectedDepartment =
            state.departmentList.where((element) => element.id == employeeLoginDetails.departmentId).firstOrNull;
        debugPrint(employeeLoginDetails.name);
        debugPrint(employeeLoginDetails.role);
        debugPrint(employeeLoginDetails.email);
        debugPrint(employeeLoginDetails.location);
        debugPrint(employeeLoginDetails.mobileNo);
        debugPrint(employeeLoginDetails.birthDate);
      }

      emit(state.copyWith(
        loginData: employeeLoginDetails,
        selectedValue: selectedDepartment,
      ));
      debugPrint("data:::::${employeeLoginDetails.departmentId}");
    } else {
      throw Exception('Data Not Available');
    }
  }

  void getDepartmentApi() async {
    final response = await Dio().get("https://19d1-136-232-118-126.ngrok-free.app/api/department");
    var DepartmentListData = List<Department>.from(state.departmentList);
    if (response.statusCode == 200) {
      getEmployeeDetails();
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

  void navigatorToEmployee(context) {
    Navigator.of(context).pop();
  }
}
