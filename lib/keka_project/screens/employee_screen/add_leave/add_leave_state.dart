// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:finaldemo/keka_project/model/department_model/department_model.dart';
import 'package:finaldemo/keka_project/model/employee_model/employee_model.dart';
import 'package:flutter/cupertino.dart';



class AddLeaveState extends Equatable {
  @override
  List<Object?> get props => [
        searchController,
        dateController,
        dateTimeController,
        reasonController,
        departmentList,
        employeeList,
        filtterdUserList,
        isSearch,
        notifyEmployee
      ];
  TextEditingController searchController;
  TextEditingController dateController;
  TextEditingController dateTimeController;
  TextEditingController reasonController;
  List<Department> departmentList;
  List<EmployeeData> employeeList;
  List<EmployeeData> filtterdUserList;
  List<EmployeeData> notifyEmployee;
  bool? isSearch;

  AddLeaveState({
    this.isSearch,
    this.notifyEmployee = const [],
    required this.dateController,
    required this.dateTimeController,
    required this.reasonController,
    required this.searchController,
    this.departmentList = const [],
    this.employeeList = const [],
    this.filtterdUserList = const [],
  });

  AddLeaveState copyWith({
    TextEditingController? searchController,
    TextEditingController? dateController,
    TextEditingController? dateTimeController,
    TextEditingController? reasonController,
    List<Department>? departmentList,
    List<EmployeeData>? employeeList,
    List<EmployeeData>? filtterdUserList,
    List<EmployeeData>? notifyEmployee,
    bool? isSearch,
  }) {
    return AddLeaveState(
      searchController: searchController ?? this.searchController,
      dateController: dateController ?? this.dateController,
      dateTimeController: dateTimeController ?? this.dateTimeController,
      reasonController: reasonController ?? this.reasonController,
      departmentList: departmentList ?? this.departmentList,
      employeeList: employeeList ?? this.employeeList,
      filtterdUserList: filtterdUserList ?? this.filtterdUserList,
      notifyEmployee: notifyEmployee ?? this.notifyEmployee,
      isSearch: isSearch ?? this.isSearch,
    );
  }
}
