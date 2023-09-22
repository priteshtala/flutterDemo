import 'package:equatable/equatable.dart';
import 'package:finaldemo/keka_project/model/department_model/department_model.dart';
import 'package:flutter/material.dart';

class DepartmentDetailsState extends Equatable {
  @override
  List<Object?> get props => [departmentList, leaveSearchList, staticList, departmentController];
  final TextEditingController departmentController;
  final List<Department> departmentList;
  final List<Department> leaveSearchList;
  final List<Department> staticList;

  DepartmentDetailsState({
    required this.departmentController,
    this.departmentList = const [],
    this.leaveSearchList = const [],
    this.staticList = const [],
  });

  DepartmentDetailsState copyWith({
    TextEditingController? departmentController,
    List<Department>? departmentList,
    List<Department>? leaveSearchList,
    List<Department>? staticList,
  }) {
    return DepartmentDetailsState(
      departmentController: departmentController ?? this.departmentController,
      departmentList: departmentList ?? this.departmentList,
      leaveSearchList: leaveSearchList ?? this.leaveSearchList,
      staticList: staticList ?? this.staticList,
    );
  }
}
