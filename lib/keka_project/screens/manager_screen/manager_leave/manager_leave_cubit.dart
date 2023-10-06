import 'package:dio/dio.dart';
import 'package:finaldemo/keka_project/model/date_by_leave_model/date_by_leave_model.dart';
import 'package:finaldemo/keka_project/model/leave_today_model/leave_today_model.dart';
import 'package:finaldemo/keka_project/screens/employee_screen/add_leave/add_leave_view.dart';
import 'package:finaldemo/keka_project/screens/employee_screen/employee_screen_login/sharedpref.dart';
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

  String baseurl = "https://cd97-136-232-118-126.ngrok-free.app";

  void employeeCount() async {
    final response = await Dio().get("$baseurl/api/count_user");
    if (response.statusCode == 200) {
      var data = response.data;
      emit(state.copyWith(employeeCount: data["total"]));
    } else {
      Text("No-Data");
    }
  }

  void departmentCount() async {
    final response = await Dio().get("$baseurl/api/count_department");
    if (response.statusCode == 200) {
      var data = response.data;
      emit(state.copyWith(departmentCount: data["total"]));
    } else {
      Text("No-Data");
    }
  }

  dateTime(context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );

    if (pickedDate != null) {
      String formattedDate = DateFormat("yyyy-MM-dd").format(pickedDate);
      state.dateController.text = formattedDate;
      getLeaveByDate(formattedDate);
      debugPrint("================FormattedDate${state.dateController}");
    }
    emit(state.copyWith(
      dateController: state.dateController,
    ));
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
                    if (state.role == 0) {
                      Navigator.of(context).pushReplacementNamed(MainScreenView.routeName);
                    } else {
                      Helper().remove();
                      Navigator.of(context).pushReplacementNamed(MainScreenView.routeName);
                    }
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
    final response = await Dio().get('$baseurl/api/today_leave_user');
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

  void getLeaveByDate(String? date) async {
    final response = await Dio().get(
      '$baseurl/api/filter_leave_date',
      data: {"date": date},
    );
    var leaveByDateData = List<DateByLeave>.from([]);
    var data = response.data;
    if (response.statusCode == 200) {
      if (data != null) {
        for (var entryJson in data) {
          leaveByDateData.add(DateByLeave.fromJson(entryJson));
        }
      }
    } else {
      throw Exception('Data Not Available');
    }

    emit(state.copyWith(leaveByDateList: leaveByDateData));
    print(leaveByDateData.length);
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
        var data = response.data["name"];
        emit(state.copyWith(
          name: data,
        ));
        print("getLoginDetails::${state.name}");
      } else {
        Text("No-Data");
      }
    } on Exception catch (e) {
      print("error => ${e}");
    }
  }

  refresh() {
    var refresh = state.hasError = false;
    state.leaveTodayList.clear();
    emit(state.copyWith(hasError: refresh));
    return getLeaveToday();
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
    print("${userToken}");
  }

  Future<void> getRole() async {
    var userRole = await Helper().getRole();
    print("object:::$userRole");
    emit(state.copyWith(role: userRole));
    // print("${userToken}");
  }
}
