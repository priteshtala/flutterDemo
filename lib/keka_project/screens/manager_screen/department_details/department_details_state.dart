import 'package:equatable/equatable.dart';
import 'package:finaldemo/keka_project/model/department_model/department_model.dart';
import 'package:flutter/material.dart';

class DepartmentDetailsState extends Equatable {
  @override
  List<Object?> get props => [departmentList, leaveSearchList, staticList, departmentController];
  final List<Department> departmentList;
  final TextEditingController departmentController;
  final List<Department> leaveSearchList;
  final List<Department> staticList;

  DepartmentDetailsState(
      { this.departmentList = const [],
      this.leaveSearchList = const [],
      this.staticList = const [],
      required this.departmentController});

  DepartmentDetailsState copyWith({
    List<Department>? departmentList,
    List<Department>? leaveSearchList,
    List<Department>? staticList,
    TextEditingController? departmentController,
  }) {
    return DepartmentDetailsState(
      departmentList: departmentList ?? this.departmentList,
      leaveSearchList: leaveSearchList ?? this.leaveSearchList,
      staticList: staticList ?? this.staticList,
      departmentController: departmentController ?? this.departmentController,
    );
  }
}
