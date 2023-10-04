// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:finaldemo/keka_project/common/const.dart';
import 'package:finaldemo/keka_project/model/department_model/department_model.dart';
import 'package:finaldemo/keka_project/model/get_api_model/get_api_model.dart';
import 'package:finaldemo/keka_project/model/login_details/login_details.dart';
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
        notifyEmployee,
        isSearch,
        profile,
        loginData,
        name,
        id,
      ];
  TextEditingController searchController;
  TextEditingController dateController;
  TextEditingController dateTimeController;
  TextEditingController reasonController;
  List<Department> departmentList;
  List<Employee> employeeList;
  List<Employee> filtterdUserList;
  List<Employee> notifyEmployee;
  bool? isSearch;
  Profile? profile;
  EmployeeLoginDetails? loginData;
  String? name;
  int? id;

  AddLeaveState({
    required this.searchController,
    required this.dateController,
    required this.dateTimeController,
    required this.reasonController,
    this.departmentList = const [],
    this.employeeList = const [],
    this.filtterdUserList = const [],
    this.notifyEmployee = const [],
    this.isSearch,
    this.profile,
    this.loginData,
    this.name,
    this.id,
  });

  AddLeaveState copyWith({
    TextEditingController? searchController,
    TextEditingController? dateController,
    TextEditingController? dateTimeController,
    TextEditingController? reasonController,
    List<Department>? departmentList,
    List<Employee>? employeeList,
    List<Employee>? filtterdUserList,
    List<Employee>? notifyEmployee,
    bool? isSearch,
    Profile? profile,
    EmployeeLoginDetails? loginData,
    String? name,
    int? id,
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
      profile: profile ?? this.profile,
      loginData: loginData ?? this.loginData,
      name: name ?? this.name,
      id: id ?? this.id,
    );
  }
}
