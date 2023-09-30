// ignore_for_file: must_be_immutable
import 'package:equatable/equatable.dart';
import 'package:finaldemo/keka_project/model/department_model/department_model.dart';
import 'package:finaldemo/keka_project/model/get_api_model/get_api_model.dart';
import 'package:flutter/material.dart';

class EmployeeDetailsState extends Equatable {
  @override
  List<Object?> get props => [selectedValue, filterDepartmentList, selectedValue, filtterdUserList, employeeList];

  List<Department> filterDepartmentList;
  List<Employee> employeeList;
  List<Employee> filtterdUserList;
  List<Department> departmentList;
  TextEditingController searchController;
  Department? selectedValue;
  bool? hasError;

  EmployeeDetailsState({
    this.filterDepartmentList = const [],
    this.employeeList = const [],
    this.filtterdUserList = const [],
    this.departmentList = const [],
    required this.searchController,
    this.selectedValue,
    this.hasError = false,
  });

  EmployeeDetailsState copyWith({
    List<Department>? filterDepartmentList,
    List<Employee>? employeeList,
    List<Employee>? filtterdUserList,
    List<Department>? departmentList,
    TextEditingController? searchController,
    Department? selectedValue,
    bool? hasError,
  }) {
    return EmployeeDetailsState(
      filterDepartmentList: filterDepartmentList ?? this.filterDepartmentList,
      employeeList: employeeList ?? this.employeeList,
      filtterdUserList: filtterdUserList ?? this.filtterdUserList,
      searchController: searchController ?? this.searchController,
      selectedValue: selectedValue ?? this.selectedValue,
      departmentList: departmentList ?? this.departmentList,
      hasError: hasError ?? this.hasError,
    );
  }
}
