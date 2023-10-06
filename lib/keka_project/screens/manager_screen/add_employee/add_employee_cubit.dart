import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:finaldemo/keka_project/model/department_model/department_model.dart';
import 'package:finaldemo/keka_project/model/login_details/login_details.dart';
import 'package:finaldemo/keka_project/screens/employee_screen/employee_screen_login/sharedpref.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'add_employee_state.dart';

class AddEmployeeCubit extends Cubit<AddEmployeeState> {
  AddEmployeeCubit(this.context, super.initialState);

  final BuildContext context;
  String baseurl = "https://cd97-136-232-118-126.ngrok-free.app";

  void visibility() {
    emit(state.copyWith(iconShowHide: !state.iconShowHide));
  }

  void dateTime(context) async {
    DateTime currentDate = DateTime.now();
    DateTime eighteenYearsAgo = currentDate.subtract(Duration(days: 365 * 18));
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: eighteenYearsAgo,
      firstDate: DateTime(1900),
      lastDate: currentDate,
    );

    if (pickedDate != null) {
      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
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
      "$baseurl/api/user",
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
    // Navigator.of(context).pop(true);

    submit();
    // Navigator.of(context).pop(true);

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
    print("UserId=============UserId==========UserId=======UserId========UserId===${state.loginData?.id}");

    final response = await Dio().put(
      "$baseurl/api/user/${state.loginData?.id ?? ""}",
      data: data,
      options: Options(
        contentType: Headers.jsonContentType,
      ),
    );
    submit();
    // Navigator.of(context).pop(true);

    print("status code================${response.data}");
  }

  void submit() {
    final isValid = state.formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    Navigator.of(context).pop(true);
  }

  void getEmployeeDetails() async {
    print("GetEmp::::");
    final response = await Dio().get('$baseurl/api/login_details',
        options: Options(headers: {
          "authorization": "Bearer ${await Helper().getToken()}",
        }));
    if (response.statusCode == 200) {
      EmployeeLoginDetails employeeLoginDetails = EmployeeLoginDetails.fromJson(response.data);
      print(response.data);
      var selectedDepartment;

      if (state.role != 0) {
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
    final response = await Dio().get("$baseurl/api/department");
    var DepartmentListData = List<Department>.from([]);
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

  Future<void> getRole() async {
    var userRole = await Helper().getRole();
    print("object:::$userRole");
    emit(state.copyWith(role: userRole));
  }
}
