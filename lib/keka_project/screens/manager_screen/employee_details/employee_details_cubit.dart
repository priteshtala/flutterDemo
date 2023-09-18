import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:finaldemo/keka_project/model/department_model/department_model.dart';
import 'package:finaldemo/keka_project/model/employee_model/employee_model.dart';
import 'package:finaldemo/keka_project/model/get_api_model/get_api_model.dart';
import 'package:flutter/cupertino.dart';
import 'employee_details_state.dart';

class EmployeeDetailsCubit extends Cubit<EmployeeDetailsState> {
  EmployeeDetailsCubit()
      : super(
          EmployeeDetailsState(
            searchController: TextEditingController(),
            filterDepartmentList: [
              Department(department: "All"),
              Department(department: "Flutter"),
              Department(department: "Android"),
              Department(department: "Laravel"),
              Department(department: "PHP"),
              Department(department: "NodeJs"),
              Department(department: "IOS"),
              Department(department: "ReactJS"),
            ],
          ),
        );

  void dropdownSelected(value) {
    state.selectedValue = value.toString();
    List<Entry> employeeList = List<Entry>.from(state.employeeList);
    employeeList = value == "All" ? employeeList : employeeList.where((e) => e.category == value).toList();
    emit(state.copyWith(selectedValue: value.toString(), filtterdUserList: employeeList));
  }

  void runFilter(String query) {
    List<Entry> employeeList = List<Entry>.from(state.employeeList);
    employeeList = employeeList
        .where((e) =>
            e.category.toString().toLowerCase().contains(query.toLowerCase()) || e.description.toString().toLowerCase().contains(query.toLowerCase()))
        .toList();

    emit(state.copyWith(filtterdUserList: employeeList));
  }

  void getApi() async {
    final response = await Dio().get("https://api.publicapis.org/entries");
    var animalList = List<Entry>.from(state.filtterdUserList);
    if (response.statusCode == 200) {
      var data = response.data['entries'];
      for (var entry in data) {
        animalList.add(Entry.fromJson(entry));
      }
    } else {
      throw Exception("Data not Found");
    }
    emit(state.copyWith(filtterdUserList: animalList));
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
