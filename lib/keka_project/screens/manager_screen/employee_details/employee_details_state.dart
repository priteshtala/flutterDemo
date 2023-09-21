// ignore_for_file: must_be_immutable
import 'package:equatable/equatable.dart';
import 'package:finaldemo/keka_project/model/department_model/department_model.dart';
import 'package:finaldemo/keka_project/model/get_api_model/get_api_model.dart';
import 'package:flutter/material.dart';

class EmployeeDetailsState extends Equatable {
  @override
  List<Object?> get props => [selectedValue, filterDepartmentList, selectedValue, filtterdUserList,employeeList];

   List<Department> filterDepartmentList;
   List<Entry> employeeList;
   List<Entry> filtterdUserList;
   TextEditingController searchController;
   String? selectedValue;

  EmployeeDetailsState({
    this.filterDepartmentList = const [],
    this.employeeList = const [],
    this.selectedValue,
    this.filtterdUserList = const [],
    required this.searchController,
  });

  EmployeeDetailsState copyWith({
    List<Department>? filterDepartmentList,
    String? selectedValue,
    List<Entry>? employeeList,
    List<Entry>? filtterdUserList,
    TextEditingController? searchController,
  }) {
    return EmployeeDetailsState(
      filterDepartmentList: filterDepartmentList ?? this.filterDepartmentList,
      selectedValue: selectedValue ?? this.selectedValue,
      employeeList: employeeList ?? this.employeeList,
      filtterdUserList: filtterdUserList ?? this.filtterdUserList,
      searchController: searchController ?? this.searchController,
    );
  }
}
