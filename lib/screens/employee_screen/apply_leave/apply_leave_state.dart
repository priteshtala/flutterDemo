import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../../keka_project/model/department_model/department_model.dart';
import '../../../keka_project/model/employee_model/employee_model.dart';

class ApplyLeaveState extends Equatable {
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
        setSelectedEmployee
      ];
  TextEditingController searchController;
  TextEditingController dateController;
  TextEditingController dateTimeController;
  TextEditingController reasonController;
  List<Department> departmentList;
  List<EmployeeData> employeeList;
  List<EmployeeData> filtterdUserList;
  EmployeeData? setSelectedEmployee;
  bool? isSearch;

  ApplyLeaveState({
    this.isSearch,
    this.setSelectedEmployee,
    required this.dateController,
    required this.dateTimeController,
    required this.reasonController,
    required this.searchController,
    this.departmentList = const [],
    this.employeeList = const [],
    this.filtterdUserList = const [],
  });

  ApplyLeaveState copyWith({
    TextEditingController? searchController,
    TextEditingController? dateController,
    TextEditingController? dateTimeController,
    TextEditingController? reasonController,
    List<Department>? departmentList,
    List<EmployeeData>? employeeList,
    List<EmployeeData>? filtterdUserList,
    EmployeeData? setSelectedEmployee,
    bool? isSearch,
  }) {
    return ApplyLeaveState(
      searchController: searchController ?? this.searchController,
      dateController: dateController ?? this.dateController,
      dateTimeController: dateTimeController ?? this.dateTimeController,
      reasonController: reasonController ?? this.reasonController,
      departmentList: departmentList ?? this.departmentList,
      employeeList: employeeList ?? this.employeeList,
      filtterdUserList: filtterdUserList ?? this.filtterdUserList,
      setSelectedEmployee: setSelectedEmployee ?? this.setSelectedEmployee,
      isSearch: isSearch ?? this.isSearch,
    );
  }
}
