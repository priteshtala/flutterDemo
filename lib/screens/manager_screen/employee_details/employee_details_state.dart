import 'package:equatable/equatable.dart';
import 'package:finaldemo/keka_project/model/department_model/department_model.dart';
import 'package:finaldemo/keka_project/model/employee_model/employee_model.dart';
import 'package:flutter/material.dart';

class EmployeeDetailsState extends Equatable {
  @override
  List<Object?> get props => [selectedValue, departmentList, name, selectedValue, filtterdUserList];

  List<Department> departmentList;
  List<EmployeeData> employeeList;
  List<EmployeeData> filtterdUserList;
  final TextEditingController searchController;
  String? selectedValue;
  String? name;

  EmployeeDetailsState({
    this.departmentList = const [],
    this.employeeList = const [],
    this.selectedValue,
    this.name,
    this.filtterdUserList = const [],
    required this.searchController,
  });

  EmployeeDetailsState copyWith({
    List<Department>? dropDownList,
    String? selectedValue,
    List<EmployeeData>? employeeList,
    String? name,
    List<EmployeeData>? filtterdUserList,
    TextEditingController? searchController,
  }) {
    return EmployeeDetailsState(
      departmentList: dropDownList ?? this.departmentList,
      selectedValue: selectedValue ?? this.selectedValue,
      employeeList: employeeList ?? this.employeeList,
      name: name ?? this.name,
      filtterdUserList: filtterdUserList ?? this.filtterdUserList,
      searchController: searchController ?? this.searchController,
    );
  }
}
