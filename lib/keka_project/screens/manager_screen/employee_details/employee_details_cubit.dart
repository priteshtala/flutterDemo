import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:finaldemo/keka_project/model/department_model/department_model.dart';
import 'package:finaldemo/keka_project/model/get_api_model/get_api_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'employee_details_state.dart';

class EmployeeDetailsCubit extends Cubit<EmployeeDetailsState> {
  EmployeeDetailsCubit()
      : super(
          EmployeeDetailsState(
            searchController: TextEditingController(),
            // filterDepartmentList: [
            //   Department(department: "All"),
            //   Department(department: "Flutter"),
            //   Department(department: "Android"),
            //   Department(department: "Animals"),
            //   Department(department: "Anime"),
            //   Department(department: "NodeJs"),
            //   Department(department: "IOS"),
            //   Department(department: "ReactJS"),
            // ],
          ),
        );

  // void dropdownSelected(value) {
  //   state.selectedValue = value.toString();
  //   List<Employee> filtterdUserList = List<Employee>.from(state.filtterdUserList);
  //   List<Employee> employeeList = List<Employee>.from(state.employeeList);
  //   filtterdUserList = value.toString().isEmpty ? state.employeeList :
  //   filtterdUserList = value == "All" ? employeeList : employeeList.where((e) => e.department == value).toList();
  //   emit(state.copyWith(selectedValue: value.toString(), filtterdUserList: filtterdUserList));
  // }

  // void runFilter(String query) {
  //   List<Employee> filtterdUserList = List<Employee>.from(state.filtterdUserList);
  //   List<Employee> employeeList = List<Employee>.from(state.employeeList);
  //   filtterdUserList = query.isEmpty
  //       ? state.employeeList
  //       : employeeList.where((e) {
  //           return e.category.toString().toLowerCase().contains(query.toLowerCase());
  //         }).toList();
  //
  //   emit(state.copyWith(filtterdUserList: filtterdUserList));
  // }

  void getApi() async {
    final response = await Dio().get("https://e9af-136-232-118-126.ngrok-free.app/api/user");
    var animalList = List<Employee>.from(state.filtterdUserList);
    if (response.statusCode == 200) {
      var data = response.data;
      print("object=d=a=======${data}");
      for (var entry in data) {
        animalList.add(Employee.fromJson(entry));
      }
    } else {
      Text("No-Data");
    }
    emit(state.copyWith(filtterdUserList: animalList, employeeList: animalList));
  }
}
