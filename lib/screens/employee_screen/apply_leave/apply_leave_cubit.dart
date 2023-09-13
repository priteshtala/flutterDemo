import 'package:finaldemo/keka_project/model/employee_model/employee_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'apply_leave_state.dart';

class ApplyLeaveCubit extends Cubit<ApplyLeaveState> {
  ApplyLeaveCubit()
      : super(
          ApplyLeaveState(
            dateController: TextEditingController(),
            dateTimeController: TextEditingController(),
            reasonController: TextEditingController(),
            searchController: TextEditingController(),
            employeeList: empList,
            filtterdUserList: empList,
          ),
        );

  void dateTimePicker(context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (pickedDate != null) {
      String formattedDate = DateFormat.yMMMMd('en_US').format(pickedDate);
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
      String formattedDate2 = DateFormat.yMMMMd('en_US').format(pickedDate2);
      state.dateTimeController.text = formattedDate2;
    }
    emit(state.copyWith(dateTimeController: state.dateTimeController));
  }

  void notifyEmp(String query) {
    // List<EmployeeData> employeeList = List<EmployeeData>.from(state.employeeList);
    List<EmployeeData> employeeList = state.employeeList
        .where((e) =>
            e.name.toLowerCase().contains(query.toLowerCase()) || e.email.toLowerCase().contains(query.toLowerCase()))
        .toList();

    emit(state.copyWith(filtterdUserList: employeeList));
    // debugPrint("============================$employeeList");
  }

  void setSelectedEmployee(EmployeeData employeeData) {
    clearSearch(employeeData: employeeData);
  }

  void clearSearch({EmployeeData? employeeData}) {
    state.searchController.text = '';
    if (employeeData != null) {
      emit(state.copyWith(setSelectedEmployee: [employeeData], employeeList: [], isSearch: false));
    } else {
      // emit(state.copyWith(setSelectedEmployee: [], employeeList: null, isSearch: true));
    }
  }
}

List<EmployeeData> empList = [
  EmployeeData(
    name: "Pritesh Dineshbhai Tala",
    role: "Flutter trainee",
    location: "Katargam",
    department: "Android/Flutter",
    email: "pritesh.t@elaunchinfotech.in",
    number: "9510670968",
  ),
  EmployeeData(
    name: "Devang Vijaybhai Sabalpara",
    role: "Flutter trainee",
    location: "Katargam",
    department: "Android/Flutter",
    email: "devang.s@elaunchinfotech.in",
    number: "7777947638",
  ),
  EmployeeData(
    name: "Deep Jitendrabhai Vaghani",
    role: "jr.Flutter Developer",
    location: "Katargam",
    department: "Android/Flutter",
    email: "deep.v@elaunchinfotech.in",
    number: "7041454545",
  ),
  EmployeeData(
    name: "Nensi Dineshbhai Tala",
    role: "PHP/React-js",
    location: "Katargam",
    department: "IOS",
    email: "pritesh.t@elaunchinfotech.in",
    number: "95106 70968",
  ),
  EmployeeData(
    name: "Kuldeep Ghoghari Devangbhai",
    role: "Flutter trainee",
    location: "Katargam",
    department: "Android/Flutter",
    email: "kuldeep.g@elaunchinfotech.in",
    number: "7542541245",
  ),
  EmployeeData(
    name: "Pritesh DineshBhai Tala",
    role: "Flutter trainee",
    location: "Katargam",
    department: "PHP",
    email: "pritesh.t@elaunchinfotech.in",
    number: "9510670968",
  ),
];
