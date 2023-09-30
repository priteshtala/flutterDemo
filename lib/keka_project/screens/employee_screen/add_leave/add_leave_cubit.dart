import 'package:dio/dio.dart';
import 'package:finaldemo/keka_project/common/const.dart';
import 'package:finaldemo/keka_project/model/get_api_model/get_api_model.dart';
import 'package:finaldemo/keka_project/screens/employee_screen/add_leave/add_leave_view.dart';
import 'package:finaldemo/keka_project/screens/manager_screen/manager_leave/manager_leave_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'add_leave_state.dart';

class AddLeaveCubit extends Cubit<AddLeaveState> {
  AddLeaveCubit(super.initialState);


  void dateTimePicker(context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (pickedDate != null) {
      // String formattedDate = DateFormat.yMMMMd('en_US').format(pickedDate);
      String formattedDate = DateFormat("yyyy-MM-dd").format(pickedDate);
      state.dateController.text = formattedDate;
    }
    emit(state.copyWith(
      dateController: state.dateController,
    ));
  }

  void datePicker(context) async {
    DateTime? pickedDate2 = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (pickedDate2 != null) {
      // String formattedDate2 = DateFormat.yMMMMd('en_US').format(pickedDate2);
      String formattedDate2 = DateFormat("yyyy-MM-dd").format(pickedDate2);

      state.dateTimeController.text = formattedDate2;
    }
    emit(state.copyWith(dateTimeController: state.dateTimeController));
  }

  void notifyEmp(String query) {
    List<Employee> employeeList = List<Employee>.from(state.employeeList);
    employeeList = employeeList
        .where((e) =>
            e.name.toLowerCase().contains(query.toLowerCase()) || e.email.toLowerCase().contains(query.toLowerCase()))
        .toList();

    emit(state.copyWith(filtterdUserList: employeeList));
  }

  void validation(context) {
    if (state.notifyEmployee.isEmpty ||
        state.dateController.text.isEmpty ||
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
            textScaleFactor: 1.3,
            textAlign: TextAlign.center,
          ),
        ),
      );
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
    final response = await Dio().get("https://c0db-136-232-118-126.ngrok-free.app/api/user");
    var notifyEmployee = List<Employee>.from(state.notifyEmployee);
    if (response.statusCode == 200) {
      var data = response.data;
      for (var entry in data) {
        // print(data);

        notifyEmployee.add(Employee.fromJson(entry));
      }
    } else {
      Text("No-data");
    }
    emit(state.copyWith(employeeList: notifyEmployee, filtterdUserList: notifyEmployee));
  }

  Future ManagerAddLeave(String start_date, String end_date, String reason,int? is_role) async {
    // final prefs = await SharedPreferences.getInstance();
    // debugPrint("pref====${prefs.getString('Token')}");
    var data = {
      "start_date": start_date,
      "end_date": end_date,
      "reason": reason,
      "user_id": state.filtterdUserList.map((e) => e.id).toList().first,
    };
    print("==================================ManagerAddLeave$data");
    var response = await Dio().post(
      "https://c0db-136-232-118-126.ngrok-free.app/api/add_leave?is_role=1",
      data: data,
      queryParameters: {
        "is_role" : is_role
      },
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

  void navigateToManagerLeave(context) {
    Navigator.of(context).pushNamed(ManagerLeaveView.routeName,arguments: Profile.manager);
  }
}
