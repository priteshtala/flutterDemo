import 'package:bloc/bloc.dart';
import 'package:finaldemo/keka_project/model/department_model/department_model.dart';
import 'package:finaldemo/keka_project/model/employee_model/employee_model.dart';
import 'package:flutter/cupertino.dart';

import 'employee_details_state.dart';

class EmployeeDetailsCubit extends Cubit<EmployeeDetailsState> {
  EmployeeDetailsCubit()
      : super(
          EmployeeDetailsState(
            searchController: TextEditingController(),
            departmentList: [
              Department(department: "All"),
              Department(department: "Flutter"),
              Department(department: "Android"),
              Department(department: "Laravel"),
              Department(department: "PHP"),
              Department(department: "NodeJs"),
              Department(department: "IOS"),
              Department(department: "ReactJS"),
            ],
            employeeList: empList,
            filtterdUserList: empList,
          ),
        );

  void dropdownSelected(value) {
    state.selectedValue = value.toString();
    List<EmployeeData> employeeList = List<EmployeeData>.from(state.employeeList);
    employeeList = value == "All" ? employeeList : employeeList.where((e) => e.department == value).toList();
    emit(state.copyWith(selectedValue: value.toString(), filtterdUserList: employeeList));
  }

  void runFilter(String query) {
    List<EmployeeData> employeeList = List<EmployeeData>.from(state.employeeList);
    employeeList = employeeList
        .where((e) =>
            e.name.toLowerCase().contains(query.toLowerCase()) || e.email.toLowerCase().contains(query.toLowerCase()))
        .toList();

    emit(state.copyWith(filtterdUserList: employeeList));
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
    name: "Deep Jitandrabhai Vaghani",
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
    name: "Kuldeep Ghoghari",
    role: "Flutter trainee",
    location: "Katargam",
    department: "Android/Flutter",
    email: "kuldeep.g@elaunchinfotech.in",
    number: "7542541245",
  ),
  EmployeeData(
    name: "Pritesh Dineshbhai Tala",
    role: "Flutter trainee",
    location: "Katargam",
    department: "PHP",
    email: "pritesh.t@elaunchinfotech.in",
    number: "9510670968",
  ),
];
