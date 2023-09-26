import 'package:dio/dio.dart';
import 'package:finaldemo/keka_project/model/leave_today_model/leave_today_model.dart';
import 'package:finaldemo/keka_project/model/login_details/login_details.dart';
import 'package:finaldemo/keka_project/screens/employee_screen/add_leave/add_leave_view.dart';
import 'package:finaldemo/keka_project/screens/employee_screen/employee_screen_login/shardpref.dart';
import 'package:finaldemo/keka_project/screens/main_screen/main_screen_view.dart';
import 'package:finaldemo/keka_project/screens/manager_screen/add_employee/add_employee_view.dart';
import 'package:finaldemo/keka_project/screens/manager_screen/department_details/department_details_view.dart';
import 'package:finaldemo/keka_project/screens/manager_screen/employee_details/employee_details_view.dart';
import 'package:finaldemo/keka_project/screens/manager_screen/manager_leave_request/manager_leave_request_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import 'manager_leave_state.dart';

class ManagerScreenCubit extends Cubit<ManagerScreenState> {
  ManagerScreenCubit(super.initialState);

  void employeeCount() async {
    final response = await Dio().get("https://e3e8-136-232-118-126.ngrok-free.app/api/count_user");
    if (response.statusCode == 200) {
      var data = response.data;
      // print("employeeCount:: $data");
      emit(state.copyWith(employeeCount: data["total"]));
    } else {
      Text("No-Data");
    }
  }

  void departmentCount() async {
    final response = await Dio().get("https://e3e8-136-232-118-126.ngrok-free.app/api/count_department");
    if (response.statusCode == 200) {
      var data = response.data;
      // print("departmentCount:: $data");
      emit(state.copyWith(departmentCount: data["total"]));
    } else {
      Text("No-Data");
    }
  }

  void dateTime(context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );

    if (pickedDate != null) {
      String formattedDate = DateFormat("yyyy-MM-dd").format(pickedDate);
      state.dateController.text = formattedDate;
    } else {
      String formattedDate1 = DateFormat("yyyy-MM-dd").format(DateTime.now().subtract(const Duration(days: 1)));
      state.yesterdayDate = formattedDate1;
    }
    emit(state.copyWith(dateController: state.dateController));
  }

  alert(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          alignment: Alignment.center,
          title: const Text("Log Out?"),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MaterialButton(
                  splashColor: Colors.red,
                  shape: Border.all(color: Colors.black),
                  onPressed: () {
                    Helper().remove();
                    Navigator.of(context).pushReplacementNamed(MainScreenView.routeName);
                  },
                  child: const Text("Yes", style: TextStyle(color: Colors.red)),
                ),
                MaterialButton(
                  shape: Border.all(color: Colors.black),
                  onPressed: () => Navigator.pop(context),
                  child: const Text("No"),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  void getLeaveToday() async {
    final response = await Dio().get('https://e3e8-136-232-118-126.ngrok-free.app/api/today_leave_user');
    var leaveTodayData = List<TodayLeave>.from(state.leaveTodayList);
    if (response.statusCode == 200) {
      var data = response.data;
      for (var entryJson in data) {
        leaveTodayData.add(TodayLeave.fromJson(entryJson));
      }
    } else {
      throw Exception('Data Not Available');
    }
    emit(state.copyWith(leaveTodayList: leaveTodayData));
  }

  void getLeaveByDate() async {
    final response = await Dio().get('https://e3e8-136-232-118-126.ngrok-free.app/api/filter_leave_date');
    var leaveByDateData = List<TodayLeave>.from(state.leaveByDateList);
    if (response.statusCode == 200) {
      var data = response.data;
      for (var entryJson in data) {
        leaveByDateData.add(TodayLeave.fromJson(entryJson));
      }
    } else {
      throw Exception('Data Not Available');
    }
    emit(state.copyWith(leaveByDateList: leaveByDateData));
  }

  void departmentSearch(query) {
    List<TodayLeave> leaveList = List<TodayLeave>.from(state.dateList);
    leaveList = leaveList.where((element) => element.startDate.toString().contains(query.toLowerCase())).toList();
    emit(state.copyWith(leaveByDateList: leaveList,dateController: state.dateController));
    print('-------------------------LeaveList${state.dateList}');
  }

  // void runFilter(query) {
  //   List<TodayLeave> leaveList = List<TodayLeave>.from(state.dateList);
  //   leaveList = leaveList.where((element) => element.startDate.toString().contains(query.toLowerCase())).toList();
  //
  //   emit(state.copyWith(dateList: leaveList));
  // }

  // Future getEmployeeDetails() async {
  //   final response = await Dio().get('https://e3e8-136-232-118-126.ngrok-free.app/api/login_details');
  //   var leaveByDateData = List<EmployeeLoginDetails>.from(state.employeeDetails);
  //   if (response.statusCode == 200) {
  //     var data = response.data;
  //     print("employeeDetails::$data");
  //     for (var entryJson in data) {
  //       leaveByDateData.add(EmployeeLoginDetails.fromJson(entryJson));
  //     }
  //   } else {
  //     throw Exception('Data Not Available');
  //   }
  //   emit(state.copyWith(employeeDetails:  leaveByDateData));
  // }

  void getLoginDetails() async {
    final response = await Dio().get("https://e3e8-136-232-118-126.ngrok-free.app/api/login_details");
    if (response.statusCode == 200) {
      var data = response.data["name"];
      print("getLoginDetails::${response.data}");
      emit(state.copyWith(Name: data));
    } else {
      Text("No-Data");
    }
  }

  void navigateToDepartmentView(context) {
    Navigator.of(context).pushNamed(DepartmentDetailsView.routeName);
  }

  void navigateToApplyLeave(context) {
    Navigator.of(context).pushNamed(AddLeaveView.routeName);
  }

  void navigateToManagerRequest(context) {
    Navigator.of(context).pushNamed(ManagerLeaveRequest.routeName);
  }

  void navigateToEmployeeView(context) {
    Navigator.of(context).pushNamed(EmployeeDetailsView.routeName);
  }

  void navigateToEdit(context) {
    Navigator.of(context).pushNamed(AddEmployeeView.routeName);
  }

  Future<void> getToken() async {
    var userToken = await Helper().getToken();
  }
}
