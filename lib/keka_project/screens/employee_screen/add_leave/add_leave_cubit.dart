import 'package:finaldemo/keka_project/model/employee_model/employee_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'add_leave_state.dart';

class AddLeaveCubit extends Cubit<AddLeaveState> {
  AddLeaveCubit()
      : super(
          AddLeaveState(
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
    List<EmployeeData> employeeList = List<EmployeeData>.from(state.employeeList);
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
        state.reasonController.text.isEmpty
    ) {
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

  void notifyEmployee(EmployeeData employeeData) {
    clearSearch(employeeData: employeeData);
  }

  void clearSearch({EmployeeData? employeeData}) {
    state.searchController.clear();
    if (employeeData != null) {
      emit(state.copyWith(notifyEmployee: [employeeData]));
    } else {
      emit(state.copyWith(notifyEmployee: []));
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
