import 'package:equatable/equatable.dart';
import 'package:finaldemo/keka_project/model/leave_model/leave_model.dart';
import 'package:flutter/material.dart';

class EmployeeScreenState extends Equatable {
  @override
  List<Object?> get props => [empList];

  List<Leave> empList = [];
  TextEditingController dateController = TextEditingController();

  EmployeeScreenState({required this.empList, required this.dateController});

  EmployeeScreenState copyWith({
    List<Leave>? empList,
    TextEditingController? dateController,
  }) {
    return EmployeeScreenState(
      empList: empList ?? this.empList,
      dateController: dateController ?? this.dateController,
    );
  }
}
