import 'package:dio/dio.dart';
import 'package:finaldemo/keka_project/common/const.dart';
import 'package:finaldemo/keka_project/model/get_api_model/get_api_model.dart';
import 'package:finaldemo/keka_project/screens/employee_screen/employee_screen_login/sharedpref.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'add_leave_state.dart';

class AddLeaveCubit extends Cubit<AddLeaveState> {
  AddLeaveCubit(this.context, super.initialState);

  final BuildContext context;
  String baseurl = "https://cd97-136-232-118-126.ngrok-free.app";

  void dateTimePicker() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (pickedDate != null) {
      String formattedDate = DateFormat("yyyy-MM-dd").format(pickedDate);
      state.dateController.text = formattedDate;
    }
    emit(state.copyWith(
      dateController: state.dateController,
    ));
  }

  void datePicker() async {
    DateTime? pickedDate2 = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (pickedDate2 != null) {
      String formattedDate2 = DateFormat("yyyy-MM-dd").format(pickedDate2);

      state.dateTimeController.text = formattedDate2;
    }
    emit(state.copyWith(dateTimeController: state.dateTimeController));
  }

  void notifyEmp(String query) {
    List<Employee> employeeList = List<Employee>.from(state.employeeList);
    employeeList = employeeList.where((e) => e.name.contains(query) || e.email.contains(query)).toList();

    emit(state.copyWith(filtterdUserList: employeeList));
  }

  void validation(context) {
    if (state.dateController.text.isEmpty ||
        state.dateTimeController.text.isEmpty ||
        state.reasonController.text.isEmpty) {
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
            textScaleFactor: 1.2,
            textAlign: TextAlign.center,
          ),
        ),
      );
    } else {
      DateTime startDate = DateFormat("yyyy-MM-dd").parse(state.dateController.text);
      DateTime endDate = DateFormat("yyyy-MM-dd").parse(state.dateTimeController.text);
      if (startDate.isAfter(endDate)) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            duration: Duration(seconds: 1),
            padding: EdgeInsets.all(3),
            backgroundColor: Colors.red,
            content: Text(
              "Please fill valid dates",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
              textScaleFactor: 1.2,
              textAlign: TextAlign.center,
            ),
          ),
        );
      } else {
        navigateToManagerLeave(context);
      }
    }
  }

  void notifyEmployee(Employee employeeData) {
    clearSearch(
      employeeData: employeeData,
    );
  }

  void clearSearch({Employee? employeeData}) {
    state.searchController.clear();
    if (employeeData != null) {
      emit(state.copyWith(notifyEmployee: [employeeData]));
    } else {
      emit(state.copyWith(notifyEmployee: []));
    }
  }

  void getNotifyEmployee() async {
    final response = await Dio().get("$baseurl/api/user");
    var notifyEmployee = List<Employee>.from(state.notifyEmployee);
    if (response.statusCode == 200) {
      var data = response.data;
      for (var entry in data) {
        notifyEmployee.add(Employee.fromJson(entry));
      }
    } else {
      Text("No-data");
    }
    emit(state.copyWith(employeeList: notifyEmployee, filtterdUserList: notifyEmployee));
  }

  void getLoginDetails() async {
    try {
      final response = await Dio().get(
        "$baseurl/api/login_details",
        options: Options(headers: {
          "authorization": "Bearer ${await Helper().getToken()}",
        }),
      );
      if (response.statusCode == 200) {
        var data = response.data;
        emit(state.copyWith(
          name: data["name"],
          id: data["id"],
        ));
        print("getLoginDetails::${state.name}");
        print("getLoginId::${state.id}");
      } else {
        Text("No-Data");
      }
    } on Exception catch (e) {
      print("error => ${e}");
    }
  }

  Future postAddLeave(String is_role, String start_date, String end_date, String reason, int? user_id) async {
    var data = {
      "is_role": is_role,
      "start_date": start_date,
      "end_date": end_date,
      "reason": reason,
      "user_id": user_id,
    };
    print("==================================ManagerAddLeave$data");
    var response = await Dio().post(
      "$baseurl/api/add_leave",
      data: data,
      options: Options(headers: {"Accept": "application/json"}),
    );

    print("status code================${response.statusCode}");
  }

  void navigateToManagerLeave(context) {
    Navigator.of(context).pop();
  }
}
