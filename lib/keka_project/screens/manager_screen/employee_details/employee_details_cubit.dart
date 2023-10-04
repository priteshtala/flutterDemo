import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:finaldemo/keka_project/model/department_model/department_model.dart';
import 'package:finaldemo/keka_project/model/get_api_model/get_api_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'employee_details_state.dart';

class EmployeeDetailsCubit extends Cubit<EmployeeDetailsState> {
  EmployeeDetailsCubit(super.initialState);

  String baseurl = "https://57af-136-232-118-126.ngrok-free.app";

  void dropdownSelected(Department value) {
    List<Employee> filtterdUserList = List<Employee>.from(state.filtterdUserList);
    filtterdUserList =
        value.id == 0 ? state.employeeList : state.employeeList.where((e) => e.departmentId == value.id).toList();
    emit(state.copyWith(selectedValue: value, filtterdUserList: filtterdUserList,employeeList: filtterdUserList));
  }

  void runFilter(String query) {
    List<Employee> filtterdUserList = List<Employee>.from(state.filtterdUserList);
    List<Employee> employeeList = List<Employee>.from(state.employeeList);
    filtterdUserList = query.isEmpty
        ? state.employeeList
        : employeeList.where((e) {
            return e.name.toString().toLowerCase().contains(query.toLowerCase());
          }).toList();

    emit(state.copyWith(filtterdUserList: filtterdUserList));
  }

  void getEmployeeApi() async {
    final response = await Dio().get("$baseurl/api/user");
    var employeeDetails = List<Employee>.from(state.filtterdUserList);
    if (response.statusCode == 200) {
      var data = response.data;
      for (var entry in data) {
        employeeDetails.add(Employee.fromJson(entry));
        employeeDetails.sort(
          (a, b) => a.name.compareTo(b.name),
        );
      }
    } else {
      Text("No-Data");
    }
    emit(state.copyWith(filtterdUserList: employeeDetails, employeeList: employeeDetails));
  }

  void getDepartmentApi() async {
    final response = await Dio().get("$baseurl/api/department");
    var DepartmentListData = List<Department>.from(state.departmentList);
    if (response.statusCode == 200) {
      var data = response.data;
      for (var entry in data) {
        DepartmentListData.add(Department.fromJson(entry));
      }
      DepartmentListData.insert(0, Department(id: 0, name: "All", createAt: '', updateAt: ''));
    } else {
      Text("No-Data");
    }
    emit(state.copyWith(departmentList: DepartmentListData, filterDepartmentList: DepartmentListData));
  }

  refresh() {
    var refresh = state.hasError = false;
    state.filtterdUserList.clear();
    emit(state.copyWith(hasError: refresh));
    return getEmployeeApi();
  }
}
