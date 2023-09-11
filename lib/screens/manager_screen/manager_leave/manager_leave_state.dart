import 'package:equatable/equatable.dart';
import 'package:finaldemo/keka_project/model/leave_model/leave_model.dart';
import 'package:flutter/material.dart';

class ManagerScreenState extends Equatable {
  @override
  List<Object?> get props => [empList];

  List<Leave> empList = [];
  TextEditingController dateController = TextEditingController();

  ManagerScreenState({required this.empList, required this.dateController});

  ManagerScreenState copyWith({
    List<Leave>? empList,
    TextEditingController? dateController,
  }) {
    return ManagerScreenState(
      empList: empList ?? this.empList,
      dateController: dateController ?? this.dateController,
    );
  }
}
